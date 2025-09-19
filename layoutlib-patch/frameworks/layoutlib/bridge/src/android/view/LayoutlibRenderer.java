/*
 * Copyright (C) 2023 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.view;

import com.android.internal.lang.System_Delegate;

import android.content.Context;
import android.graphics.BlendMode;
import android.graphics.RecordingCanvas;
import android.graphics.Paint;
import android.graphics.Color;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import com.android.layoutlib.bridge.Bridge;
import com.android.ide.common.rendering.api.ILayoutLog;

public class LayoutlibRenderer extends ThreadedRenderer {

    private float scaleX = 1.0f;
    private float scaleY = 1.0f;
    @SuppressWarnings("unused") // Used by native code
    private long mNativeContext;
    /** Buffer in which the rendering will be drawn */
    private ByteBuffer mBuffer;

    LayoutlibRenderer(Context context, boolean translucent, String name) {
        super(context, translucent, name);
    }

    public void draw(ViewGroup viewGroup) {
        ViewRootImpl rootView = AttachInfo_Accessor.getRootView(viewGroup);
        if (rootView == null) {
            return;
        }
        // Animations require mDrawingTime to be set to animate
        rootView.mAttachInfo.mDrawingTime = System_Delegate.currentTimeMillis();
        this.draw(viewGroup, rootView.mAttachInfo,
                new DrawCallbacks() {
                    @Override
                    public void onPreDraw(RecordingCanvas canvas) {
                        // Bridge.getLog().warning(ILayoutLog.TAG_RTL_NOT_SUPPORTED, "pngcui --- onPreDraw", null, null);
                        AttachInfo_Accessor.dispatchOnPreDraw(viewGroup);
                        canvas.scale(scaleX, scaleY);
                        // This way we clear the native image buffer before drawing
                        canvas.drawColor(0, BlendMode.CLEAR);

                        if (canvas != null) {
                            Paint paint = new Paint();
                            paint.setColor(0xFFFF0000); // ARGB 红色
                            paint.setStrokeWidth(5f);
                            canvas.drawLine(10, 10, 100, 50, paint);
                            // Bridge.getLog().warning(ILayoutLog.TAG_RTL_NOT_SUPPORTED, "pngcui --- onPreDraw", null, null);
                        }
                    }

                    @Override
                    public void onPostDraw(RecordingCanvas canvas) {

                    }
                });
    }

    public void setScale(float scaleX, float scaleY) {
        this.scaleX = scaleX;
        this.scaleY = scaleY;
        invalidateRoot();
    }

    /**
     * Prepares the renderer for drawing
     */
    public void setup(int width, int height, View rootView) {
        ViewRootImpl viewRoot =  rootView.mAttachInfo.mViewRootImpl;
        if (viewRoot == null) {
            return;
        }

        // If the surface associated with the ViewRootImpl is not valid,
        // create a new one.
        if (!viewRoot.mSurface.isValid()) {
            Surface surface = nativeCreateSurface();
            viewRoot.mSurface.transferFrom(surface);
        }

        // Create a new buffer to draw the image in, making sure that it is following the native
        // ordering to work on all platforms.
        mBuffer = nativeCreateBuffer(width, height);
        mBuffer.order(ByteOrder.nativeOrder());

        setup(width, height, rootView.mAttachInfo, viewRoot.mWindowAttributes.surfaceInsets);
        setSurface(viewRoot.mSurface);
    }

    public ByteBuffer getBuffer() {
        return mBuffer;
    }

    public void reset() {
        mBuffer = null;
    }

    @Override
    public void destroy() {
        nativeDestroy();
        super.destroy();
    }

    private native Surface nativeCreateSurface();

    private native ByteBuffer nativeCreateBuffer(int width, int height);

    private native void nativeDestroy();
}

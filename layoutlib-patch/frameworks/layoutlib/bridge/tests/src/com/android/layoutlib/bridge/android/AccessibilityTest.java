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

package com.android.layoutlib.bridge.android;

import com.android.ide.common.rendering.api.RenderSession;
import com.android.ide.common.rendering.api.Result;
import com.android.ide.common.rendering.api.SessionParams;
import com.android.ide.common.rendering.api.SessionParams.RenderingMode;
import com.android.ide.common.rendering.api.ViewInfo;
import com.android.layoutlib.bridge.Bridge;
import com.android.layoutlib.bridge.intensive.LayoutLibTestCallback;
import com.android.layoutlib.bridge.intensive.setup.ConfigGenerator;
import com.android.layoutlib.bridge.intensive.setup.LayoutPullParser;

import org.junit.BeforeClass;
import org.junit.Test;

import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityInteractionClient;
import android.view.accessibility.AccessibilityNodeInfo;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class AccessibilityTest extends RenderTestBase {
    @BeforeClass
    public static void setUp() {
        Bridge.prepareThread();
    }

    @Test
    public void accessibilityNodeInfoCreation() throws ClassNotFoundException {
        LayoutPullParser parser = createParserFromPath("allwidgets.xml");
        LayoutLibTestCallback layoutLibCallback =
                new LayoutLibTestCallback(getLogger(), mDefaultClassLoader);
        layoutLibCallback.initResources();
        SessionParams params = getSessionParamsBuilder()
                .setParser(parser)
                .setConfigGenerator(ConfigGenerator.NEXUS_5)
                .setCallback(layoutLibCallback)
                .build();
        RenderSession session = sBridge.createSession(params);
        session.setElapsedFrameTimeNanos(1);
        try {
            Result renderResult = session.render(50000);
            assertTrue(renderResult.isSuccess());
            assertEquals(0, AccessibilityInteractionClient.sConnectionCache.size());
            session.execute(() -> {
                View rootView = (View) session.getSystemRootViews().get(0).getViewObject();
                AccessibilityNodeInfo rootNode = rootView.createAccessibilityNodeInfo();
                assertNotNull(rootNode);
                rootNode.setQueryFromAppProcessEnabled(rootView, true);
                assertEquals(37, rootNode.getChildCount());
                AccessibilityNodeInfo child = rootNode.getChild(0);
                assertNotNull(child);
                assertEquals(147, child.getBoundsInScreen().right);
                assertEquals(274, child.getBoundsInScreen().bottom);
            });
        } finally {
            session.dispose();
        }
    }

    @Test
    public void customHierarchyParserTest() throws ClassNotFoundException {
        LayoutPullParser parser = createParserFromPath("allwidgets.xml");
        LayoutLibTestCallback layoutLibCallback =
                new LayoutLibTestCallback(getLogger(), mDefaultClassLoader);
        layoutLibCallback.initResources();
        SessionParams params = getSessionParamsBuilder()
                .setParser(parser)
                .setConfigGenerator(ConfigGenerator.NEXUS_5)
                .setCallback(layoutLibCallback)
                .build();
        params.setCustomContentHierarchyParser(viewObject -> {
            List<ViewInfo> result = new ArrayList<>();
            if (viewObject instanceof ViewGroup view) {
                for (int i = 0; i < view.getChildCount(); i++) {
                    View child = view.getChildAt(i);
                    ViewInfo childInfo =
                            new ViewInfo(child.toString(), null, child.getLeft(), child.getTop(),
                                    child.getRight(), child.getBottom(), child,
                                    child.createAccessibilityNodeInfo(), null);
                    childInfo.setChildren(null);
                    result.add(childInfo);
                }
            }
            return result;
        });
        RenderSession session = sBridge.createSession(params);
        session.setElapsedFrameTimeNanos(1);
        try {
            Result renderResult = session.render(50000);
            assertTrue(renderResult.isSuccess());
            ViewInfo contentRootViewInfo = session.getRootViews().get(0);
            contentRootViewInfo.getChildren().forEach(child -> {
                assertNotNull(child.getAccessibilityObject());
                assertEquals(0, child.getChildren().size());
            });
        } finally {
            session.dispose();
        }
    }

    @Test
    public void testDialogAccessibility() throws Exception {
        String layout = """
                <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
                              android:padding="16dp"
                              android:orientation="horizontal"
                              android:layout_width="fill_parent"
                              android:layout_height="fill_parent">
                    <com.android.layoutlib.test.myapplication.widgets.DialogView
                             android:layout_height="wrap_content"
                             android:layout_width="wrap_content" />
                </LinearLayout>
                """;
        LayoutPullParser parser = LayoutPullParser.createFromString(layout);
        // Create LayoutLibCallback.
        LayoutLibTestCallback layoutLibCallback =
                new LayoutLibTestCallback(getLogger(), mDefaultClassLoader);
        layoutLibCallback.initResources();
        SessionParams params = getSessionParamsBuilder()
                .setParser(parser)
                .setCallback(layoutLibCallback)
                .setTheme("Theme.Material.Light.NoActionBar.Fullscreen", false)
                .setRenderingMode(RenderingMode.V_SCROLL)
                .disableDecoration()
                .build();
        RenderSession session = sBridge.createSession(params);
        session.setElapsedFrameTimeNanos(1);
        try {
            Result renderResult = session.render(50000);
            assertTrue(renderResult.isSuccess());
            assertEquals(0, AccessibilityInteractionClient.sConnectionCache.size());
            View rootView =
                    (View)((View) session.getSystemRootViews().get(1).getViewObject()).getParent();
            int[] counter = {0};
            session.execute(() -> {
                AccessibilityNodeInfo rootNode = rootView.createAccessibilityNodeInfo();
                assertNotNull(rootNode);
                rootNode.setQueryFromAppProcessEnabled(rootView, true);
                traverseAccessibilityTree(rootNode, counter);
            });
            assertEquals(0, AccessibilityInteractionClient.sConnectionCache.size());
            assertEquals(17, counter[0]);
        } finally {
            session.dispose();
        }
    }

    private void traverseAccessibilityTree(AccessibilityNodeInfo node, int[] counter) {
        int childrenSize = node.getChildCount();
        for (int i = 0; i < childrenSize; i++) {
            AccessibilityNodeInfo child = node.getChild(i);
            counter[0]++;
            traverseAccessibilityTree(child, counter);
        }
    }
}

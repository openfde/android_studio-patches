/*
 * Copyright (C) 2011 The Android Open Source Project
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

package com.android.layoutlib.bridge.bars;

import com.android.layoutlib.bridge.android.BridgeContext;
import com.android.layoutlib.bridge.impl.ResourceHelper;
import com.android.resources.Density;

import android.util.DisplayMetrics;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import static com.android.layoutlib.bridge.bars.Config.getNavIconType;

public class NavigationBar extends CustomBar {

    /** Navigation bar background color attribute name. */
    private static final String ATTR_COLOR = "navigationBarColor";
    /** Attribute for translucency property. */
    public static final String ATTR_TRANSLUCENT = "windowTranslucentNavigation";
    // These correspond to @dimen/navigation_side_padding in the system ui code.
    private static final int PADDING_WIDTH_DEFAULT = 36;
    private static final int PADDING_WIDTH_SW360 = 40;
    private static final int PADDING_WIDTH_SW400 = 50;
    // These corresponds to @dimen/navigation_key_width in the system ui code.
    private static final int WIDTH_DEFAULT = 36;
    private static final int WIDTH_SW360 = 40;
    private static final int WIDTH_SW600 = 48;
    private static final String LAYOUT_XML = "navigation_bar.xml";
    private static final String LAYOUT_600DP_XML = "navigation_bar600dp.xml";

    public NavigationBar(BridgeContext context, Density density, int orientation, boolean isRtl,
            boolean rtlEnabled, boolean isEdgeToEdge, int simulatedPlatformVersion,
            boolean quickStepEnabled) {
        this(context, density, orientation, isRtl, rtlEnabled, isEdgeToEdge,
                simulatedPlatformVersion,
                getShortestWidth(context) >= 600 ? LAYOUT_600DP_XML : LAYOUT_XML, quickStepEnabled);
    }

    private NavigationBar(BridgeContext context, Density density, int orientation, boolean isRtl,
            boolean rtlEnabled, boolean isEdgeToEdge, int simulatedPlatformVersion,
            String layoutPath, boolean quickStepEnabled) {
        super(context, orientation, layoutPath, simulatedPlatformVersion);

        boolean isLightTheme =
                ResourceHelper.getBooleanThemeFrameworkAttrValue(context.getRenderResources(),
                        "isLightTheme", false);
        if (isEdgeToEdge) {
            setBackgroundColor(isLightTheme ? 0xe6ffffff : 0x66000000);
        } else {
            int color = getBarColor(ATTR_COLOR, ATTR_TRANSLUCENT);
            setBackgroundColor(color == 0 ? 0xFF000000 : color);
        }

        // Cannot access the inside items through id because no R.id values have been
        // created for them.
        // We do know the order though.
        // 0 is a spacer.
        int back = 1;
        int recent = 5;
        if (orientation == LinearLayout.VERTICAL || (isRtl && !rtlEnabled)) {
            // If RTL is enabled, then layoutlib mirrors the layout for us.
            back = 5;
            recent = 1;
        }

        int iconColor = isLightTheme ? DARK_ICON_COLOR : LIGHT_ICON_COLOR;
        String ext = getNavIconType(simulatedPlatformVersion);
        //noinspection SpellCheckingInspection
        loadIcon(back, (quickStepEnabled ? "ic_sysbar_back_quick_step." : "ic_sysbar_back.") + ext,
                density, isRtl, iconColor);
        //noinspection SpellCheckingInspection
        loadIcon(3, (quickStepEnabled ? "ic_sysbar_home_quick_step." : "ic_sysbar_home.") + ext,
                density, isRtl, iconColor);
        if (!quickStepEnabled) {
            //noinspection SpellCheckingInspection
            loadIcon(recent, "ic_sysbar_recent." + ext, density, isRtl, iconColor);
        }
        setupNavBar(context, orientation);
    }

    private void setupNavBar(BridgeContext context, int orientation) {
        float sw = getShortestWidth(context);
        View leftPadding = getChildAt(0);
        View rightPadding = getChildAt(6);
        setSize(context, leftPadding, orientation, getSidePadding(sw));
        setSize(context, rightPadding, orientation, getSidePadding(sw));
        int navButtonWidth = getWidth(sw);
        for (int i = 1; i < 6; i += 2) {
            View navButton = getChildAt(i);
            setSize(context, navButton, orientation, navButtonWidth);
        }
        if (sw >= 600) {
            setSize(context, getChildAt(2), orientation, 128);
            setSize(context, getChildAt(4), orientation, 128);
        }
    }

    private static void setSize(BridgeContext context, View view, int orientation, int size) {
        size = (int) (size * context.getMetrics().density);
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (orientation == HORIZONTAL) {
            layoutParams.width = size;
        } else {
            layoutParams.height = size;
        }
        view.setLayoutParams(layoutParams);
    }

    private int getSidePadding(float sw) {
        if (sw >= 400) {
            return PADDING_WIDTH_SW400;
        }
        if (sw >= 360) {
            return PADDING_WIDTH_SW360;
        }
        return PADDING_WIDTH_DEFAULT;
    }

    private static int getWidth(float sw) {
        if (sw >= 600) {
            return WIDTH_SW600;
        }
        if (sw >= 360) {
            return WIDTH_SW360;
        }
        return WIDTH_DEFAULT;
    }

    private static float getShortestWidth(BridgeContext context) {
        DisplayMetrics metrics = context.getMetrics();
        float sw = Math.min(metrics.widthPixels, metrics.heightPixels);
        sw /= metrics.density;
        return sw;
    }

    @Override
    protected TextView getStyleableTextView() {
        return null;
    }
}

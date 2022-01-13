package com.example.flutter_native_android_work;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.ProgressiveMediaSource;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.ui.PlayerView;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.util.Util;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.npaw.youbora.lib6.exoplayer2.Exoplayer2Adapter;
import com.npaw.youbora.lib6.plugin.Options;
import com.npaw.youbora.lib6.plugin.Plugin;
//import com.pubmatic.sdk.common.POBError;
//import com.pubmatic.sdk.openwrap.banner.POBBannerView;
import com.pubmatic.sdk.openwrap.eventhandler.dfp.DFPBannerEventHandler;
import com.taboola.android.TaboolaWidget;
import com.taboola.android.utils.SdkDetailsHelper;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

class NativeView implements PlatformView {
    private final LinearLayout layout;

    NativeView(Context context, int id, Map<String, Object> creationParams) {
        layout = new LinearLayout(context);
        // textView.setTextSize(42);
        layout.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        // layout.setOrientation(FrameLayout.VERTICAL);

//Taboola Start
        TaboolaWidget
                taboolaWidget = new TaboolaWidget(context);
        int height = SdkDetailsHelper.getDisplayHeight(taboolaWidget.getContext()) * 2;
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height);
        taboolaWidget.setLayoutParams(params);
taboolaWidget.setLayoutParams(new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT));
       // frameLayout.addView(taboolaWidget);
        layout.addView(taboolaWidget);

        taboolaWidget.setPublisher("zeemedia-zeenewsenglishandroid")
                .setMode("thumbs-feed-01")
                .setPlacement("Below Article Thumbnails")
                .setPageUrl("https://zeenews.india.com/other-sports/neeraj-chopra-gained-close-to-12-kgs-after-olympics-gold-says-he-has-lost-5-kgs-in-last-three-weeks-2423883.html")
                .setPageType("article")
                .setTargetType("mix");
//fetch the content
        taboolaWidget.fetchContent();
        Log.d("testt", " " + taboolaWidget.setPublisher("zeemedia-zeenewsenglishandroid"));

       // Taboola End

    }

    @Override
    public View getView() {
        return layout;
    }

    @Override
    public void dispose() {
    }

}

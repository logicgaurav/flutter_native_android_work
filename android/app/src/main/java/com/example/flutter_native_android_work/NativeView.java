package com.example.flutter_native_android_work;


import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.ProgressiveMediaSource;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.MappingTrackSelector;
import com.google.android.exoplayer2.ui.PlayerView;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter;
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory;
import com.google.android.exoplayer2.util.Log;
import com.google.android.exoplayer2.util.Util;
import com.npaw.youbora.lib6.exoplayer2.Exoplayer2Adapter;
import com.npaw.youbora.lib6.plugin.Options;
import com.npaw.youbora.lib6.plugin.Plugin;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

class NativeView implements PlatformView {
    LinearLayout lin_lay;
    String CONTENT_URL = "https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4";
    private MappingTrackSelector.MappedTrackInfo mappedTrackInfo;
    DefaultTrackSelector trackSelectorDef;
    ExoPlayer player;
    PlayerView playerView;

    NativeView(Activity context, int id, Map<String, Object> creationParams) {

        LayoutInflater inflater = LayoutInflater.from(context);
        View v = inflater.inflate(R.layout.activity_mainn, null);
        playerView = v.findViewById(R.id.player_view);
        lin_lay = v.findViewById(R.id.lin_lay);

        lin_lay.setBackgroundColor(context.getResources().getColor(R.color.browser_actions_divider_color));

        trackSelectorDef = new DefaultTrackSelector();
        processQualityTracks(context);

    }

    void processQualityTracks(Activity context) {
        //   try {
        mappedTrackInfo = trackSelectorDef.getCurrentMappedTrackInfo();
        player = (new ExoPlayer.Builder(context))
                .setTrackSelector(trackSelectorDef).build();
        DefaultBandwidthMeter bandwidthMeter = new DefaultBandwidthMeter();

        DataSource.Factory dataSourceFactory = new DefaultDataSourceFactory(context,
                Util.getUserAgent(context, "Application Name"), bandwidthMeter);

        Uri uriOfContentUrl = Uri.parse(CONTENT_URL);

        MediaSource mediaSource = new ProgressiveMediaSource.Factory(dataSourceFactory).
                createMediaSource(uriOfContentUrl);  // creating a media source

        player.prepare(mediaSource);
        player.setPlayWhenReady(true); // start loading video and play it at the moment a chunk of it is available offline

        playerView.setPlayer(player); // attach surface to the view

        getYoubora(context);

       /* } catch (Exception e) {
            e.printStackTrace();
            Log.d("jjhjhj",""+e.getMessage());
        }*/
    }


    private void getYoubora(Activity ctx) {
        //   if (player != null && ctx instanceof MainActivity) {
        Options youboraOptions = new Options();
        youboraOptions.setAccountCode("zeenewsdev");
        Plugin youboraPlugin = new Plugin(youboraOptions, ctx);
        setOptions(youboraOptions, ctx);
        youboraPlugin.setActivity( ctx);
        Exoplayer2Adapter adapter = new Exoplayer2Adapter(player);
        adapter.setCustomEventLogger(trackSelectorDef);
        youboraPlugin.setAdapter(adapter);
    }
    //   }

    private void setOptions(Options youboraOptions, Context context) {
        //  if (cModel != null) {
        youboraOptions.setContentResource(CONTENT_URL);
        youboraOptions.setContentCustomDimension1("Zee News");
        youboraOptions.setContentCustomDimension2("Zee News" + " App");
        youboraOptions.setContentCustomDimension3("Gaurav");
        youboraOptions.setContentCustomDimension4("Gaurav");
        youboraOptions.setContentCustomDimension6("Gaurav");
        youboraOptions.setContentCustomDimension7("Gaurav");
        youboraOptions.setAppName("Zee News");
        youboraOptions.setContentId("Gaurav");
        youboraOptions.setContentTitle("Gaurav");
        youboraOptions.setContentLanguage("English");
        youboraOptions.setAppReleaseVersion(BuildConfig.VERSION_NAME);
//            youboraOptions.setHost(cModel.getWebsiteurl());
    }
    //  }

    @Override
    public View getView() {
        return lin_lay;
    }

    @Override
    public void dispose() {
    }

}
package com.example.flutter_native_android_work;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.Toast;

import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ui.PlayerView;
import com.vidgyor.livemidroll.callbacks.VidExoPlayerCallBack;
import com.vidgyor.livemidroll.vidgyorPlayerManager.PlayerManager;
import com.vidgyor.model.VidgyorYouboraModel;

import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.platform.PlatformView;

class NativeView implements PlatformView {


    private PlayerView playerView;
    private PlayerManager player;
    private boolean isInLandscape = false;
    private static boolean isInPIPMode = false;
    // private ConstraintLayout parentPlayerView;
    Context mContext;
    RelativeLayout rel_lay;

    NativeView(Context context, int id, Map<String, Object> creationParams) {

        LayoutInflater inflater = LayoutInflater.from(context);
        View v = inflater.inflate(R.layout.activity_livetv, null);
        rel_lay = v.findViewById(R.id.rel_lay);
        mContext = context;

      //  String channelName = mContext.getString(R.string.vid_channel_id_english);
       // channelName = getVidgyorLiveTVChannelId(mContext, "zeenews");

        // ZeeNewsApplication.getInstance().liveTVActivity = this;

//        if (ZeeNewsApplication.getInstance() != null && ZeeNewsApplication.getInstance().myChannel != null
//                && ZeeNewsApplication.getInstance().myChannel.getLanguageName() != null) {
      //  channelName = "zeebusiness";
        //   }

        playerView = v.findViewById(R.id.vid_player_view);
        //player = new PlayerManager(ActivityLiveTvVideoNew.this, playerView, channelName);

        // if (ZeeNewsApplication.getInstance() != null) {
        //     if (!ZeeNewsApplication.getInstance().languageChange) {
//        if(player!=null){
            player = new PlayerManager(mContext,
                    playerView, "zeenewsenglish", null);
//        }else {
//            Toast.makeText(context, "Failed", Toast.LENGTH_LONG).show();
//        }

//            }
//        }

        // parentPlayerView = v.findViewById(R.id.constraintLayout);

//        RelativeLayout.LayoutParams lp = (RelativeLayout.LayoutParams) parentPlayerView.getLayoutParams();
//        lp.height = (int) (getDisplayMetrics((Activity) context).heightPixels * 0.32);
//        parentPlayerView.setLayoutParams(lp);
//        parentPlayerView.setMaxHeight((int) (getDisplayMetrics((Activity) context).heightPixels * 0.32));

        if (player != null) {
            player.isInLandscape(false, false);
            player.setExoPlayerCallBack(new VidExoPlayerCallBack() {
                @Override
                public void onLandScape() {

                }

                @Override
                public void onPortrait() {

                }

                @Override
                public void onPlayerPause() {

                }

                @Override
                public void onPlayerPlay() {

                }

                @Override
                public void onPlayerStateChanged(boolean playWhenReady, String playbackState) {

                }

                @Override
                public void onLoadingChanged(boolean isLoading) {

                }

                @Override
                public void onPlayerError(ExoPlaybackException error) {

                }

                @Override
                public void onError(Exception e) {
                    Log.d("hfhmj", e.getMessage());
                }

                @Override
                public void onPreRollAdStarted() {

                }

                @Override
                public void onPreRollAdCompleted() {

                }

                @Override
                public void onPreRollAdSkipped() {
                }

                @Override
                public void onMidRollAdStarted() {

                }

                @Override
                public void onMidRollAdCompleted() {

                }

                @Override
                public void onMidRollAdSkipped() {

                }


                @Override
                public void onCastingStarted() {

                }

                @Override
                public void onCastingEnded() {

                }

                @Override
                public void onChangingPlayerMode(boolean isPlayingVideo) {

                    //Toast.makeText(ActivityLiveTvVideoNew.this, "IsPlayingVideo: "+isPlayingVideo, Toast.LENGTH_SHORT).show();
                }

            });
        }


    }

   /* private VidgyorYouboraModel createyouboraModel(){
        VidgyorYouboraModel
                vidgyorYouboraModel=new
                VidgyorYouboraModel();

       // if (!TextUtils.isEmpty(ZeeFireBaseUtils.getYouboraAccountCode())) {
//            vidgyorYouboraModel.setAccountCode("youboraAccountCode");
//        } else {
            vidgyorYouboraModel.setAccountCode("zeenews");
    //    }

        vidgyorYouboraModel.setAppName("Zee Business");

        vidgyorYouboraModel.setAppVersion(BuildConfig.VERSION_NAME);

        vidgyorYouboraModel.setLanguage("English");

        vidgyorYouboraModel.setWebsiteUrl("https://www.zeebiz.com");

        return vidgyorYouboraModel;
    }*/

    @Override
    public View getView() {
        return rel_lay;
    }

    @Override
    public void dispose() {
    }

    private VidgyorYouboraModel createyouboraModel() {
        VidgyorYouboraModel
                vidgyorYouboraModel = new
                VidgyorYouboraModel();


        vidgyorYouboraModel.setAccountCode("zeenews");
        //   }

        vidgyorYouboraModel.setAppName("Zee News");

        vidgyorYouboraModel.setAppVersion("2.3.0");

//        if (ZeeNewsApplication.getInstance() != null && ZeeNewsApplication.getInstance().myChannel != null && ZeeNewsApplication.getInstance().myChannel.getLanguageName() != null) {
//            vidgyorYouboraModel.setLanguage(ZeeNewsApplication.getInstance().myChannel.getLanguageName());
//        } else {
        vidgyorYouboraModel.setLanguage("English");
        //  }
        vidgyorYouboraModel.setWebsiteUrl("https://zeenews.india.com/");

        return vidgyorYouboraModel;
    }

    public static String getVidgyorLiveTVChannelId(Context context, String channelName) {
        String channelNameId = context.getString(R.string.vid_channel_id_english);
        switch (channelName) {
            case "English":
                channelNameId = context.getString(R.string.vid_channel_id_english);
                break;

        }
        return channelNameId;
    }

}
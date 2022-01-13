package com.example.flutter_native_android_work;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.pubmatic.sdk.common.POBError;
import com.pubmatic.sdk.openwrap.banner.POBBannerView;
import com.pubmatic.sdk.openwrap.eventhandler.dfp.DFPBannerEventHandler;

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
        getPubmatics(context);
        
    }

    private void getPubmatics(Context context) {
        AdSize customAdSize = new AdSize(300, 250);

        DFPBannerEventHandler eventHandler = new DFPBannerEventHandler(context,
                "/11440465/Zeebiz_AOS/Zeebiz_AOS_HP_ATF_300x250", customAdSize);

        POBBannerView banner = new POBBannerView(context,
                "158141",
                5777,
                "/11440465/Zeebiz_AOS/Zeebiz_AOS_HP_ATF_300x250",
                eventHandler);

// Log.d("ADSSS",""+ getPubmaticPublisherId(baseActivity)+"=="+getPubmaticProfileId(baseActivity)+"=="+
//                homeBannerAdsModel.getAdsid()+"=="+eventHandler );

        layout.addView(banner);

        // Call loadAd() on POBBannerView instance
        banner.loadAd();
        banner.setListener(new POBBannerViewListener(layout));
    }

    static class POBBannerViewListener extends POBBannerView.POBBannerViewListener {
        private final String TAG = "POBBannerViewListener";

        LinearLayout adslayout;

        //ZeeNewsTextView advertisementText;
        POBBannerViewListener(LinearLayout adslayout) {
            this.adslayout = adslayout;
            ///   this.advertisementText = advertisementText;
        }

        // Callback method Notifies that an ad has been successfully loaded and rendered.
        @Override
        public void onAdReceived(POBBannerView view) {
            Log.d(TAG, "Ad Received");
            try {
                if (adslayout != null) {
                    adslayout.removeAllViews();
                    adslayout.addView(view);
                    adslayout.setVisibility(View.VISIBLE);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        // Callback method Notifies an error encountered while loading or rendering an ad.
        @Override
        public void onAdFailed(POBBannerView view, POBError errorCode) {
            Log.e(TAG, errorCode.toString());
            if (adslayout != null) {
                adslayout.removeAllViews();
                adslayout.setVisibility(View.GONE);
                if (AdRequest.ERROR_CODE_INTERNAL_ERROR == errorCode.getErrorCode()) {
                    Log.e("errorCode", "ERROR_CODE_INTERNAL_ERROR : " + errorCode.getErrorCode());
                } else if (AdRequest.ERROR_CODE_INVALID_REQUEST == errorCode.getErrorCode()) {
                    Log.e("errorCode", "ERROR_CODE_INVALID_REQUEST : " + errorCode.getErrorCode());
                } else if (AdRequest.ERROR_CODE_NETWORK_ERROR == errorCode.getErrorCode()) {
                    Log.e("errorCode", "ERROR_CODE_NETWORK_ERROR : " + errorCode.getErrorCode());
                } else if (AdRequest.ERROR_CODE_NO_FILL == errorCode.getErrorCode()) {
                    Log.e("errorCode", "ERROR_CODE_NO_FILL : " + errorCode.getErrorCode());
                }
                //Log.d("bannerAds", "onAdFailedToLoad" + "|nanoTime:-" + nanoTime + "");
            }
        }

        // Callback method Notifies whenever current app goes in the background due to user click
        @Override
        public void onAppLeaving(POBBannerView view) {
            Log.d(TAG, "App Leaving");
        }

        // Callback method Notifies that the banner ad view will launch a dialog on top of the current view
        @Override
        public void onAdOpened(POBBannerView view) {
            Log.d(TAG, "Ad Opened");
        }

        // Callback method Notifies that the banner ad view has dismissed the modal on top of the current view
        @Override
        public void onAdClosed(POBBannerView view) {
            Log.d(TAG, "Ad Closed");
        }

    }

    @Override
    public View getView() {
        return layout;
    }

    @Override
    public void dispose() {
    }
}
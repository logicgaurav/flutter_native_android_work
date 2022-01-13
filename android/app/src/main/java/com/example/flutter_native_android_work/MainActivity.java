package com.example.flutter_native_android_work;

import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.taboola.android.TaboolaWidget;
import com.taboola.android.utils.SdkDetailsHelper;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "Gaurav";
//    private static final String CHANNEL1 = "Gaurav1";
    // Declare a class member instance TaboolaWidget

//    private TaboolaWidget taboolaWidget;

   /* @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            // TODO
                            if (call.method.equals("getUserName")) {
                                result.success("getMessage()");

                            }
                        }
                );
    }

    */

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        flutterEngine
                .getPlatformViewsController()
                .getRegistry()
                .registerViewFactory("view1", new NativeViewFactory());

      /*  new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            // TODO
                            if (call.method.equals("getUserName")) {
                                result.success(getMessage());

                            }
                        }
                );*/
    }

    private Object getMessage() {
        Toast.makeText(getApplicationContext(), "dfhfhfh", Toast.LENGTH_SHORT).show();
        //Taboola Start
        LinearLayout layout = new LinearLayout(getApplicationContext());
        // textView.setTextSize(42);
        layout.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        TaboolaWidget
                taboolaWidget = new TaboolaWidget(getApplicationContext());
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
        return null;
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////

}

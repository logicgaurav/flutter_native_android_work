package com.example.flutter_native_android_work;

import io.flutter.plugin.platform.PlatformViewFactory;

import android.app.Activity;
import android.content.Context;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.Map;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;

class NativeViewFactory extends PlatformViewFactory {

    Activity activity;

    NativeViewFactory(Activity activity) {
        super(StandardMessageCodec.INSTANCE);
        this.activity = activity;
    }

    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        return new NativeView(activity, id, creationParams);
    }
}
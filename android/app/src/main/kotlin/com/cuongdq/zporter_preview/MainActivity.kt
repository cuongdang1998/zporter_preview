package com.cuongdq.zporter_preview

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import com.cuongdq.zporter_preview.BuildConfig.FLAVOR

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor, "flavor").setMethodCallHandler { _, result -> result.success(FLAVOR) }
    }
}

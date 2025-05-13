package com.example.infytel_test

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.netcore.smartech_base.SmartechDeeplinkReceivers

class MainActivity: FlutterActivity() {
      override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        SmartechDeeplinkReceivers().onReceive(this, intent)
    }
}

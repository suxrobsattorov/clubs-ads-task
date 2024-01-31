package com.example.find_sport_task

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("659907d0-7141-4b2a-b5b2-e4260f05faab")
        super.configureFlutterEngine(flutterEngine)
    }
}

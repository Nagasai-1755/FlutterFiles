package com.example.watchlist_bloc


import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MyApplication : Application() {

    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
        flutterEngine = FlutterEngine(this)
        // Initialize plugins if needed
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
package com.example.methodchannel_watchlist_kotlin


import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import io.flutter.plugin.common.MethodChannel

import com.example.methodchannel_watchlist_kotlin.R.*

class MainActivity : AppCompatActivity() {

    private val CHANNEL = "login_channel"
    private lateinit var usernameEditText: EditText
    private lateinit var passwordEditText: EditText
    private lateinit var loginButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(layout.activity_login)

        // Initialize UI elements
        usernameEditText = findViewById(id.usernameEditText)
        passwordEditText = findViewById(id.passwordEditText)
        loginButton = findViewById(id.loginButton)

        // Set click listener for login button
        loginButton.setOnClickListener {
            val username = usernameEditText.text.toString()
            val password = passwordEditText.text.toString()

            // Perform login validation
            val success = performLogin(username, password)

            // Return result back to Flutter
            val result = mapOf("success" to success)
            val flutterEngine = (application as MyApplication).flutterEngine
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .invokeMethod("login_screen", result)
        }
    }

    private fun performLogin(username: String, password: String): Boolean {
        // Your login logic goes here
        // For demo purposes, let's consider a simple hardcoded check
        return username == "admin" && password == "password"
    }
}
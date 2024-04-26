package com.example.basic_widgets

// LoginActivity.kt

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity

class LoginActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val emailEditText = findViewById<EditText>(R.id.emailEditText)
        val passwordEditText = findViewById<EditText>(R.id.passwordEditText)
        val loginButton = findViewById<Button>(R.id.loginButton)

        loginButton.setOnClickListener {
            val email = emailEditText.text.toString()
            val password = passwordEditText.text.toString()

            // Call method to handle login
            handleLogin(email, password)
        }
    }

    private fun handleLogin(email: String, password: String) {
        // Perform login logic here
        // You can use shared preferences, database, or network call for authentication
        // For demonstration purposes, we'll just print the email and password
        println("Email: $email, Password: $password")
    }
}

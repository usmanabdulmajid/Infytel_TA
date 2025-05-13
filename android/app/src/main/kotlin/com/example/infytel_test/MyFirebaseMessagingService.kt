package com.example.infytel_test

import android.content.Context
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import com.netcore.android.smartechpush.SmartPush
import java.lang.ref.WeakReference

class MyFirebaseMessagingService : FirebaseMessagingService() {

    override fun onNewToken(token: String) {
        super.onNewToken(token)
        SmartPush.getInstance(WeakReference(applicationContext)).setDevicePushToken(token)
    }

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)
        
        val isPnHandledBySmartech: Boolean = SmartPush
            .getInstance(WeakReference(applicationContext))
            .handleRemotePushNotification(remoteMessage)

        if (!isPnHandledBySmartech) {
            // Handle the push notification here if it is not handled by Smartech
        }
    }
}

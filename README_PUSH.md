
# 🔔 Push Notification Setup

## Required Actions:

1. Merge the following dependencies into your `pubspec.yaml`:
   ```
   firebase_messaging: ^14.7.10
   flutter_local_notifications: ^17.1.0
   ```

2. Add `push_notification_service.dart` to `lib/services/`.

3. In `main.dart`, call the service:
   ```dart
   await PushNotificationService().init();
   ```

4. Update `AndroidManifest.xml` with:
   ```xml
   <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
   <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.WAKE_LOCK"/>

   <application>
     <service
         android:name="com.google.firebase.messaging.FirebaseMessagingService"
         android:exported="true">
         <intent-filter>
             <action android:name="com.google.firebase.MESSAGING_EVENT"/>
         </intent-filter>
     </service>
   </application>
   ```

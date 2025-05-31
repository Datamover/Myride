# 🚗 MyRide — Flutter-Based Ride Booking App

**MyRide** is a mobile ride-booking app built using Flutter and Firebase, inspired by services like Uber and Lyft. This MVP includes Firebase authentication, Google Maps integration, real-time location tracking, and a ride request feature using Firestore.

---

## 📱 Features

- 🔐 Email/Password Authentication with Firebase
- 🗺 Google Maps view of user’s current location
- 📍 Real-time location tracking using `location` package
- 🚕 Ride request button that writes to Firestore (`/rides` collection)
- 💬 Toast notification when a ride is requested

---

## 🔧 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Datamover/Myride.git
cd Myride
flutter pub get
```

### 2. Add Firebase Configuration

- Create a Firebase project at [https://console.firebase.google.com](https://console.firebase.google.com)
- Add an Android app with your app ID (e.g., `com.example.myride`)
- Download `google-services.json` and place it in:
  ```
  android/app/google-services.json
  ```

### 3. Set Up Google Maps

- Go to [https://console.cloud.google.com](https://console.cloud.google.com)
- Enable **Maps SDK for Android**
- Create an API key
- Replace `YOUR_GOOGLE_MAPS_API_KEY` in `AndroidManifest.xml`:
  ```xml
  <meta-data
      android:name="com.google.android.geo.API_KEY"
      android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
  ```

### 4. Run the App

On a connected Android device or emulator:
```bash
flutter run
```

---

## 📂 Folder Structure

```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   └── home_screen.dart
├── services/
│   └── auth_service.dart
```

---

## 🛠 Built With

- [Flutter](https://flutter.dev)
- [Firebase Auth](https://firebase.google.com/products/auth)
- [Cloud Firestore](https://firebase.google.com/products/firestore)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- [Location](https://pub.dev/packages/location)

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

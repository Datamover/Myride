import 'package:cloud_firestore/cloud_firestore.dart';

class RideService {
  final CollectionReference rides = FirebaseFirestore.instance.collection('rides');

  /// Request a ride by saving current location
  Future<void> requestRide(double lat, double lng) async {
    try {
      await rides.add({
        'userLocation': {'lat': lat, 'lng': lng},
        'status': 'requested',
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Ride requested.");
    } catch (e) {
      print("Error requesting ride: $e");
    }
  }

  /// Get all ride requests (e.g., for ride history)
  Stream<QuerySnapshot> getRideHistory() {
    return rides.orderBy('timestamp', descending: true).snapshots();
  }
}

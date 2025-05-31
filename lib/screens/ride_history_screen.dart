
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride History')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rides').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error loading ride history'));
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final rides = snapshot.data!.docs;
          if (rides.isEmpty) return Center(child: Text('No rides found.'));

          return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              final ride = rides[index];
              final data = ride.data() as Map<String, dynamic>;
              final origin = data['origin'] ?? 'Unknown';
              final destination = data['destination'] ?? 'Unknown';
              final time = (data['timestamp'] as Timestamp).toDate();

              return ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('$origin ➜ $destination'),
                subtitle: Text(time.toString()),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<String?> addPhone({
    required String phone,
    required String email,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('phone');
      // Call the user's CollectionReference to add a new user
      await users.doc(email).set({
        'phone': phone,
      });
      return 'success';
    } catch (e) {
      return 'Error adding phone';
    }
  }

  Future<String?> getUser(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }
}

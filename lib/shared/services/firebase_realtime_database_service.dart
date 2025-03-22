import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDatabaseService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<void> writeData(String path, Map<String, dynamic> data) async {
    try {
      await _databaseReference.child(path).set(data);
    } catch (e) {
      throw Exception("failed to write data: $e");
    }
  }

  Future<DataSnapshot> readData(String path) async {
    try {
      return await _databaseReference.child(path).get();
    } catch (e) {
      throw Exception("failed to read data: $e");
    }
  }

  Future<void> updateData(String path, Map<String, dynamic> data) async {
    try {
      await _databaseReference.child(path).update(data);
    } catch (e) {
      throw Exception("failed to update data: $e");
    }
  }

  Future<void> deleteData(String path) async {
    try {
      await _databaseReference.child(path).remove();
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }

  DatabaseReference listenToData(String path) {
    return _databaseReference.child(path);
  }
}

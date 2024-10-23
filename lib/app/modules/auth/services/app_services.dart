import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pomo/app/modules/auth/models/task.dart';
import 'package:pomo/core/exceptions/custom_firebase_exception.dart';
import 'package:pomo/core/exceptions/custom_plateform_exception.dart';

class AppServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get tasks from firestore

  Stream<List<Task>> getTasksByUser(String uid) async* {
    try {
      yield* _firestore
          .collection('tasks')
          .where("userId", isEqualTo: uid)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
      });
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // get single task by id from firestore
  Future<Task> getTaskById(String taskId) async {
    try {
      return Task.fromFirestore(
        (await _firestore.collection('tasks').doc(taskId).get()),
      );
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // save task to firestore
  Future<void> saveTask(Task task) async {
    try {
      final doc = await _firestore.collection('tasks').doc();
      task.id = doc.id;
      task.userId = FirebaseAuth.instance.currentUser!.uid;
      doc.set(
        task.toJson(),
        SetOptions(
          merge: true,
        ),
      );
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // delete task from firestore
  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }

  // update task in firestore
  Future<void> updateTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).update(
            task.toJson(),
          );
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).getMessage();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).getMessage();
    }
  }
}

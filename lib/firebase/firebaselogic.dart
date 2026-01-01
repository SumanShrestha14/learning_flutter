import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebaselogic {
  Future<void> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("User UID: ${userCredential.user!.uid}");

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({'email': email, 'createdAt': Timestamp.now()});
    print("Firestore document created successfully");
  }

  Future<void> login(String email, String pass) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Models/UserModel.dart';

class DataBase {
  CollectionReference fireData =
      FirebaseFirestore.instance.collection('Lectures');
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<QuerySnapshot> getData() async {
    return fireData.get();
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
           .signInWithEmailAndPassword(email: email, password: password);
       return userCredential.user.uid;
     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         print('No user found for that email.');
       } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
       }
     };
    
  }

  Future<DocumentSnapshot> getUserInfo(String uid) async {
     return await userCollection
          .doc(uid)
          .get();
  }

  Future createUserData(String name, String age, String position, String uid,String email) async {
    var data = {"UserName": name, "Age": age, "Position": position, "UID": uid , "Email" : email};
    try {
      await userCollection
          .doc(uid)
          .set(data)
          .then((value) => print("Data created"));
    } catch (e) {
      print("Err $e");
    }
  }

}

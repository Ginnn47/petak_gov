import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _data = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password) as UserCredential;

      _data.collection('users').doc(email).set({'username': username});
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured");
    }
    return null;
  }

  Future<String?> getUsername(String email) async {
    try {
      DocumentSnapshot snapshot =
          await _data.collection('users').doc(email).get();
      if (snapshot.exists) {
        // Mengonversi data menjadi Map<String, dynamic>
        Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
        // Mengambil nilai username dari Map jika tersedia
        return userData['username'] as String?;
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null; // Return null jika tidak dapat menemukan username
  }

// void _signUp(String email, String password) async {
  // String email = _emailController.text,
  // String password = _passwordController.text,

//   User? user = await _auth.signpwithEmailAndPassword(email, password);

// // if (user!= null){
//   // print("User is Sucesfully Created");
//   // Navigator.pushNamed(context,"/login");

// } else{
//   print("some error happened");
// }
// } //
}

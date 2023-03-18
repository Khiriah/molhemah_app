import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  signUpWithEmailFirebase({
    required String email,
    required String password,
    required String name,
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        print('uid : ${credential.user?.uid}');
        credential.user?.updateDisplayName(name);
      }

      onDone(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      onError(e.code.toString());
    }
  }

  signInWithEmailFirebase({
    required String email,
    required String password,
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onDone(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }

  signInWithPhoneNumber({
    required String phoneNumber,
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      print('object');
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await firebaseAuth.signInWithCredential(credential);
            // onDone(credential.smsCode);
            print(credential.smsCode);
            print('PhoneAuthCredential $credential');
          },
          verificationFailed: (FirebaseAuthException e) {
            print('FirebaseAuthException $e');
          },
          codeSent: (String verificationId, int? resendToken) {
            print("verificationId : $verificationId");
            onDone(verificationId);

            print('resendToken : $resendToken');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('verificationId $verificationId');
          },
          timeout: const Duration(seconds: 60));
      print('jhjk');
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }

  Future<void> verificationPhoneNumber({
    required String verificationId,
    required String smsCode,
    required Function(String? uid) onDone,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential cred = await firebaseAuth.signInWithCredential(credential);
    if(cred.user?.uid != null){
      cred.user?.updatePassword('s-12344321');
      cred.user?.updateDisplayName('si-ren');
      cred.user?.updatePhotoURL('https://images.unsplash.com/photo-1581456495146-65a71b2c8e52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1286&q=80');
    }
    onDone(cred.user?.uid);
  }

  signInWithGoogle({
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      late UserCredential cred;
      if (GetPlatform.isWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        cred = await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        cred = await firebaseAuth.signInWithCredential(credential);
      }

      onDone(cred.user?.uid);
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }

  forgotPassword({
    required String email,
    required Function(String e) onError,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }
}

import 'package:advisor/features/profile/model/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository {
  final firebaseAuth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;

   UserModel? getUserInfo(String uid)  {
    final user =  FirebaseAuth.instance.currentUser;
      // var a = await firebaseAuth;
    if (uid.isNotEmpty) {
      print('with uid');
      // print('pass ${user?.}');

       return UserModel(
        id: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        photoURL: user?.photoURL,
        phoneNumber: user?.phoneNumber,
      );
    } else {
      print('no uid');
       return null;
    }
  }

  Future<void> updateUserInfo({
    required String uid,
    required UserModel userModel,
    required Function() onError,
  }) async {
    if (uid.isNotEmpty) {
      await user?.updatePhotoURL(userModel.photoURL);
      await user?.updateDisplayName(userModel.displayName);
    } else {
      onError();
    }
  }



  Future<void> changePassword({
    required String uid,
    required String newPassword,
    required Function() onDone,
    required Function(String e) onError,
  }) async {
    try {
      await user?.updatePassword(newPassword);
      onDone();
    } on FirebaseAuthException catch (e){
      print('object');
      onError(e.message.toString());
    }

  }

  Future<void> signOut({
    required Function() onDone,
    required Function(String) onError,
  }) async {
    try {
      await firebaseAuth.signOut();
      onDone();
    } on FirebaseAuthException catch (e){
      onError(e.message.toString());
    }
  }
}

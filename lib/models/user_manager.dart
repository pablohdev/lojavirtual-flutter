import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/helpers/firebase_erros.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager extends ChangeNotifier {

  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  late User? user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn({required SignInUser user, required Function onFail,  required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;

      onSuccess(result.user);
    } on FirebaseAuthException catch  (e) {
      onFail(getErrorString(e.code));
    }

    loading = false;
  }


  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  void _loadCurrentUser() async {
    final User? currentUser = auth.currentUser!;

    if(currentUser != null){
      user = currentUser;
    }
    notifyListeners();
  }



}

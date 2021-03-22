import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:online_shopping/model/user_model.dart';
import 'package:online_shopping/service/fire_store_user.dart';
import 'package:online_shopping/view/helpers/local_storage_data.dart';

import 'package:online_shopping/view/screens/home_screen.dart';
import 'package:online_shopping/view/screens/main_screen.dart';
class AuthViewModel extends GetxController{
GoogleSignIn googleSignIn=GoogleSignIn(scopes: ['email']);
FirebaseAuth  auth=FirebaseAuth.instance;
FacebookLogin facebookLogin=FacebookLogin();
final LocalStorageData _localStorageData =Get.find();
 Rx<User> _user= Rx<User>();
 get user =>_user.value?.email;
@override
  void onInit() {
       super.onInit();
       _user.bindStream(auth.authStateChanges());
       if(auth.currentUser!=null){}

  }
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();

  }
  void signInMethod() async{
final GoogleSignInAccount googleUser= await googleSignIn.signIn();
print(googleUser);
GoogleSignInAuthentication authentication= await googleUser.authentication;
final AuthCredential credential =GoogleAuthProvider.credential(
  idToken: authentication.idToken,
  accessToken:authentication.accessToken
);
 await auth.signInWithCredential(credential).then((value) async{
   UserModel userModel=UserModel(userId:value.user.uid  ,email:value.user.email ,name: value.user.displayName ,picture: value.user.photoURL);

   saveUser(userModel);
   Get.offAll(MainScreen());
});

  }
  void facebookSignInMethod()async{
  FacebookLoginResult result= await facebookLogin.logIn(['email']);
  final accessTaken=result.accessToken.token;
  print(result.status);
  if(result.status==FacebookLoginStatus.loggedIn){

    final  credential=FacebookAuthProvider.credential(accessTaken);
    print(credential);
    await auth.signInWithCredential(credential).then((value) async{
      UserModel userModel=UserModel(userId:value.user.uid  ,email:value.user.email ,name: value.user.displayName ,picture: value.user.photoURL);
      saveUser(userModel);
      Get.offAll(MainScreen());
    });
  }
  }
  void signInWithEmailAndPassword( String email ,String password)async{

           try{

    await  auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {

         // await    FireStoreUser().getCurrentUser(value.user.uid).then((value) async{
         //   print("ttttttttttttttt777777${value.data()}");
         //    setUser(UserModel.fromJson(value.data()));
         // });

          getCurrentUser(value.user.uid);

    });
    Get.offAll(MainScreen());
           }catch(e){
             print(e.message);
             Get.snackbar('Error Login account', e.message ,
             colorText: Colors.black ,
             snackPosition: SnackPosition.BOTTOM);
           }
  }
void createAccountWithEmailAndPassword( String email ,String password ,String name)async{
  print(email);
  try{
    await  auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {

      print(value.user.email);
    UserModel userModel=UserModel(userId:value.user.uid  ,email:value.user.email ,name: name ,picture: 'default');

        saveUser(userModel);
    });

    Get.offAll(MainScreen());
  }catch(e){
    print(e.message);
    Get.snackbar('Error Login account', e.message ,
        colorText: Colors.black ,
        snackPosition: SnackPosition.BOTTOM);
  }
}
void saveUser(UserModel userModel)async{


await  FireStoreUser().addUserToFireStore(userModel);
setUser(userModel);
}

void getCurrentUser(String id) async{
  await FireStoreUser().getCurrentUser(id).then((value)  {
    setUser(UserModel.fromJson(value.data()));
  });
}
void setUser(UserModel userModel) async{
  print(userModel.picture);
  await _localStorageData.setUser(userModel);
}
}
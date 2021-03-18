import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shopping/model/user_model.dart';

class FireStoreUser{
  final CollectionReference _userCollectionsRef=FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFireStore(UserModel userModel)async{
    return await _userCollectionsRef.doc(userModel.userId)
    .set(userModel.toJson());
  }
}
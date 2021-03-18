class UserModel {
  String userId, email, picture ,name;

  UserModel({this.userId, this.email, this.picture ,this.name});
  UserModel.fromJson(Map<dynamic,dynamic>map){
   if( map==null){
     return;
   }
   userId=map['userId'];
   email=map['email'];
   picture=map['picture'];
   name=map['name'];
  }
  toJson(){
    return{
      'userId':userId,
      'email':email,
      'picture':picture,
      'name':name
    };
  }
}

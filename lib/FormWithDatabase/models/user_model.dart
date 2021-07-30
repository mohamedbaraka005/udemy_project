class SocialUserModel
{
  String name ;
  String email ;
  String uId ;
  String password ;
  String image;
  String cover;
  String bio;
  bool isVerified ;
  String phone ;

  SocialUserModel
      (
      {
        this.name ,
        this.email ,
        this.uId ,
        this.password,
        this.image,
        this.cover,
        this.bio,
        this.isVerified,
        this.phone,
      }
      );


  SocialUserModel.fromJson(Map <String , dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isVerified =json['isVerified'];
    phone = json['phone'];
  }

 Map< String , dynamic > toMap()
 {
   return{
     'name':name,
     'email':email,
     'password':password,
     'uId':uId,
     'image':image,
     'cover':cover,
     'isVerified':isVerified,
      'bio' : bio,
      'phone':phone,
   };
 }
}

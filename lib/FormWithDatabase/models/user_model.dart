class SocialUserModel
{
  String name ;
  String email ;
  String uId ;
  String image ;
  String password ;
  bool isVerified;

  SocialUserModel
      (
      {this.name = "mohaed", this.email , this.uId , this.password,this.image="https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=6&m=1158245623&s=612x612&w=0&h=y0LbpRFMHMj_9YC_kpKvLYcijEunxP27KyjXBrDHcFg=",this.isVerified=false}
      );


  SocialUserModel.fromJson(Map <String , dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];
    isVerified =json['isVerified'];
  }

 Map< String, dynamic > toMap()
 {
   return{
     'name':name,
     'email':email,
     'password':password,
     'uId':uId,
     'image':image,
     'isVerified':isVerified,
   };
 }
}

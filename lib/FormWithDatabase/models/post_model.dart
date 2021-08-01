class Post {
  String name ;
  String uId ;
  String image;
  String text ;
  String postImage ;
  String date;

  Post({
    this.name ,
    this.uId ,
    this.image,
    this.text,
    this.postImage ,
    this.date,
   });


  Post.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    text = json['text'];
    postImage = json['postImage'];
    date = json['date'];
  }


  Map < String , dynamic > toMap()
  {
    return{
      'name':name,
      'uId':uId,
      'image':image,
      'text':text,
      'postImage':postImage,
      'date':date,
    };
  }


}
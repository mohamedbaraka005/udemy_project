import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
main(){
  runApp(Training());
}
class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List imageUrl = [
    Image.asset("assets\images\FB_IMG_15390268291817510.jpg"),
    Image.asset("assets\images\FB_IMG_15390268879682866.jpg"),
    Image.asset("assets\images\FB_IMG_15390687320750355.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training"),
      ),
      body: ListView(
        children:[
          CarouselSlider(
            options: CarouselOptions(
              height: 130,
              initialPage: 0,

            ),
            items: 
              imageUrl.map((image){
                return Container(
                  child:image,
                );
              }).toList(),
            

          ),
        ]
      ),
    );
  }
}

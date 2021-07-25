// ignore: avoid_web_libraries_in_flutter
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

main() {
  runApp(SliderScreen());
}

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}


class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 50.0;


  // File image;

  // final picker = ImagePicker();

  // List<Asset> images = List<Asset>();
  //
  // Future loadImage() async {
  //
  //   List<Asset> result = List<Asset>();
  //   try {
  //
  //     result = await MultiImagePicker.pickImages(
  //         maxImages: 3,
  //         enableCamera: true ,
  //         selectedAssets: images,
  //     );
  //
  //     setState(() {
  //       images = result;
  //     });
  //   }
  //   catch (e) {
  //
  //   }
  // }

  // Future GetImage(ImageSource src) async
  // {
  //   //final  pickedFile = await picker.getImage(source: src);
  //
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Slider"),
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: 100,
            // ),
            //   Transform(
            //     transform: Matrix4.skew(0.4,0),
            //     child: Container(
            //       child: Text("skewy"),
            //       color: Colors.red,
            //       height:100,
            //       width: 100,
            //     ),
            //   ),
            //   SizedBox(
            //     height: 50 ,
            //   ),
            //   Slider(
            //   value: _sliderValue,
            //     min: 1,
            //     max: 100 ,
            //     divisions: 10,
            //     label: "Slider",
            //     activeColor: Colors.white,
            //     inactiveColor: Colors.green,
            //     onChanged: (val){
            //     setState(() {
            //       _sliderValue = val;
            //     });
            //     },
            //   ),
            //   SizedBox(
            //     height: 50,
            //     width: 500,
            //
            //       child: Marquee(
            //         text:"Hello it my first Marquee and it is created by me." ,
            //         blankSpace: 50,
            //         scrollAxis: Axis.horizontal,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         accelerationDuration: Duration(milliseconds: 10),
            //       ),
            //
            //   ),
            // SizedBox(
            //   height: 50,
            // ),
            // GridView.count(
            //   crossAxisCount: 3,
            //   children:
            //     List.generate(
            //         images.length,
            //        (index){
            //       return AssetThumb(
            //         asset: images[index],
            //         width: 50,
            //         height: 50,
            //       );
            //     }),


            // )


          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () {},
        ),
      ),
    );
  }

}
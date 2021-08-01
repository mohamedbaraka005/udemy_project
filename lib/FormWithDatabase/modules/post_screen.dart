import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsCubit.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PostScreen extends StatelessWidget {
  //const Post-Screen({Key? key}) : super(key: key);
  var postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state){},
      builder: (context, state){
        var cubit =SettingsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Create Post" , style: TextStyle(
                color: Colors.black87
            ),),
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
            actions: [
              TextButton(
                //inline if here +++
                onPressed:
                postController.text.toString().trim() != ""  || cubit.PostImage != null?
                    (){
                  cubit.PostImage ==null ?
                      cubit.CreatePost("", postController.text.toString()):
                      cubit.uploadPostImage( postController.text.toString());
                  postController.clear();
                }
                : null ,
                child: Text("Post"),
              ),
            ],
          ),
          body:SingleChildScrollView(
            padding: EdgeInsets.only(top:10,right:10,left:10,),
            child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage("${cubit.user1.image}"),
                          ),
                          SizedBox(width: 10,),
                             Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Row(
                                  children: [
                                    Text("${cubit.user1.name}"),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(Icons.verified , size: 18,color: Colors.blueAccent,),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                      //Icon(Icons.poi)
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(9),
                      child: Container(color: Colors.grey[300],height: 1,width: 350,)
                  ),
                  TextFormField(
                    onChanged: (value){
                      cubit.emit(WritingState());
                    },
                    controller:postController ,
                    maxLengthEnforced: false,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "  What's in your mind ?",
                      enabledBorder: InputBorder.none,
                      focusedBorder:InputBorder.none,
                    ),

                  ),
                  if(cubit.PostImage !=null)
                      Stack(
                      children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(cubit.PostImage),
                              fit: BoxFit.cover,
                            )
                        ),

                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: InkWell(
                          onTap: (){
                            cubit.DeletePostImaga();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[300],
                            ),
                              child: Icon(Icons.close , color: Colors.blueAccent,)
                          ),
                        ),
                      )
                    ],
                  ),
                 if(cubit.PostImage ==null)
                     SizedBox(
                       height:200,
                    ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(child: TextButton(
                        onPressed: (){cubit.getPostImage();},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Icon(Icons.image_outlined),
                              Text("  Add Photos" , style: TextStyle( color: Colors.blueAccent),),
                            ],
                          ),
                        )
                      )),
                      Expanded(
                          child: TextButton(
                          onPressed: (){},
                          child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0,12, 0, 12),
                                  child: Text("#Tags" , style: TextStyle( color: Colors.blueAccent),)
                              ),


                      )),
                    ],
                  )

                ],
              ),

          ),
        );
      },

    );
  }
}

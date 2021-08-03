import 'package:flutter/material.dart';
import 'package:flutter_app_work/FormWithDatabase/models/post_model.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsCubit.dart';
import 'package:flutter_app_work/FormWithDatabase/modules/settings/cubit/settingsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class  Home extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
    listener: (context,state){},
    builder: (context,state){
    //HomeCubit cubit = HomeCubit.get(context);
    return
      SettingsCubit.get(context).posts.length == 0 ?
      Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            backgroundColor: Colors.orange,
            valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,
          ),
        ),
      ):
      Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Home" , style: TextStyle(
              color: Colors.black87
          ),),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 30,
                    child: InkWell(
                      child: Icon(Icons.notifications_outlined ,color: Colors.black87,),
                      onTap: (){},
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 30,
                    child: InkWell(
                      child: Icon(Icons.search,color: Colors.black87),
                      onTap: (){},
                    ),
                  )
                ],
              ),


            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              children: [
                Card(
                  clipBehavior:Clip.antiAliasWithSaveLayer ,
                  child: Stack(
                    children: [
                      Image.network("https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg"),
                      Positioned(
                          left: 170,
                          top: 95,
                          child: Column(
                            children: [
                              Text(" Communicate " , style: TextStyle(color: Colors.white),),
                              Text("with friends" , style: TextStyle(color: Colors.white),),
                            ],
                          )
                      ),
                    ],

                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) => CardCreate(SettingsCubit.get(context).posts[index],context , index),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: SettingsCubit.get(context).posts.length,
                ),
              ],
            ),
          ),

        ),
      );
    },
    );
  }

}



Widget CardCreate (Post post ,ctx , index)
{
  return Card(
      child: Padding(
        padding:EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap:(){},
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("${post.image}"),
                      ),
                      SizedBox(width: 15,),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Row(
                              children: [
                                Text("${post.name}"),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.verified , size: 18,color: Colors.blueAccent,),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("${post.date}" , style: Theme.of(ctx).textTheme.caption,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8,),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: (){},
                )
                //Icon(Icons.poi)
              ],
            ),
            Divider(),
            if(post.text!=null)
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                child: Text("${post.text}" ,
                style: Theme.of(ctx).textTheme.bodyText2,),
              ),
            // Container(
            //   width:double.infinity,
            //   child: Wrap(
            //     spacing: 0.0,
            //     crossAxisAlignment: WrapCrossAlignment.start,
            //     alignment: WrapAlignment.start,
            //     children: [
            //       Container(
            //         height: 31,
            //         child: MaterialButton(
            //           minWidth: 1.0,
            //           padding: EdgeInsets.zero,
            //           child: Text("#software" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),),
            //           onPressed: (){},
            //         ),
            //       ),
            //       Container(
            //         height: 31,
            //         child:MaterialButton(
            //           minWidth: 1.0,
            //           padding: EdgeInsets.zero,
            //           child: Wrap(children:[Text("#software_Development" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),)]),
            //           onPressed: (){},
            //         ),
            //       ),
            //       Container(
            //         height: 31,
            //         child:MaterialButton(
            //           minWidth: 1.0,
            //           padding: EdgeInsets.zero,
            //           child: Wrap(children:[Text("#software_Engeneering" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),)]),
            //           onPressed: (){},
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            if(post.postImage!="")
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage("${post.postImage}"),
                      fit: BoxFit.cover,
                    )
                ),
            ),
              ),
            Row(
              children: [
                InkWell(
                  onTap:(){},
                  child: Padding(
                    padding: EdgeInsets.only(top: 10 , bottom: 10 , left: 10 , right: 10),
                    child: Container(
                      width:150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.auto_fix_high , color: Colors.red,size: 15,),
                          SizedBox(width: 4,),
                          Text(SettingsCubit.get(ctx).likes.length==0?"0":"${SettingsCubit.get(ctx).likes[index]}", style: Theme.of(ctx).textTheme.caption,),//${SettingsCubit.get(ctx).likes[index]}
                        ],
                      ),
                    ),),
                ),
                Expanded(
                  child: InkWell(
                    onTap:(){},
                    child:Padding(
                      padding: EdgeInsets.only(top: 10 , bottom: 10 , left: 10 , right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.message , color: Colors.blueAccent,size: 15,),
                          SizedBox(width: 4,),
                          Text(SettingsCubit.get(ctx).comments.length==0?"0 comment":"${SettingsCubit.get(ctx).comments[index]}" , style: Theme.of(ctx).textTheme.caption,),//*${SettingsCubit.get(ctx).comments[index] }
                        ],
                      ),),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    SettingsCubit.get(ctx).sendComment(post.postId,SettingsCubit.get(ctx).user1.uId , "comment");
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10 , bottom: 10 , right: 10, left: 5),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage("${SettingsCubit.get(ctx).user1.image}"),
                        ),
                        SizedBox(width: 8,),
                        Text("write a comment ..." ,style:Theme.of(ctx).textTheme.caption,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      SettingsCubit.get(ctx).sendLike( post.postId, SettingsCubit.get(ctx).user1.uId );
                    },
                    child: Padding(
                      padding:EdgeInsets.only(top: 10 , bottom: 10 , right: 10, left: 5) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.auto_fix_high , color: Colors.red,size: 22,),
                          SizedBox(width: 4,),
                          Text("Like" , style: Theme.of(ctx).textTheme.caption,)
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
            //SizedBox(height: 200,)



          ],
        ),
      ),
    );
}
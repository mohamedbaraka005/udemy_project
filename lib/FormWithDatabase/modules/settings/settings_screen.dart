import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/settingsCubit.dart';
import 'cubit/settingsStates.dart';

class Settingss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context,state){
        print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++${state}');
        // state == GetUserDataLoadingState()?
        // SettingsCubit.get(context).changeLoading(true):
        // SettingsCubit.get(context).changeLoading(false);
      },
      builder: (context,state){

        print("-+-+-+-+-+-+-+-+--++-+-++--+Welcome Settings Screen . . .");
       // print('++++++++++++++++++++++++++++++${SettingsCubit.get(context).user1.name}');
      var user = SettingsCubit.get(context).user1;
      var cubit = SettingsCubit.get(context);
      return state is GetUserDataLoadingState == false? Scaffold(
        appBar: AppBar(
          title: Text("Settings" , style: TextStyle(
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
        body: Padding(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //indicator for changing profile or cover picture:
                if(state is UpdateProfileImageLoadingState || state is UpdateCoverImageLoadingState ) Padding(
                  padding: EdgeInsets.only(top: 1 ,bottom: 3),
                  child: LinearProgressIndicator(),
                ),
                Container(
                  height: 190,
                  child: Stack(
                    alignment:AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment:AlignmentDirectional.topCenter,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (){cubit.ShowBottomSheetForCover(context);},
                              //border for the tab to manage the shadow
                              borderRadius: BorderRadius.circular(60),
                              child: Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:NetworkImage('${user.cover}'),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                              left: 305,
                              top: 90,
                              child: InkWell(
                                onTap:(){cubit.ShowBottomSheetForCover(context);},
                                borderRadius: BorderRadius.circular(19),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor:Colors.grey[300] ,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:Colors.grey[300] ,
                                      child: Icon(Icons.camera_alt_outlined),
                                    ),
                                  ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width:145,
                            child: InkWell(
                              onTap: (){cubit.ShowBottomSheetForProfile(context);},
                              //border for the tab to manage the shadow
                              borderRadius: BorderRadius.circular(60),
                              child: CircleAvatar(
                                radius: 64,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage('${user.image}'),
                                  ),

                              ),
                            ),
                          ),
                          InkWell(
                            onTap:(){cubit.ShowBottomSheetForProfile(context);},
                            borderRadius: BorderRadius.circular(19),
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor:Colors.grey[300] ,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:Colors.grey[300] ,
                                child: Icon(Icons.camera_alt_outlined),
                              ),
                            ),
                          )
                        ],

                      ),

                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Text('${SettingsCubit.get(context).user1.name}' , style: Theme.of(context).textTheme.subtitle1,),
                SizedBox(height: 8,),
                Text('${user.bio}', style: Theme.of(context).textTheme.bodyText2,),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: EdgeInsets.only(top: 15 , bottom: 15),
                          child: Column(
                            children: [
                              Text("100" , style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 6,),
                              Text("Posts" , style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: EdgeInsets.only(top: 15 , bottom: 15),
                          child: Column(
                            children: [
                              Text("45" , style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 6,),
                              Text("Photos" , style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: EdgeInsets.only(top: 15 , bottom: 15),
                          child: Column(
                            children: [
                              Text("33" , style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 6,),
                              Text("Followers" , style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: EdgeInsets.only(top: 15 , bottom: 15),
                          child: Column(
                            children: [
                              Text("64" , style: Theme.of(context).textTheme.subtitle2,),
                              SizedBox(height: 6,),
                              Text("Followings" , style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: (){},
                          child: Text("Add Photos"),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/ep');
                          },
                        child: Icon(Icons.edit),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ):Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            backgroundColor: Colors.orange,
            valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,
          ),
        ),
      );
      });
  }

  }




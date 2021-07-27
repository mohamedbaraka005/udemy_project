import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/settingsCubit.dart';
import 'cubit/settingsStates.dart';

class Settingss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context,state){
        state == GetUserDataSuccessState()?
        SettingsCubit.get(context).changeLoading(true):
        SettingsCubit.get(context).changeLoading(false);
      },
      builder: (context,state){
        print("-+-+-+-+-+-+-+-+--++-+-++--+Welcome Settings Screen . . .");
      var user = SettingsCubit.get(context).user1;

      return SettingsCubit.get(context).Loading==false? Scaffold(
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
          child: Column(
            children: [
              Container(
                height: 190,
                child: Stack(
                  alignment:AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment:AlignmentDirectional.topCenter,
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
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${user.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text('${user.name}' , style: Theme.of(context).textTheme.subtitle2,),
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
                            Text("100" , style: Theme.of(context).textTheme.subtitle2,),
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
                            Text("100" , style: Theme.of(context).textTheme.subtitle2,),
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
                            Text("100" , style: Theme.of(context).textTheme.subtitle2,),
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
                      onPressed: (){},
                      child: Icon(Icons.edit),
                    )
                  ],
                ),
              )

            ],
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




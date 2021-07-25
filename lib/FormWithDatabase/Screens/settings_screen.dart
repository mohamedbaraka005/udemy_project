import 'package:flutter/material.dart';

class Settingss extends StatefulWidget {
  //const Settings({Key? key}) : super(key: key);
  @override
  _SettingssState createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            image:NetworkImage("https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg"),
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
                      backgroundImage: NetworkImage("https://i.pinimg.com/236x/91/c7/c6/91c7c6f819a1cfb330db7b7fb63aa69c--hair-affair-mens-hair.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("Mohamed Mabrouk" , style: Theme.of(context).textTheme.subtitle2,),
            SizedBox(height: 8,),
            Text(" bio ..." , style: Theme.of(context).textTheme.bodyText2,),
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
    );
  }
}

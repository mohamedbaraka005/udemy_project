import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/homecubit.dart';
import 'cubit/homestates.dart';
class  Home extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> HomeCubit(),
    child: BlocConsumer<HomeCubit, HomeState>(
    listener: (context,state){},
    builder: (context,state){
    //HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
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
          padding: EdgeInsets.all(5.0),
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
                itemBuilder: (context, index) => CardCreate(context),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
              ),
            ],
          ),
        ),

      ),
    );
    },
    ),

    );
  }

}



Widget CardCreate (ctx)
{
  return Card(
      child: Padding(
        padding:EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap:(){},
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("https://i.pinimg.com/236x/91/c7/c6/91c7c6f819a1cfb330db7b7fb63aa69c--hair-affair-mens-hair.jpg"),
                      ),
                      SizedBox(width: 15,),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Row(
                              children: [
                                Text("Mohamed Mabrouk"),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.verified , size: 18,color: Colors.blueAccent,),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("January 21, 2021 at 11:00 pm" , style: Theme.of(ctx).textTheme.caption,),
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
            Text("Amideast Online provides our students the opportunity to connect with teachers and fellow classmates to continue communicating and practicing English within a dynamic virtual environment. Our online platform is customized for our programs to enable you to improve your English through innovative content, interactive online tools, and ongoing teacher support." ,
              style: Theme.of(ctx).textTheme.bodyText2,),
            Container(
              width:double.infinity,
              child: Wrap(
                spacing: 0.0,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: [
                  Container(
                    height: 31,
                    child: MaterialButton(
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      child: Text("#software" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),),
                      onPressed: (){},
                    ),
                  ),
                  Container(
                    height: 31,
                    child:MaterialButton(
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      child: Wrap(children:[Text("#software_Development" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),)]),
                      onPressed: (){},
                    ),
                  ),
                  Container(
                    height: 31,
                    child:MaterialButton(
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      child: Wrap(children:[Text("#software_Engeneering" , style: TextStyle(color: Colors.blueAccent , fontSize: 13),)]),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage("https://image.freepik.com/free-photo/happy-family-silhouette-sunset_1303-22466.jpg"),
                    fit: BoxFit.cover,
                  )
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
                          Text("125", style: Theme.of(ctx).textTheme.caption,),
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
                          Text("125 comment" , style: Theme.of(ctx).textTheme.caption,),
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
                  onTap: (){},
                  child: Padding(
                    padding: EdgeInsets.only(top: 10 , bottom: 10 , right: 10, left: 5),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage("https://i.pinimg.com/236x/91/c7/c6/91c7c6f819a1cfb330db7b7fb63aa69c--hair-affair-mens-hair.jpg"),
                        ),
                        SizedBox(width: 8,),
                        Text("write a comment ..." ,style:Theme.of(ctx).textTheme.caption,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){},
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
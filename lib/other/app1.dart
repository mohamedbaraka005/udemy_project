
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()
{
  runApp(New_App());
}
class New_App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newappstate();

  }



}
class _newappstate extends State<New_App>
{
  int _counter = 0 ;
  String v ="";

  void _increment_counter()
  {
    setState(() {
      _counter+=5;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(              //page content
          appBar: AppBar(           //app bare
            title:Text('App Bar Text'),
          ),
          body:Container(
            color: Colors.black12,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[//you can delete Widget , it is a list .
                Text(v,
                    style:TextStyle(

                  color: Colors.amber,
                  backgroundColor:Colors.black12,
                  fontSize: 70,
                  shadows:[
                    Shadow(
                        color:Colors.deepOrange,
                        offset: Offset(10,10),

                    )
                  ] ,
                  decoration: TextDecoration.underline,
                )),
                Text('$_counter',style: TextStyle(
                  fontSize: 50,
                  height: 2,
                ),),
                SizedBox(height: 10,),
                RaisedButton(
                    onPressed: (){
                      setState(() {
                        v="Hello baraka";
                      });
                    },
                    onLongPress: (){
                      setState(() {
                        v="";
                      });
                    },
                    child: Text('Click'),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      v="hello";
                    });
                  },
                  onLongPress: (){
                    setState(() {
                      v="";
                    });
                  },
                  splashColor: Colors.red,
                  highlightColor: Colors.blue,
                  child: Icon(Icons.access_alarm_sharp),
                )
              ],
            ),
            alignment: Alignment.center,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _increment_counter,
            child: Icon(Icons.account_balance),
          ),



        )
    );
  }

}


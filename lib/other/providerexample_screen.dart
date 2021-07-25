import 'package:flutter/material.dart';
import 'file:///C:/Users/LENOVO/AndroidStudioProjects/flutter_app_work/lib/other/provider.dart';
import 'package:provider/provider.dart';

void main() { //if there are many providers.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Myprovider(),)
      ],
      child: PExample(),
    ),
  );
}

// void main() { // if there is only one provider .
//   runApp(
//     ChangeNotifierProvider<Myprovider>(
//      create: (_)=>Myprovider(),
//       child: PExample(),
//     ),
//   );
// }

class PExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${context
                      .watch<Myprovider>()
                      .count}", //watch equal listen true.
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  "${Provider
                      .of<Myprovider>(context, listen: true)
                      .count}",
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  "${Provider
                      .of<Myprovider>(context, listen: false)
                      .count}",
                  //even if listen false he will listen to the change.
                  style: TextStyle(fontSize: 35),
                ),
                Consumer<Myprovider>(
                    builder: (ctx, value, child) =>
                        Text(
                          '${value.count}',
                          style: TextStyle(fontSize: 35),
                        ),
                ),
                Selector<Myprovider,int>( //selector does not build all values only selected values if it is changed .
                  selector: (ctx,val)=>val.count,
                  builder: (ctx,value,child)=> Text(
                    '${value}',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Text(
                  '${context.select<Myprovider , int > ((value) => value.count)}',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: ()=>context.read<Myprovider>().increment(), //read equal listen false.
        //   child: Icon(Icons.add),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () =>
        //       Provider.of<Myprovider>(context, listen: false).increment(),
        //   //listen must be false .
        //   child: Icon(Icons.add),
        // ),
        floatingActionButton:Consumer<Myprovider>(
            builder: (ctx, value, child) =>FloatingActionButton(
                onPressed: () =>
                    value.increment(),
                //listen must be false .
                child: Icon(Icons.add),
          )
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';

main() {
  runApp(DismissableScreen());
}

class DismissableScreen extends StatefulWidget {
  @override
  _DismissableScreenState createState() => _DismissableScreenState();
}

class _DismissableScreenState extends State<DismissableScreen> {
  final li = List<String>.generate(20, (index) => "item num ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("dismissible. . . "),
          ),
          body: ListView.builder(
              itemCount: li.length,
              itemBuilder: (context, index) {
                final item = li[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (DismissDirection direction) {
                    //do not try to to specific a particular action to a direction will cause an error during the application use.
                    setState(() {
                      li.removeAt(index);
                    });
                  },
                  confirmDismiss: (DismissDirection dir) async {
                    if (dir == DismissDirection.startToEnd) {
                      final bool res = await showDialog(
                          //code to create normal alert dialog.
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              content: Text(
                                  "are you sure you want to delete this item ${item}"),
                              actions:<Widget> [
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        li.remove(index);
                                      });
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text("yes")),
                                FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        Navigator.of(ctx).pop();
                                      });
                                    },
                                    child: Text("Cancel"))
                              ],
                            );
                          });
                      return res;
                    }
                    else
                      { return true ;}
                  },
                  child: ListTile(
                    title: Center(
                      child: Text(item),
                    ),
                  ),
                  background: Container(
                    //when push to right.
                    child: Icon(Icons.alarm),
                    color: Colors.red,
                  ),
                  secondaryBackground: Container(
                    //when push to left.
                    color: Colors.green,
                    child: Icon(Icons.call),
                  ),
                );
              })),
    );
  }
}

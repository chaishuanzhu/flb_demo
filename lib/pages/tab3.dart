import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab3"),
      ),
      body: ListView(
        children: List.generate(20, (int index){
          return ListTile(
            title: Text("$index"),
            onTap: () {
              FlutterBoost.singleton.open("next", exts: {"animated": true}).then((val){
                print(val);
              });
            },
          );
        }),
      ),
    );
  }
}

import 'package:blinck_app/screen/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Blinck',
     
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
	    
	    initialRoute: Router.initialRoute,
	    routes: Router.routes,
    );
  }
}

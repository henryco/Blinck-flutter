import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
	
	final String title = "MainScreen";
	
	MainScreen({Key key,}) : super(key: key);
	
	@override
	_MainScreenState createState() => new _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			
			appBar: AppBar(
				title: Text(widget.title),
			),
			
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						// todo
					],
				),
			),
		
		);
	}
}
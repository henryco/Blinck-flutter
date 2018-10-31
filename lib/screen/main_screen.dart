import 'package:blinck_app/util/model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
	
	final String title = "MainScreen";
	
	MainScreen({Key key,}) : super(key: key);
	
	@override
	State<MainScreen> createState() => new _MainScreenModel();
}


class _MainScreenModel extends ViewModel<MainScreen, _MainScreenLogic> {
	
	@override
	_MainScreenLogic createLogic() => new _MainScreenLogic();
	
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


class _MainScreenLogic extends ViewLogic<MainScreen, _MainScreenModel> {
	
	
	@override
	void initialize() {
	
	}
	
}
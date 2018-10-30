import 'package:flutter/material.dart';

import './util.dart';
export './util.dart';

abstract class ViewState
<WIDGET extends StatefulWidget, LOGIC> extends State<WIDGET> {
	
	ViewLogic <WIDGET, ViewState<WIDGET, LOGIC>> $logic;
	LOGIC get $ => $logic as LOGIC;
	
	ViewState([ViewLogic <WIDGET, ViewState<WIDGET, LOGIC>> logic]) {
		this.$logic = logic;
	}
	
	/// Overridable
	ViewLogic <WIDGET, ViewState<WIDGET, LOGIC>> createLogic() => $logic;
	
	@override
	void initState() {
		super.initState();
		this.$logic = createLogic();
		$logic.bind(this);
	}
	
	void update(VoidCallback callback) {
		this.setState(callback);
	}
	
}


abstract class ViewLogic
<WIDGET extends StatefulWidget, U extends ViewState> {
	
	BuildContext get $context => $state.context;
	WIDGET get $ => $state.widget;
	U $state;
	
	void bind(U state) async {
		this.$state = state;
		this.initialize();
	}
	
	/// Overridable
	void initialize() { }
	
	void update(VoidCallback callback) {
		$state.update(callback);
	}
	
}
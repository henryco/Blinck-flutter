import 'package:flutter/material.dart';

export './util.dart';

abstract class ViewState
<WIDGET extends StatefulWidget, LOGIC> extends State<WIDGET> {
	
	ViewLogic <WIDGET, ViewState<WIDGET, LOGIC>> $logic;
	LOGIC get $ => $logic as LOGIC;
	
	/// Overridable
	ViewLogic <WIDGET, ViewState<WIDGET, LOGIC>> createLogic();
	
	@override
	void initState() {
		super.initState();
		this.$logic = createLogic();
		$logic._bind(this);
	}
	
	@protected
	void _update(VoidCallback callback) {
		this.setState(callback);
	}
	
}


abstract class ViewLogic
<WIDGET extends StatefulWidget, U extends ViewState> {
	
	BuildContext get $context => $state.context;
	WIDGET get $ => $state.widget;
	U $state;
	
	@protected
	void _bind(U state) async {
		this.$state = state;
		this.initialize();
	}
	
	/// Overridable
	void initialize() { }
	
	void update(VoidCallback callback) {
		$state._update(callback);
	}
	
}
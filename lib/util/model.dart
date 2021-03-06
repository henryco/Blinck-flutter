import 'package:flutter/material.dart';

export './util.dart';

abstract class ViewModel<WIDGET extends StatefulWidget, LOGIC>
    extends State<WIDGET> {
  ViewLogic<WIDGET, ViewModel<WIDGET, LOGIC>> $logic;

  LOGIC get $ => $logic as LOGIC;

  /// Overridable
  @protected
  ViewLogic<WIDGET, ViewModel<WIDGET, LOGIC>> createLogic();

  @override
  void initState() {
    super.initState();
    this.$logic = createLogic();
    $logic._bind(this);
  }

  @protected
  void _update(VoidCallback callback) => this.setState(callback);
}

abstract class ViewLogic<WIDGET extends StatefulWidget, U extends ViewModel> {
  BuildContext get $context => $state.context;

  WIDGET get $ => $state.widget;
  U $state;

  @protected
  void _bind(U state) {
    this.$state = state;
    this.initialize();
  }

  /// Overridable
  @protected
  void initialize() /*async*/ {
    /* void */
  }

  void update(VoidCallback callback) => $state._update(callback);
}

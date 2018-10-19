// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:blinck_app/main.dart';

import 'package:blinck_app/florm/src/processor/processor.dart';
import 'package:blinck_app/florm/src/processor/column.dart' as C;

void main() {
  
  test('BuilderTest', () async {
    
    var table = new FlormTable("SomeTable");
    var row = new FlormRow();
    row.column(new C.ColumnSupplier(() => "some_coll"));
    row.column(FlormColumn("integer"));
    
    var row2 = new FlormRow();
    row2.column(new FlormColumn("testval"));
    row2.column(new FlormColumn("text"));
    table.row(row2);
    
    var alter = new FlormAlter("ADD CONSTRAINT random UNIQUE(some_coll)");
    table.alter(alter);
    table.row(row);
   
    print(table.create());
  });
}


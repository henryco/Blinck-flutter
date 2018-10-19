import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseCore {
	
	static Database _db;
	Future<Database> get db async {
		if (_db != null) return _db;
		// todo
		return _db;
	}
	
	
	initDb(String dbName) async {
		io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
		String path = join(documentsDirectory.path, dbName);
		var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
		return theDb;
	}
	

	void _onCreate(Database db, int version) async {
		// When creating the db, create the table
		await db.execute("CREATE TABLE Employee(id INTEGER PRIMARY KEY,"
			" firstname TEXT, lastname TEXT, mobileno TEXT,emailId TEXT )");
	}
}
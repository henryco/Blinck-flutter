import 'package:blinck_app/_flutter_orm/annotations/annotations.dart';

@entity @table
class ExampleEntity {
	
	@id$ @generatedValue @Column(
		updatable: false,
		unique: true,
		name: "id",
	) int id;
	
	@column
	String fistName;
	
	@column
	String lastName;
	
	@column
	int age;
	
	@column @Temporal(
		TemporalType.TIMESTAMP
	) DateTime birthday;
	
	
}
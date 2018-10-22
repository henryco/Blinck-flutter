import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

abstract class EntityAnalyzer {
	
	/// Called when [clazz] is annotated with @Entity() or @entity
	void visitEntity(ClassElement clazz) {
	
	}
	
	
	
}
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:meta/meta.dart';
import './entity_analyzer.dart';

class LibAnalyzer extends RecursiveElementVisitor<Null> {
	
	final EntityAnalyzer entityAnalyzer;

	LibAnalyzer({
	  @required this.entityAnalyzer
  });
	
	void visitLibrary(LibraryElement library) {
		// todo
	}
	
	@override
	Null visitClassElement(ClassElement element) {
		// todo
	}
	
	
	
}
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:meta/meta.dart';
import './entity_analyzer.dart';

class LibAnalyzer {
	
	final EntityAnalyzer entityAnalyzer;

	LibAnalyzer({
	  @required this.entityAnalyzer
  });
	
	void visitLibrary(LibraryElement library) {
		new _Analyzer(this).visitLibraryElement(library);
	}
	
}

class _Analyzer extends RecursiveElementVisitor<Null> {
	
	final LibAnalyzer $;

  _Analyzer(this.$);
	
	@override
	Null visitClassElement(ClassElement element) {
		// todo
	}
	
}
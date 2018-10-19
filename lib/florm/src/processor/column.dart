import './processor.dart';

class ColumnComa implements Column {
	@override
	String get value => ",";
}

typedef String StringSupplier();


class ColumnSupplier implements Column {
	final StringSupplier supplier;
	
	ColumnSupplier(this.supplier);
	
	@override
	String get value => supplier();
}

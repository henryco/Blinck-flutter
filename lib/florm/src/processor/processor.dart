class VirtualTable {
  
  final List<Row> _rows = [];
  final String _name;
  
  VirtualTable(this._name);

  void addRow(Row row) => _rows.add(row);
  
  String create() {
    if (this._name == null) throw new ArgumentError.notNull("name");
    
    var buffer = new StringBuffer();
    _rows.forEach((r) {
      buffer.write(r);
    });
    
    return "CREATE TABLE $_name (\n $buffer \n);";
  }
}


class Row {
  final List<Column> _columns = [];

  void addColumn(Column column) => _columns.add(column);
  
  @override
  String toString() {
    if (_columns == null) throw new ArgumentError.notNull("columns");

    var buffer = new StringBuffer();
    _columns.forEach((c) {
      buffer..write(" ")..write(c.value);
    });

    return "$buffer\n";
  }
}


abstract class Column {
  String get value;
}


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

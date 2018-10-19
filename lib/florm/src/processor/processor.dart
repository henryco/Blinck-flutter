class Table {
  final List<Row> _rows = [];
  final List<Alter> _alters = [];
  final String _name;

  Table(this._name);

  void row(Row row) => _rows.add(row);

  void alter(Alter alter) => _alters.add(alter);

  String create() {
    if (this._name == null) throw new ArgumentError.notNull("name");

    var buffer = new StringBuffer();
    for (var r in _rows) {
      buffer.write(r);
    }

    var altBuff = new StringBuffer();
    for (var a in _alters) {
      altBuff.write(a.create(this._name));
    }
  

    var buff = buffer.toString().trim();
    return "CREATE TABLE $_name (\n ${buff.substring(0, buff.length - 1)} \n); \n $altBuff";
  }
}

class Row {
  final List<Column> _columns = [];

  void column(Column column) => _columns.add(column);

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

abstract class Alter {
  String create(String table) {
    return "ALTER TABLE $table ${alter()};\n";
  }

  String alter();
}

class FlormAlter extends Alter {
  final String _value;

  FlormAlter(this._value);

  @override
  String alter() => _value;
}

abstract class Column {
  String get value;
}

class FlormTable extends Table {
  FlormTable(String name) : super(name);
}

class FlormColumn implements Column {
  final String _value;

  FlormColumn(this._value);

  @override
  String get value => _value;
}

class FlormRow extends Row {
  FlormRow() : super();
}

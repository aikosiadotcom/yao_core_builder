class DbColumn {
  final String name;
  final Type type;
  final bool required;

  const DbColumn(
      {required this.name, this.type = dynamic, this.required = false});
}

class OdooModel {
  final String tableName;

  final String className;

  final List<DbColumn> columns;

  ///which column is id
  final String id;

  const OdooModel(
      {required this.className,
      required this.tableName,
      required this.columns,
      this.id = "id"});
}

abstract class IOdooModel<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
  int? getId();
  String getTableName();
  Map<String, dynamic> toJsonWithReduce(
      bool Function(MapEntry<String, dynamic>) validate);
  Map<String, dynamic> toJsonWithoutNullAndId();
  List<String> getColumns();
}

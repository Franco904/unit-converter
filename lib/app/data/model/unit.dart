class Unit {
  int id;
  String name;
  int idCategory;

  Unit({required this.id, required this.name, required this.idCategory}) : assert(id > 0);

  // Cria instância de Unit com dados da string JSON
  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(id: int.parse(json['id']), name: json['name'], idCategory: int.parse(json['idCategory']));
  }
}

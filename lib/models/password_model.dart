
class PasswordModel 
{
  int? id;
  String? name;
  String? password;


   PasswordModel({
    this.id,
    this.name,
    this.password,

  });

  factory PasswordModel.fromMap(Map<String, dynamic> json) => PasswordModel
  (
    id: json["id"] as int,
    name: json["name"] as String,
    password: json["password"] as String,

  );
  Map<String, dynamic > toMap() => 
  {
    "id" : id,
    "name" :name,
    "password" : password,

  };

  @override
  String toString() {
    return '{id: $id, name: $name, password: $password,}';
  }
}
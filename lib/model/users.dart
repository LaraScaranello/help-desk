// ignore_for_file: unused_field, unnecessary_this

class Users {
  // Atributos
  late String _nome;
  late String _email;
  late String _senha;

  Users();

  // Getters e Setters
  String get nome => this._nome;
  set nome(String value) => this._nome = value;

  get email => this._email;
  set email(value) => this._email = value;

  get senha => this._senha;
  set senha(value) => this._senha = value;
}

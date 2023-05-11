// ignore_for_file: unused_field, unnecessary_this

class Orders {
  // atributos
  late int _id;
  late String _descricao;
  late DateTime _dataChamado;
  late bool _statusChamado;

  // construtor
  Orders(int id, String descricao, DateTime dataChamado, bool statusChamado) {
    this._id = id;
    this._descricao = descricao;
    this._dataChamado = dataChamado;
    this._statusChamado = statusChamado;
  }

  // getters e setters
  get id => this._id;
  set id(value) => this._id = value;

  get descricao => this._descricao;
  set descricao(value) => this._descricao = value;

  get dataChamado => this._dataChamado;
  set dataChamado(value) => this._dataChamado = value;

  get statusChamado => this._statusChamado;
  set statusChamado(value) => this._statusChamado = value;
}

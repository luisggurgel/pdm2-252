import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  

  Map<String, dynamic> toJson() => {'nome': _nome};
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
        'nome': _nome,
        'dependentes': _dependentes.map((d) => d.toJson()).toList(),
      };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
        'nomeProjeto': _nomeProjeto,
        'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {

  var dependente1 = Dependente('Juao Paulo');
  var dependente2 = Dependente('Bluezao');
  var dependente3 = Dependente('Yutaka Maeno');
  var dependente4 = Dependente('Rafão Otaku');

  var funcionario1 = Funcionario('Nego Ney', [dependente1, dependente2]);
  var funcionario2 = Funcionario('Judeu Baruch', [dependente3]);
  var funcionario3 = Funcionario('Mateus505', [dependente4]);

  var funcionarios = <Funcionario>[funcionario1, funcionario2, funcionario3];

  var equipe = EquipeProjeto('Projeto PV lanches', funcionarios);

  var encoder = JsonEncoder.withIndent('  ');
  print(encoder.convert(equipe.toJson()));
}
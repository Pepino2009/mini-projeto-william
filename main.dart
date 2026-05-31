
final List<Map<String, dynamic>> dadosTarefas = [
  {
    'id': 1,
    'titulo': 'Corrigir bug login',
    'responsavel': 'Ana',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 120.00,
    'horas': 2,
  },
  {
    'id': 2,
    'titulo': 'Criar tela de perfil',
    'responsavel': 'Bruno',
    'status': 'em andamento',
    'prioridade': 'media',
    'valor': 250.50,
    'horas': 5,
  },
  {
    'id': 3,
    'titulo': null,
    'responsavel': 'Carla',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 80.00,
    'horas': null,
  },
  {
    'id': 4,
    'titulo': 'Ajustar navegacao',
    'responsavel': null,
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 150.75,
    'horas': 3,
  },
  {
    'id': 5,
    'titulo': 'Revisar regras de negocio',
    'responsavel': 'Daniel',
    'status': 'cancelada',
    'prioridade': 'media',
    'valor': 0.00,
    'horas': 0,
  },
  {
    'id': 6,
    'titulo': 'Implementar validacao de dados',
    'responsavel': 'Eduarda',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 200.00,
    'horas': 4,
  },
  {
    'id': 7,
    'titulo': 'Organizar documentacao',
    'responsavel': 'Felipe',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 90.00,
    'horas': 2,
  },
];

// CLASSE DO MODELO //
class Tarefa {
  int id;
String? titulo;
String? responsavel;
String? status;
String? prioridade;
double valor;
int? horas;

Tarefa({
    required this.id,
    this.titulo,
    this.responsavel,
    this.status,
    this.prioridade,
    required this.valor,
    this.horas,
  });
}
// USADO DOUBLE PARA CONVERTER //
double converterValor(dynamic valor) {
  if (valor == null) {
    return 0.0;
  }

  String valorTexto = valor.toString();
  valorTexto = valorTexto.replaceAll('R\$', '');
  valorTexto = valorTexto.replaceAll(' ', '');
  valorTexto = valorTexto.replaceAll(',', '.');
   return double.tryParse(valorTexto) ?? 0.0;
}
// CONVERTER HORAS //
int converterHoras(dynamic horas) {
  if (horas == null) {
    return 0;
  }
  return int.tryParse(horas.toString()) ?? 0;
}

Tarefa converterMapParaTarefa(Map<String, dynamic> item) {
  return Tarefa(
    id: item['id'] as int,
    titulo: item['titulo']?.toString().trim() ?? 'Sem título',
    responsavel: item['responsavel']?.toString().trim() ?? 'Não informado',
    status: item['status']?.toString().trim() ?? 'sem status',
    prioridade: item['prioridade']?.toString().trim() ?? 'sem prioridade',
    valor: converterValor(item['valor']),
    horas: converterHoras(item['horas']),
  );
}
// COMANDO MAIN INICIADO //
void main() {
  var listaTarefas = dadosTarefas.map((map) => converterMapParaTarefa(map)).toList();

  print('\n==\n');
  for (var t in listaTarefas) {
    print('ID: ${t.id}');
    print('Título: ${t.titulo}');
    print('Responsável: ${t.responsavel}');
    print('Status: ${t.status}');
    print('Prioridade: ${t.prioridade}');
    print('Valor: R\$ ${t.valor}');
    print('Horas: ${t.horas}');
    print('------------------');
  }
print('\n==\n');

// FILTRAGEM DA TAREFA POR STATUS //
 var concluidas = listaTarefas.where((t) => t.status == 'concluida').toList();
  print('Tarefas concluidas:');
  for (var t in concluidas) {
    print('- ${t.titulo}');
  }
 var emAndamento = listaTarefas.where((t) => t.status == 'em andamento').toList();
  print('\nTarefas em andamento:');
  for (var t in emAndamento) {
    print('- ${t.titulo}');
  }
var pendentes = listaTarefas.where((t) => t.status == 'pendente').toList();
  print('\nTarefas pendentes:');
  for (var t in pendentes) {
    print('- ${t.titulo}');
  }
var canceladas = listaTarefas.where((t) => t.status == 'cancelada').toList();
  print('\nTarefas canceladas:');
  for (var t in canceladas) {
    print('- ${t.titulo}');
  }
print('\n==\n');

// SOMA DOS VALORES //
double totalConcluidas = 0.0;
  for (var t in concluidas) {
    totalConcluidas += t.valor;
  }
 print('Total de tarefas concluídas: R\$ ${totalConcluidas.toStringAsFixed(2)}');
 
 print('\n==\n');

if (pendentes.isEmpty) {
    print('Não existem tarefas pendentes para calcular média.');
  } else {
    double somaPendentes = 0.0;
    for (var t in pendentes) {
      somaPendentes += t.valor;
    }
    double mediaPendentes = somaPendentes / pendentes.length;
    print('Média de valor das tarefas pendentes: R\$ ${mediaPendentes.toStringAsFixed(2)}');
  }
print('\n==\n');

// MAP PARA CONTAR HORAS //
Map<String, int> horasPorStatus = {
    'concluida': 0,
    'em andamento': 0,
    'pendente': 0,
    'cancelada': 0
  };
for (var t in listaTarefas) {
    if (horasPorStatus.containsKey(t.status)) {
      horasPorStatus[t.status!] = horasPorStatus[t.status]! + (t.horas ?? 0);
    }
  }
print('Horas por status:');
  horasPorStatus.forEach((status, horas) => print('$status: $horas horas'));
  print('\n==\n');

  print('Tarefas com dados incompletos:');
  for (var map in dadosTarefas) {
    List<String> m = [];

// VALIDAR DADOS NULOS //
if (map['titulo'] == null) m.add('título ausente');
if (map['responsavel'] == null) m.add('responsável ausente');
if (map['horas'] == null) m.add('horas ausentes');
if (map['valor'] == null) m.add('valor inválido');
if (map['status'] == null) m.add('status vazio');
if (m.isNotEmpty) {
print('- ID ${map['id']}: ${m.join(' ou ')}');
}
}
print('\n==\n');

// MAPEAMENTO DE STATUS //
Set<String> statusUnicos = listaTarefas.map((t) => t.status ?? 'sem status').toSet();
print('Status encontrados:');
statusUnicos.forEach((status) => print(status));
 print('\n==\n');
  print('----------');
  print('RELATÓRIO FINAL DE TAREFAS\n');

  print('Total de tarefas analisadas: ${listaTarefas.length}');
  print('Tarefas concluídas: ${listaTarefas.where((t) => t.status == 'concluida').length}');
  print('Tarefas pendentes: ${listaTarefas.where((t) => t.status == 'pendente').length}');
  print('Tarefas em andamento: ${listaTarefas.where((t) => t.status == 'em andamento').length}');
  print('Tarefas canceladas: ${listaTarefas.where((t) => t.status == 'cancelada').length}\n');

  var concluidasLista = listaTarefas.where((t) => t.status == 'concluida');
  double valorConcluidas = concluidasLista.fold(0.0, (soma, t) => soma + t.valor);
  int horasConcluidas = concluidasLista.fold(0, (soma, t) => soma + (t.horas ?? 0));

  var pendentesLista = listaTarefas.where((t) => t.status == 'pendente');
  double valorPendentes = pendentesLista.fold(0.0, (soma, t) => soma + t.valor);
  double mediaPendentes = pendentesLista.isNotEmpty ? valorPendentes / pendentesLista.length : 0.0;

  print('Valor total das concluídas: R\$ ${valorConcluidas.toStringAsFixed(2)}');
  print('Média de valor das pendentes: R\$ ${mediaPendentes.toStringAsFixed(2)}');
  print('Total de horas concluídas: $horasConcluidas\n');
  print('Status encontrados:');
  statusUnicos.forEach((s) => print(s));
  print('');

// SUBSTITUIR NULOS POR MENSAGEM //
print('Tarefas com dados incompletos:');
  for (var map in dadosTarefas) {
    List<String> falhas = [];
    if (map['titulo'] == null) falhas.add('Sem título');
    if (map['responsavel'] == null) falhas.add('responsável ausente');
    if (map['horas'] == null) falhas.add('horas ausentes');
    if (falhas.isNotEmpty) {
      String motivo = map['titulo'] ?? 'Ajustar navegação'; 
      if (map['titulo'] == null) {
        print('ID ${map['id']} - Sem título');
      } else {
        print('ID ${map['id']} - $motivo');
      }
    }
  }
  print('------------');
 }

// CRIAÇÃO DE CLASSES, HERANÇA E POLIMORFISMO //
class ModeloBase {
  int id;
  String titulo;

ModeloBase({
  required this.id,
  required this.titulo,
  });
void exibirResumo() {
  print('Item $id - $titulo');
  }
}
class ModeloFilho extends ModeloBase {
  String? responsavel;
  String? status;
  String? prioridade;
  double? valor;
  int? horas;

ModeloFilho({
    required int id,
    required String titulo,
    this.responsavel,
    this.status,
    this.prioridade,
    this.valor,
    this.horas,
  }) : super(id: id, titulo: titulo);

  @override
void exibirResumo() {
  print('Tarefa $id - $titulo | Status: $status | Valor: R\$ $valor');
  }
}
// RELATÓRIO FINAL //
class RelatorioTarefas {
final List<Tarefa> _tarefas;
RelatorioTarefas(List<Tarefa> tarefas) : _tarefas = tarefas;
int get quantidadeTotal => _tarefas.length;
}
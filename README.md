SEGUE ABAIXO OS DADOS DO MINI PROJETO, COM VIDEO E LINKS DO PROJETO!

1. Fluxo de Dados

O sistema recebe dados brutos simulando uma API ("List<Map<String, dynamic>>") e os converte em objetos tipados da classe "Tarefa" ("List<Tarefa>"). Esse processo garante maior organização, segurança e consistência na manipulação dos dados.

2. Sanitização e Conversões Seguras

Os dados passam por um processo de limpeza utilizando ".replaceAll()", removendo símbolos monetários e espaços desnecessários. Para evitar erros de execução, são utilizados "double.tryParse()" e "int.tryParse()" juntamente com o operador "??", garantindo tratamento seguro de valores nulos ou inválidos.

3. Programação Orientada a Objetos (POO)

O projeto aplica conceitos importantes de POO:

- Abstração: modelagem dos dados através da classe "Tarefa".
- Herança e Polimorfismo: reutilização e personalização de comportamentos entre "ModeloBase" e "ModeloFilho" com "@override".
- Encapsulamento: proteção dos dados utilizando atributos privados e getters.

4. Manipulação de Coleções

O relatório final utiliza métodos de alta ordem para processar informações de forma eficiente:

- ".map()": converte mapas em objetos.
- ".where()": filtra tarefas conforme critérios definidos.
- ".toSet()": remove valores duplicados.
- ".fold()": calcula totais de valores e horas.

5. Resultado

O sistema gera relatórios organizados e estatísticos, demonstrando o uso de boas práticas de Dart, Programação Orientada a Objetos e processamento eficiente de coleções.

Segue o link do Trello/Kanban abaixo por aqui também.
https://trello.com/invite/b/6a1b2930693e938342bcaa8c/ATTIea0cb1078c5d49a3a6726157a9bcb51423005D38/mini-projeto-william

Segue o link do video aqui explicativo.


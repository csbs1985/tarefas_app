class DiasModel {
  late String text;
  late int value;

  DiasModel({
    required this.text,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }
}

final List<DiasModel> ListaDia = [
  DiasModel(text: FrequenciaEnum.um.value, value: 0),
  DiasModel(text: FrequenciaEnum.dois.value, value: 1),
  DiasModel(text: FrequenciaEnum.tres.value, value: 2),
  DiasModel(text: FrequenciaEnum.quatro.value, value: 3),
  DiasModel(text: FrequenciaEnum.cinco.value, value: 4),
  DiasModel(text: FrequenciaEnum.seis.value, value: 5),
  DiasModel(text: FrequenciaEnum.sete.value, value: 6),
  DiasModel(text: FrequenciaEnum.oito.value, value: 7),
  DiasModel(text: FrequenciaEnum.nove.value, value: 8),
  DiasModel(text: FrequenciaEnum.dez.value, value: 9),
  DiasModel(text: FrequenciaEnum.onze.value, value: 10),
  DiasModel(text: FrequenciaEnum.doze.value, value: 11),
  DiasModel(text: FrequenciaEnum.treze.value, value: 12),
  DiasModel(text: FrequenciaEnum.quatorze.value, value: 13),
  DiasModel(text: FrequenciaEnum.quinze.value, value: 14),
  DiasModel(text: FrequenciaEnum.dezesseis.value, value: 15),
  DiasModel(text: FrequenciaEnum.dezessete.value, value: 16),
  DiasModel(text: FrequenciaEnum.dezoito.value, value: 17),
  DiasModel(text: FrequenciaEnum.dezenove.value, value: 18),
  DiasModel(text: FrequenciaEnum.vinte.value, value: 19),
  DiasModel(text: FrequenciaEnum.vinteUm.value, value: 20),
  DiasModel(text: FrequenciaEnum.vinteDois.value, value: 21),
  DiasModel(text: FrequenciaEnum.vinteTres.value, value: 22),
  DiasModel(text: FrequenciaEnum.vinteQuatro.value, value: 23),
  DiasModel(text: FrequenciaEnum.vinteCinco.value, value: 24),
  DiasModel(text: FrequenciaEnum.vinteSeis.value, value: 25),
  DiasModel(text: FrequenciaEnum.vinteSete.value, value: 26),
  DiasModel(text: FrequenciaEnum.vinteOito.value, value: 27),
  DiasModel(text: FrequenciaEnum.vinteNove.value, value: 28),
  DiasModel(text: FrequenciaEnum.trinta.value, value: 29),
  DiasModel(text: FrequenciaEnum.trintaUm.value, value: 30),
];

enum FrequenciaEnum {
  um('1'),
  dois('2'),
  tres('3'),
  quatro('4'),
  cinco('5'),
  seis('6'),
  sete('7'),
  oito('8'),
  nove('9'),
  dez('10'),
  onze('11'),
  doze('12'),
  treze('13'),
  quatorze('14'),
  quinze('15'),
  dezesseis('16'),
  dezessete('17'),
  dezoito('18'),
  dezenove('19'),
  vinte('20'),
  vinteUm('21'),
  vinteDois('22'),
  vinteTres('23'),
  vinteQuatro('24'),
  vinteCinco('25'),
  vinteSeis('26'),
  vinteSete('27'),
  vinteOito('28'),
  vinteNove('29'),
  trinta('30'),
  trintaUm('31');

  final String value;
  const FrequenciaEnum(this.value);
}

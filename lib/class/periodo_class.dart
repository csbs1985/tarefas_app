class PeriodoModel {
  late PeriodoEnum periodo;

  PeriodoModel({
    required this.periodo,
  });
}

final List<PeriodoModel> ListaACada = [
  PeriodoModel(periodo: PeriodoEnum.dias),
  PeriodoModel(periodo: PeriodoEnum.semanas),
  PeriodoModel(periodo: PeriodoEnum.meses),
  PeriodoModel(periodo: PeriodoEnum.anos),
];

enum PeriodoEnum {
  dias('dias'),
  semanas('semanas'),
  meses('meses'),
  anos('anos');

  final String value;
  const PeriodoEnum(this.value);
}

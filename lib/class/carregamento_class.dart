class AnexoModel {
  late String text;
  late int value;

  AnexoModel({
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

final List<AnexoModel> ListaAnexo = [
  AnexoModel(text: AnexoEnum.dispositivo.value, value: 0),
  AnexoModel(text: AnexoEnum.camera.value, value: 1),
];

enum AnexoEnum {
  dispositivo('arquivo do dispositivo'),
  camera('camera');

  final String value;
  const AnexoEnum(this.value);
}

import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiText {
  static const TextStyle tituloPlanejados = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: UiColor.planejados,
  );

  static const TextStyle tituloCalendario = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: UiColor.calendario,
  );

  static const TextStyle tituloTodas = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: UiColor.todas,
  );

  static const TextStyle tituloConcluidas = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: UiColor.concluidas,
  );

  static const TextStyle tituloTarefa = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: UiColor.tarefa,
  );

  static const TextStyle headline1 = TextStyle(
    fontSize: 16,
    fontFamily: 'ElementalSansPro',
    fontWeight: FontWeight.normal,
    color: UiColor.text_1,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 16,
    fontFamily: 'ElementalSansPro',
    fontWeight: FontWeight.normal,
    color: UiColor.tarefa,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 16,
    fontFamily: 'ElementalSansPro',
    fontWeight: FontWeight.normal,
    color: UiColor.text_2,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 16,
    fontFamily: 'ElementalSansPro',
    fontWeight: FontWeight.normal,
    color: UiColor.back,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: UiColor.text_3,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: UiColor.text_1,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: UiColor.tarefa,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiColor.tarefa,
  );

  static const TextStyle buttonSelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: UiColor.back,
  );

  static const TextStyle link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiColor.link,
    decoration: TextDecoration.underline,
  );
}

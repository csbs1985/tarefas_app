import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/class/tipo-tarefa_class.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class SvgClass {
  SvgPicture boolSvgPicture(Map<String, dynamic> tarefa) {
    return tarefa['concluida'] == true
        ? SvgPicture.asset(UiSvg.fechado)
        : SvgPicture.asset(UiSvg.aberto);
  }

  SvgPicture svgPicture(String tarefa) {
    if (tarefa == TipoTarefaEnum.aniversario.value)
      return SvgPicture.asset(UiSvg.aniversario);
    if (tarefa == TipoTarefaEnum.evento.value)
      return SvgPicture.asset(UiSvg.evento);
    if (tarefa == TipoTarefaEnum.financeiro.value)
      return SvgPicture.asset(UiSvg.financeiro);
    if (tarefa == TipoTarefaEnum.lembrete.value)
      return SvgPicture.asset(UiSvg.lembrete);
    return SvgPicture.asset(UiSvg.ligar);
  }
}

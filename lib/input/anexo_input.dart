// import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:tarefas_app/button/limpar_button.dart';
// import 'package:tarefas_app/class/tipo_select_class.dart';
// import 'package:tarefas_app/core/constants.dart';
// import 'package:tarefas_app/modal/anexo_modal.dart';
// import 'package:tarefas_app/theme/ui_border.dart';
// import 'package:tarefas_app/theme/ui_color.dart';
// import 'package:tarefas_app/theme/ui_text.dart';

// class AnexoInput extends StatefulWidget {
//   const AnexoInput({
//     super.key,
//     required Function callback,
//     required TextEditingController controller,
//   })  : _callback = callback,
//         _controller = controller;

//   final Function _callback;

//   final TextEditingController _controller;

//   @override
//   State<AnexoInput> createState() => _AnexoInput2State();
// }

// class _AnexoInput2State extends State<AnexoInput> {
//   _openModal(TipoSelectEnum select) {
//     showCupertinoModalBottomSheet(
//       expand: true,
//       context: context,
//       barrierColor: UiColor.overlay,
//       duration: const Duration(milliseconds: 300),
//       builder: (context) => AnexoModal(
//         controller: widget._controller,
//         callback: (value) => _setControllerModal(value),
//       ),
//     );
//   }

//   void _setControllerModal(String value) {
//     setState(() {
//       widget._controller.text = value;
//       widget._callback(value);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         decoration: UiBorder.borda,
//         child: TextButton(
//           style: ButtonStyle(
//             padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
//           ),
//           onPressed: () => _openModal(TipoSelectEnum.tipoTarefa),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text(
//                         ANEXO,
//                         style: UiText.headline2,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
//                       child: Text(
//                         widget._controller.text.isNotEmpty
//                             ? widget._controller.text
//                             : SELECIONE,
//                         style: widget._controller.text.isNotEmpty
//                             ? UiText.headline1
//                             : UiText.headline3,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               LimparButton(
//                 callback: (value) => _setControllerModal(''),
//               ), // TODO: verificar se precisar passar o boolean
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

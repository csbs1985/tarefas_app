import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:image_picker/image_picker.dart';
import 'package:tarefas_app/classes/carregamento_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class AnexoModal extends StatefulWidget {
  const AnexoModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<AnexoModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<AnexoModal> {
  final List<XFile> _listFileGallery = [];

  // File? _imageCamera;

  Future<void> getFileGallery() async {
    final List<XFile> files = await ImagePicker().pickMultiImage();

    for (var file in files)
      if (await verifyFile(file)) _listFileGallery.add(file);
  }

  Future<bool> verifyFile(XFile file) async {
    final String extension = file.path.split('.').last.toLowerCase();

    switch (extension) {
      case 'pdf':
      case 'jpg':
      case 'jpeg':
      case 'png':
        final Future<File>? decodedFile = await File(file.path).exists()
            ? File(file.path)
                .readAsBytes()
                .then((bytes) => File.fromRawPath(bytes))
            : null;
        return decodedFile != null;
      default:
        return false;
    }
  }

  // void selectButton(dynamic selected) {
  // setState(() {
  //   widget._controller.text = button.text;
  //   widget._callback(button.text);

  //   Navigator.of(context).pop();
  // });
  // }

  void showPreview(File file) async {
    //   print(file);
    //   File? arq = await Get.to(() => PreviewPage(file: file));

    //   if (arq != null) {
    //     setState(() => _imageCamera = arq);
    //     Get.back();
    //   }
  }

  bool _checkSelected(String text) {
    return widget._controller.text == text ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 24),
                child: Text(ANEXO_SELECIONE, style: UiText.headline2),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  TextButton(
                    onPressed: () => getFileGallery(),
                    style: _checkSelected(ListaAnexo.first.text)
                        ? UiButton.buttonSelected
                        : UiButton.button,
                    child: Text(
                      ListaAnexo.first.text,
                      style: _checkSelected(ListaAnexo.first.text)
                          ? UiText.buttonSelected
                          : UiText.button,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CameraCamera(
                            onFile: (file) => showPreview(file),
                          ),
                        ),
                      );
                    },
                    style: _checkSelected(ListaAnexo.last.text)
                        ? UiButton.buttonSelected
                        : UiButton.button,
                    child: Text(
                      ListaAnexo.last.text,
                      style: _checkSelected(ListaAnexo.last.text)
                          ? UiText.buttonSelected
                          : UiText.button,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

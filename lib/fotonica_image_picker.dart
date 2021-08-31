import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FotonicaImagePicker extends StatefulWidget {
  final Function(File file) onChange;
  final double? width;
  final double? height;
  /// The image can be null until the picture are captured
  final Image? image;

  FotonicaImagePicker(
      {required this.onChange, this.width, this.height, this.image});

  @override
  State<StatefulWidget> createState() {
    return FotonicaImagePickerState();
  }
}

class FotonicaImagePickerState extends State<FotonicaImagePicker> {
  File? file;
  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void takePicture(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text("Abrir galeria"),
                onTap: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    setState(() {
                      this.file = File(file.path);
                    });
                    widget.onChange(File(file.path));
                  }
                },
                leading: Icon(Icons.image),
              ),
              ListTile(
                title: Text("Captura foto"),
                onTap: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  if (file != null) {
                    setState(() {
                      this.file = File(file.path);
                    });
                    widget.onChange(File(file.path));
                  }
                },
                leading: Icon(Icons.camera_alt),
              )
            ],
          );
        });
  }

  void editImage(File imageFile) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    if (croppedFile != null) {
      widget.onChange(croppedFile);
      setState(() {
        file = croppedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onLongPress: () {
          if (file != null) editImage(file!);
        },
        onTap: () {
          takePicture(context);
        },
        child: Container(
          // decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(.5)),
          height: widget.height,
          width: widget.width,
          child: widget.image != null
              ? widget.image
              : Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Theme.of(context).primaryColorLight,
                ),
        ),
      ),
    );
  }
}

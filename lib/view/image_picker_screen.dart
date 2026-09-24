import 'dart:io';

import 'package:bloc_demo_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_demo_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_demo_app/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker')),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () =>
                        context.read<ImagePickerBloc>().add(CameraCapture()),
                    child: Icon(Icons.camera, size: 60,),
                  ),
                  SizedBox(width:30,),
                  InkWell(
                    onTap: () =>
                        context.read<ImagePickerBloc>().add(GalleryImagePicker()),
                    child: Icon(Icons.image, size: 60,),
                  ),
                ],
              );
            } else {
              final file = state.file;
              if (file == null) {
                return const SizedBox.shrink();
              }
              return Image.file(File(file.path));
            }
          },
        ),
      ),
    );
  }
}

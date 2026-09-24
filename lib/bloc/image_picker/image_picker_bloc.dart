import 'package:bloc_demo_app/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_demo_app/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_demo_app/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()){
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }
}
import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();

  @override
  List<Object?> get props => [];
}


class GalleryImagePicker extends ImagePickerEvents {
  const GalleryImagePicker();
}

class CameraCapture extends ImagePickerEvents {
  const CameraCapture();
}
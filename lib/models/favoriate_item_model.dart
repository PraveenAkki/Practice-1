import 'package:equatable/equatable.dart';

class FavoriateItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavoriate;

  const FavoriateItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavoriate = false,
  });


  FavoriateItemModel copyWith({String? id, String? value, bool? isDeleting, bool? isFavoriate}){
    return FavoriateItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavoriate: isFavoriate ?? this.isFavoriate
    );
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavoriate];
}

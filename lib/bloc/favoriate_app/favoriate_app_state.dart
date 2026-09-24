import 'package:bloc_demo_app/models/favoriate_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoriateItemStates extends Equatable {

  final List<FavoriateItemModel> favoriateItemList;
  final List<FavoriateItemModel> tempfavoriateItemList;
  
  final ListStatus listStatus;

  const FavoriateItemStates({
    this.favoriateItemList = const [],
    this.tempfavoriateItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavoriateItemStates copyWith({
    List<FavoriateItemModel>? favoriateItemList,
    List<FavoriateItemModel>? tempfavoriateItemList,
    ListStatus? listStatus,
  }) {
    return FavoriateItemStates(
      favoriateItemList: favoriateItemList ?? this.favoriateItemList,
      tempfavoriateItemList: tempfavoriateItemList ?? this.tempfavoriateItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favoriateItemList, tempfavoriateItemList, listStatus];
}

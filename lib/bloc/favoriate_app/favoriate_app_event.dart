import 'package:bloc_demo_app/models/favoriate_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriateEvents extends Equatable {

  const FavoriateEvents();

  @override
  List<Object?> get props => [];
}


class FetchFavoriateList extends FavoriateEvents {
  const FetchFavoriateList();
}

class FavouriteItem extends FavoriateEvents {
  final FavoriateItemModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavoriateEvents {
  final FavoriateItemModel item;

  const SelectItem({required this.item});
}


class UnSelectItem extends FavoriateEvents {
  final FavoriateItemModel item;

  const UnSelectItem({required this.item});
}

class DeleteItem extends FavoriateEvents {
  const DeleteItem();
}

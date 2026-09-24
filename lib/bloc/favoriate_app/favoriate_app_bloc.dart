import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_event.dart';
import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_state.dart';
import 'package:bloc_demo_app/models/favoriate_item_model.dart';
import 'package:bloc_demo_app/repository/favoriate_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavoriateEvents, FavoriateItemStates> {

  List<FavoriateItemModel> favoriateList = [];
  List<FavoriateItemModel> tempfavoriateList = [];
  
  FavoriateRepository favoriateRepository;

  FavouriteBloc(this.favoriateRepository) : super(const FavoriateItemStates()) {
    on<FetchFavoriateList>(_fetchList);
    on<FavouriteItem>(_addFavourite);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchList(
    FetchFavoriateList event,
    Emitter<FavoriateItemStates> emit,
  ) async {
    favoriateList = await favoriateRepository.fetchItemList();
    emit(
      state.copyWith(
        favoriateItemList: List.from(favoriateList),
        tempfavoriateItemList: List.from(tempfavoriateList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _addFavourite(
    FavouriteItem event,
    Emitter<FavoriateItemStates> emit,
  ) async {
    final index = favoriateList.indexWhere((item) => item.id == event.item.id);

    if(event.item.isFavoriate) {
      if(tempfavoriateList.contains(favoriateList[index])) {
        tempfavoriateList.remove(favoriateList[index]);
        tempfavoriateList.add(event.item);
      }
    } else {
      if(tempfavoriateList.contains(favoriateList[index])) {
        tempfavoriateList.remove(favoriateList[index]);
        tempfavoriateList.add(event.item);
      }
    }

    favoriateList[index] = event.item;
    emit(state.copyWith(
        favoriateItemList: List.from(favoriateList),
        tempfavoriateItemList: List.from(tempfavoriateList)
    ));
  }

  void _selectItem(
    SelectItem event,
    Emitter<FavoriateItemStates> emit,
  ) async {
    tempfavoriateList.add(event.item);
    emit(state.copyWith(tempfavoriateItemList: List.from(tempfavoriateList)));
  }

  void _unSelectItem(
    UnSelectItem event,
    Emitter<FavoriateItemStates> emit,
  ) async {
    tempfavoriateList.remove(event.item);
    emit(state.copyWith(tempfavoriateItemList: List.from(tempfavoriateList)));
  }

  void _deleteItem(
    DeleteItem event,
    Emitter<FavoriateItemStates> emit,
  ) async {
    favoriateList.removeWhere((item) => tempfavoriateList.contains(item));
    tempfavoriateList.clear();
    emit(state.copyWith(favoriateItemList: List.from(favoriateList), tempfavoriateItemList: List.from(tempfavoriateList)));
  }


}
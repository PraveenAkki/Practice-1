import 'package:bloc_demo_app/models/favoriate_item_model.dart';

class FavoriateRepository {
  
  Future<List<FavoriateItemModel>> fetchItemList() async {
    await Future.delayed(Duration(seconds: 3));

    return List.of(_generateList(20));
  }

  List<FavoriateItemModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavoriateItemModel(
        id: index.toString(),
        value: 'Index ${index.toString()}',
      ),
    );
  }

}

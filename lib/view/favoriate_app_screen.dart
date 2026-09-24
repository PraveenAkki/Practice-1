import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_bloc.dart';
import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_event.dart';
import 'package:bloc_demo_app/bloc/favoriate_app/favoriate_app_state.dart';
import 'package:bloc_demo_app/models/favoriate_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  
  @override
  void initState() {
    super.initState();

    context.read<FavouriteBloc>().add(FetchFavoriateList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'), 
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            context.read<FavouriteBloc>().add(DeleteItem());
          }, icon: Icon(Icons.delete, color: Colors.red, size: 30,))
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBloc, FavoriateItemStates>(
          builder: (context, state) {
        
            switch (state.listStatus) {
        
              case ListStatus.loading:
                return Center(child: const CircularProgressIndicator());
        
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriateItemList.length,
                  itemBuilder: (context, index) {
                    final listItem = state.favoriateItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.tempfavoriateItemList.contains(listItem) ? true : false,
                          onChanged: (value){
                            if(value!){
                              context.read<FavouriteBloc>().add(SelectItem(item: listItem));
                            }
                            else{
                              context.read<FavouriteBloc>().add(UnSelectItem(item: listItem));
                            }
                          }
                        ),
                        title: Text(listItem.value),
                        trailing: IconButton(onPressed: (){

                          FavoriateItemModel favItem = FavoriateItemModel(
                            id: listItem.id, 
                            value: listItem.value,
                            isFavoriate: listItem.isFavoriate ? false : true
                           );

                          context.read<FavouriteBloc>().add(FavouriteItem(item: favItem));
                        }, icon: Icon(
                          listItem.isFavoriate ? 
                          Icons.favorite : 
                          Icons.favorite_outline
                        )),
                      ),
                    );
                  },
                );
        
              case ListStatus.failure:
                return Text('Something went wrong');
        
            }
          },
        ),
      ),
    );
  }
}

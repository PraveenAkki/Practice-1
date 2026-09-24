import 'package:bloc_demo_app/bloc/posts/post_events.dart';
import 'package:bloc_demo_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts/post_bloc.dart';
import '../bloc/posts/post_states.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState(){
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BLoC Posts APIs')),
      ),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch(state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search with Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    onChanged: (filterKey){
                      context.read<PostBloc>().add(SearchItem(strSearch: filterKey));
                    },
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: state.searchMessage.isNotEmpty ?
                        Center(child: Text(state.searchMessage.toString())) :
                    ListView.builder(
                      itemCount: state.tempPostList.isEmpty ?  state.postList.length : state.tempPostList.length,
                      itemBuilder: (context, index) {
                        final item = state.tempPostList.isEmpty ? state.postList[index] : state.tempPostList[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.email.toString()),
                            subtitle: Text(item.body.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
          }
      },),
    );
  }
}

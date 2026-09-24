import 'package:bloc_demo_app/bloc/posts/post_events.dart';
import 'package:bloc_demo_app/bloc/posts/post_states.dart';
import 'package:bloc_demo_app/models/post_models.dart';
import 'package:bloc_demo_app/repository/post_repository.dart';
import 'package:bloc_demo_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {

  List<PostModel> postList = [];
  List<PostModel> tempPostList = [];
  PostRepository _postRepository;

  PostBloc(this._postRepository) : super(const PostStates()){
    on<PostFetched>(_fetchPostApi);
    on<SearchItem>(_filterList);
  }

  void _fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await _postRepository.fetchPost().then((value) {
      postList = value;
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: postList,
        message: 'Success'
      ));
    },).onError((error, stackTrace) {
      print("stacktrace: ${stackTrace.toString()}");
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
    },);
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit){

    if(event.strSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {

      /// Search with ID
      // tempPostList = state.postList.where((element) {
      //   return element.id.toString() == event.strSearch.toString();
      // },).toList();

      ///Search with Email
      tempPostList = state.postList.where((element) {
              return element.email.toString().toLowerCase()
                  .contains(event.strSearch.toString().toLowerCase());
            },).toList();

      if(tempPostList.isEmpty){
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
      }
    }

  }

}

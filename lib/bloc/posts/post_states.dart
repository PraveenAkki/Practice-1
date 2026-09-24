import 'package:bloc_demo_app/models/post_models.dart';
import 'package:bloc_demo_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {

  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.tempPostList = const [],
    this.message = '',
    this.searchMessage = ''
  });

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    List<PostModel>? tempPostList,
    String? message,
    String? searchMessage
  }){
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage
    );
  }

  @override
  List<Object> get props => [postStatus, postList, tempPostList, message, searchMessage];
}

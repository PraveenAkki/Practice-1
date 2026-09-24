import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable {
  const PostEvents();

  @override
  List<Object> get props => [];

}

class PostFetched extends PostEvents {
  const PostFetched();
}

class SearchItem extends PostEvents {
  final String strSearch;
  const SearchItem({required this.strSearch});
}
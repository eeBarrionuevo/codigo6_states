abstract class PostState {}

class PostInitState extends PostState {}

class PostLoadingState extends PostState {}

class PostSucceedState extends PostState {
  final List data;
  PostSucceedState({required this.data});
}

class PostErrorState extends PostState {}

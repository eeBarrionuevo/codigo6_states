import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  ApiService apiService = ApiService();

  PostBloc() : super(PostErrorState()) {
    on<GetPostEvent>((event, emit) async {
      emit(PostLoadingState());
      List posts = await apiService.getPosts();
      emit(PostSucceedState(data: posts));
    });
  }
}

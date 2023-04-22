import 'package:codigo6_states/cubit/posts/post_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitState());

  ApiService apiService = ApiService();

  getPostsData() async {
    List<Map> posts = await apiService.getPosts();
  }
}

import 'package:bloc/bloc.dart';
import 'package:task1/core/models/posts_model.dart';
import 'package:task1/core/services/posts.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getPosts();
  }
  List<Posts> posts = [];
  //int likeCount = 0;

  getPosts() async {
    try {
      final fetchedPosts = await ApiServices.fetchPhotos();
  
      posts = fetchedPosts;
      emit(HomeLoaded(posts: posts));
    } catch (e) {
      emit(HomeError(message: 'Failed to fetch posts: $e'));
    }
  }

  void likeCountt(int index) {
    if (index >= 0 && index < posts.length) {
      posts[index].likeCount++;
      emit(HomeLoaded(posts: posts));
    }
  }
}

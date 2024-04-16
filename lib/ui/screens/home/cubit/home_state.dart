part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
   List<Posts> posts;

  HomeLoaded({required this.posts});
}

class HomeError extends HomeState {
   String message;

  HomeError({required this.message});
}
// class LikeCount extends HomeState {
//    int count;

//   LikeCount({required this.count});
// }
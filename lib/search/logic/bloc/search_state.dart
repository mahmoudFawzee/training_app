part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class GotAllCoursesState extends SearchState {
  final List<Course> courses;
  const GotAllCoursesState({required this.courses});
  @override
  List<Object> get props => [courses];
}

class GotSearchedCoursesState extends SearchState {
  final List<Course?> courses;
  const GotSearchedCoursesState({required this.courses});
  @override
  List<Object> get props => [courses];
}

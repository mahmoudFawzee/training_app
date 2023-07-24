part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchForCoursesEvent extends SearchEvent {
  final String keyword;
  const SearchForCoursesEvent({required this.keyword});
  @override
  List<Object> get props => [keyword];
}

class GetAllCoursesEvent extends SearchEvent {
  const GetAllCoursesEvent();
}

class CallInitialEvent extends SearchEvent {
  const CallInitialEvent();
}

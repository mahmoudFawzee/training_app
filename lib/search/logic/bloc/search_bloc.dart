import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/search/data/constants/data_list.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchInitial()) {
    on<SearchForCoursesEvent>((event, emit) {
      final List<Course?> result = DataList.coursesList.map<Course?>((course) {
        final bool accepted = course.name.contains(event.keyword) ||
            course.instructor.contains(event.keyword);
        if (accepted) return course;
        return null;
      }).toList();
      emit(GotSearchedCoursesState(courses: result));
    });
    on<GetAllCoursesEvent>((event, emit) {
      emit(const GotAllCoursesState(courses: DataList.coursesList));
    });

    on<CallInitialEvent>((event, emit) {
      emit(const SearchInitial());
    });
  }
}

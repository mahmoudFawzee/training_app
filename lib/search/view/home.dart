import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/search/data/constants/data_list.dart';
import 'package:flutter_training/search/logic/bloc/search_bloc.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});
  static final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(const GetAllCoursesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('search'),
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    onChanged: (value) {
                      context
                          .read<SearchBloc>()
                          .add(SearchForCoursesEvent(keyword: value));
                    },
                    decoration: InputDecoration(
                      enabledBorder: textFieldDecoration(false),
                      focusedBorder: textFieldDecoration(true),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is GotAllCoursesState) {
                        final courses = state.courses;
                        log('all : ${courses.length}');
                        return coursesListView(courses);
                      } else if (state is GotSearchedCoursesState) {
                        log('searched : ${state.courses.length}');
                        return coursesListView(state.courses);
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget coursesListView(List<Course?> courses) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        log('course : $courses');
        if (course == null) return Container();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: (Radius.circular(15)),
                ),
                child: Image.asset(course.imgPath),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'by: ${course.instructor}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  OutlineInputBorder textFieldDecoration(bool focused) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: focused ? Colors.black : Colors.blue,
      ),
    );
  }
}

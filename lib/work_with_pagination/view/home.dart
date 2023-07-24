import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_training/work_with_pagination/logic/blocs/bloc/passengers_bloc.dart';

class PassengersHomeScreen extends StatefulWidget {
  const PassengersHomeScreen({super.key});

//  static final RefreshController _refreshController = RefreshController();

  @override
  State<PassengersHomeScreen> createState() => _PassengersHomeScreenState();
}

class _PassengersHomeScreenState extends State<PassengersHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // User has reached the top of the ListView
          log('top');
        } else {
          // User has reached the bottom of the ListView
          log('bottom');
          context
              .read<PassengersBloc>()
              .add(const GetPassengersEvent(isFirstCall: false));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pagination'),
      ),
      body: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<PassengersBloc>()
                .add(const GetPassengersEvent(isFirstCall: true));
          },
          child: BlocConsumer<PassengersBloc, PassengersState>(
            listener: (context, state) {
              if (state is! PassengersInitial) {
                context.read<PassengersBloc>().add(const CallInitialEvent());
              }
            },
            buildWhen: (previous, current) {
              return current is! PassengersInitial;
            },
            builder: (context, state) {
             if (state is PassengersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PassengersErrorState) {
                return const Center(
                  child: Text('some error ocurred'),
                );
              } else if (state is GotPassengersState) {
                final passengersList = state.passengers;
                log('${passengersList.length}');
                return ListView.separated(
                  itemCount: passengersList.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final passenger = passengersList[index];
                    return ListTile(
                      title: Text(passenger.name),
                      subtitle: Text(
                        passenger.airline.country,
                        style: const TextStyle(color: Colors.green),
                      ),
                      trailing: Text(
                        passenger.airline.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                  separatorBuilder: (context, _) {
                    return const Divider();
                  },
                );
              }
              return Container();
            },
          ),
        );
      }),
    );
  }
}

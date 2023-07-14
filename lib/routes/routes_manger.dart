import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/notifications/logic/bloc/local_notifications_cubit/local_notifications_cubit.dart';
import 'package:flutter_training/notifications/views/screens/notifications_screen.dart';

class RoutesManger {
  static const initialRoute = NotificationsScreen.pageRoute;
  static final _notificationCubit = LocalNotificationsCubit();
  static final Map<String, Widget Function(BuildContext)> routes = {
    NotificationsScreen.pageRoute: (ctx) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: _notificationCubit,
            ),
          ],
          child: const NotificationsScreen(),
        ),
  };
}

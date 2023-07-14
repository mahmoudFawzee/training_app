import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_notifications_state.dart';

class LocalNotificationsCubit extends Cubit<LocalNotificationsState> {
  LocalNotificationsCubit() : super(LocalNotificationsInitial());
}

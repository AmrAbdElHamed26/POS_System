import 'package:equatable/equatable.dart';

abstract class AdminHomeEvents extends Equatable {
  const AdminHomeEvents();

  @override
  List<Object> get props =>[];
}

class GetTimeAndDateUsingTimeStampEvent extends AdminHomeEvents {}

class GetUserNameEvent extends AdminHomeEvents {}

class GetAllNotesEvent extends AdminHomeEvents{}
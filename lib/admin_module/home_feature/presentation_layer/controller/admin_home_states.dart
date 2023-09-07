import 'package:equatable/equatable.dart';

enum RequestState {
  loading,
  loaded,
  error,
}

class AdminHomeStates extends Equatable {
  /// time and date data
  final String timeAndDate;
  final RequestState timeAndDateStates;

  /// user name data
  final String userName;

  final RequestState userNameStates;

  /// constructor
  const AdminHomeStates({
    this.timeAndDate = "",
    this.timeAndDateStates = RequestState.loading,
    this.userName = "",
    this.userNameStates = RequestState.loading,
  });

  /// copy with to avoid remove data from previous states
  AdminHomeStates copyWith({
    String? timeAndDate,
    RequestState? timeAndDateStates,
    String? userName,
    RequestState? userNameStates,
  }) {
    return AdminHomeStates(
      timeAndDate: timeAndDate ?? this.timeAndDate,
      timeAndDateStates: timeAndDateStates ?? this.timeAndDateStates,
      userName: userName ?? this.userName,
      userNameStates: userNameStates ?? this.userNameStates,
    );
  }

  /// from equatable class to save memory
  @override
  List<Object?> get props =>
      [timeAndDate, timeAndDateStates, userName, userNameStates];
}

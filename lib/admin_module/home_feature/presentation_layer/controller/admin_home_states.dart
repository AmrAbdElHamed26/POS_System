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


  /// constructor
  const AdminHomeStates({
    this.timeAndDate = "",
    this.timeAndDateStates = RequestState.loading,
  });

  /// copy with to avoid remove data from previous states
  AdminHomeStates copyWith({
    String? timeAndDate,
    RequestState? timeAndDateStates,
  }) {
    return AdminHomeStates(
      timeAndDate: timeAndDate ?? this.timeAndDate,
      timeAndDateStates: timeAndDateStates ?? this.timeAndDateStates,
    );
  }

  /// from equatable class to save memory
  @override
  List<Object?> get props => [timeAndDate, timeAndDateStates];
}

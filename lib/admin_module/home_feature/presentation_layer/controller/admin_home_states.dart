import 'package:equatable/equatable.dart';

import '../../../../shared/enums.dart';
import '../../data_layer/models/all_notes_model.dart';



class AdminHomeStates extends Equatable {
  /// time and date data
  final String timeAndDate;
  final RequestState timeAndDateStates;

  /// user name data
  final String userName;
  final RequestState userNameStates;

  /// all notes data
  final List<AllNotesModel> allNotesData ;
  final RequestState allNotesState ;

  /// constructor
  const AdminHomeStates({
    this.timeAndDate = "",
    this.timeAndDateStates = RequestState.loading,
    this.userName = "",
    this.userNameStates = RequestState.loading,

    this.allNotesData = const [] ,
    this.allNotesState = RequestState.loading,
  });

  /// copy with to avoid remove data from previous states
  AdminHomeStates copyWith({
    String? timeAndDate,
    RequestState? timeAndDateStates,
    String? userName,
    RequestState? userNameStates,

    List<AllNotesModel>? allNotesData,
    RequestState? allNotesState ,

  }) {
    return AdminHomeStates(
      timeAndDate: timeAndDate ?? this.timeAndDate,
      timeAndDateStates: timeAndDateStates ?? this.timeAndDateStates,
      userName: userName ?? this.userName,
      userNameStates: userNameStates ?? this.userNameStates,

      allNotesData : allNotesData ?? this.allNotesData,
      allNotesState: allNotesState?? this.allNotesState,


    );
  }

  /// from equatable class to save memory
  @override
  List<Object?> get props =>
      [timeAndDate, timeAndDateStates, userName, userNameStates , allNotesData ,allNotesState];
}

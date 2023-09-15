import 'package:equatable/equatable.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';

import '../../../home_feature/data_layer/models/all_to_do_list_model.dart';
import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';



class AdminNotesStates extends Equatable {
  final RequestState addNoteState;

  /// all notes list data
  final List<AllNotesModel> allNotesData;
  final RequestState allNotesState;

  const AdminNotesStates({
    this.addNoteState = RequestState.loading,

    this.allNotesData = const [],
    this.allNotesState = RequestState.loading ,
  });

  AdminNotesStates copyWith({
    RequestState? addNoteState,

    List<AllNotesModel> ? allNotesData ,
    RequestState ? allNotesState ,
  }) {
    return AdminNotesStates(addNoteState: addNoteState ?? this.addNoteState,
        allNotesData : allNotesData ?? this.allNotesData ,
      allNotesState: allNotesState ?? this.allNotesState ,
    );
    }

  @override
  List<Object?> get props => [addNoteState , allNotesData, allNotesState ];
}

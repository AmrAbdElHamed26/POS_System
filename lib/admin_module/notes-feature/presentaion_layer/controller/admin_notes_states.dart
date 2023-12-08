import 'package:equatable/equatable.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';

import '../../../../shared/enums.dart';
import '../../../home_feature/data_layer/models/all_to_do_list_model.dart';



class AdminNotesStates extends Equatable {
  final RequestState addNoteState;

  /// all notes list data
  final List<AllNotesModel> allNotesData;
  final RequestState allNotesState;

  /// all To Do List data
  final List<AllToDoListModel> allToDoListData;
  final RequestState allToDoState;


  final bool showAddNoteScreen;


  const AdminNotesStates({
    this.showAddNoteScreen = false,

    this.addNoteState = RequestState.loading,

    this.allNotesData = const [],
    this.allNotesState = RequestState.loading ,

    this.allToDoListData = const [],
    this.allToDoState = RequestState.loading ,
  });

  AdminNotesStates copyWith({
    RequestState? addNoteState,

    List<AllNotesModel> ? allNotesData ,
    RequestState ? allNotesState ,

    List<AllToDoListModel> ? allToDoListData ,
    RequestState ? allToDoState ,

    bool? showAddNoteScreen,
  }) {
    return AdminNotesStates(addNoteState: addNoteState ?? this.addNoteState,
        allNotesData : allNotesData ?? this.allNotesData ,
      allNotesState: allNotesState ?? this.allNotesState ,
      showAddNoteScreen: showAddNoteScreen ?? this.showAddNoteScreen,

      allToDoListData : allToDoListData ?? this.allToDoListData ,
      allToDoState: allToDoState ?? this.allToDoState ,

    );
    }

  @override
  List<Object?> get props => [addNoteState , allNotesData, allNotesState,showAddNoteScreen ,allToDoListData ,allToDoState];
}

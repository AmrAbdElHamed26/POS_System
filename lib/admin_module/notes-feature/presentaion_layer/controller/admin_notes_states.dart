import 'package:equatable/equatable.dart';

import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';



class AdminNotesStates extends Equatable {
  final RequestState addNoteState;

  const AdminNotesStates({
    this.addNoteState = RequestState.loading,
  });

  AdminNotesStates copyWith({
    RequestState? addNoteState,
  }) {
    return AdminNotesStates(addNoteState: addNoteState ?? this.addNoteState);
    }

  @override
  List<Object?> get props => [addNoteState];
}

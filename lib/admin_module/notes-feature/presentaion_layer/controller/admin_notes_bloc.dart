
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_events.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_states.dart';
import 'package:side_proj/services/save_data.dart';
import 'package:side_proj/services/services_locator.dart';


import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';
import '../../domain_layer/use_cases/add_note_use_case.dart';

class AdminNotesBloc extends Bloc<AdminNotesEvents, AdminNotesStates> {
  final AddNoteUseCase addNoteUseCase ;
  AdminNotesBloc(this.addNoteUseCase):super(const AdminNotesStates()){

    on<AddNoteEvent>(_addNote);
  }



  FutureOr<void> _addNote( event, emit )async  {
     await addNoteUseCase.execute(event.note);

     adminScreenData.allNotes.add(event.note);

     emit(state.copyWith(
       addNoteState: RequestState.loaded,
     ));

     emit(state.copyWith(
       addNoteState: RequestState.loading,
     ));

  }




}

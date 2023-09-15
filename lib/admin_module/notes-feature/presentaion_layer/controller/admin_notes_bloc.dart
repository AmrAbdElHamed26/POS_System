
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/notes-feature/domain_layer/use_cases/get_all_notes_use_case_notes.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_events.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_states.dart';
import 'package:side_proj/services/save_data.dart';
import 'package:side_proj/services/services_locator.dart';


import '../../../home_feature/domain_layer/use_cases/get_all_notes_use_case.dart';
import '../../../home_feature/presentation_layer/controller/admin_home_states.dart';
import '../../domain_layer/use_cases/add_note_use_case.dart';

class AdminNotesBloc extends Bloc<AdminNotesEvents, AdminNotesStates> {
  final AddNoteUseCase addNoteUseCase ;
  final GetAllNotesUseCaseNotes getAllNotesUseCaseNotes;
  AdminNotesBloc(this.addNoteUseCase , this.getAllNotesUseCaseNotes):super(const AdminNotesStates()){

    on<AddNoteEvent>(_addNote);
    on<GetAllNotesEvent>(_getAllNotesData);
  }

  FutureOr<void> _getAllNotesData( event, emit )async  {
  /// to do handle save data
    final result = await getAllNotesUseCaseNotes.execute();
    emit(state.copyWith(allNotesData: result,
      allNotesState: RequestState.loaded,));
  }

  FutureOr<void> _addNote( event, emit )async  {
     await addNoteUseCase.execute(event.note);

     adminScreenData.allNotesData.add(event.note);

     emit(state.copyWith(
       addNoteState: RequestState.loaded,
     ));

     emit(state.copyWith(
       addNoteState: RequestState.loading,
     ));

  }




}

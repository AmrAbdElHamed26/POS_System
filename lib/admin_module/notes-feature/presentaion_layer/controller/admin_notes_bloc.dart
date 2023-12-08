import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/use_cases/get_all_to_do_list_use_case.dart';
import 'package:side_proj/admin_module/notes-feature/domain_layer/use_cases/get_all_notes_use_case_notes.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_events.dart';
import 'package:side_proj/admin_module/notes-feature/presentaion_layer/controller/admin_notes_states.dart';
import 'package:side_proj/services/save_data.dart';

import '../../../../shared/enums.dart';
import '../../domain_layer/use_cases/add_note_use_case.dart';


class AdminNotesBloc extends Bloc<AdminNotesEvents, AdminNotesStates> {
  final AddNoteUseCase addNoteUseCase;

  final GetAllNotesUseCaseNotes getAllNotesUseCaseNotes;
  final GetAllToDoListUseCase getAllToDoListUseCase;


  AdminNotesBloc(this.addNoteUseCase, this.getAllNotesUseCaseNotes , this.getAllToDoListUseCase)
      : super(const AdminNotesStates()) {
    on<AddNoteEvent>(_addNote);
    on<GetAllNotesEvent>(_getAllNotesData);
    on<GetAllToDoEvent>(_getAllToDoData);


    on<ShowAddNoteScreenEvent>((event, emit) {
      emit(state.copyWith(
        showAddNoteScreen:true ,
      ));
    });
    on<HideAddNoteScreenEvent>((event, emit) {
      emit(state.copyWith(
        showAddNoteScreen:false ,
      ));
    });
  }

  FutureOr<void> _getAllNotesData(event, emit) async {
    /// to do handle save data
    final result = await getAllNotesUseCaseNotes.execute();
    adminScreenData.allNotesData = result;
    emit(state.copyWith(
      allNotesData: result,
      allNotesState: RequestState.loaded,
    ));
  }

  FutureOr<void> _getAllToDoData(event, emit) async {
    final result = await getAllToDoListUseCase.execute();
    log("all to do list $result");
    emit(state.copyWith(
      allToDoListData: result,
      allToDoState: RequestState.loaded,
    ));
  }

  FutureOr<void> _addNote(event, emit) async {
    adminScreenData.allNotesData.add(event.note);

    await addNoteUseCase.execute(event.note);

    emit(state.copyWith(
      addNoteState: RequestState.loading,
    ));

  }
}

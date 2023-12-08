import 'package:side_proj/admin_module/home_feature/data_layer/models/all_to_do_list_model.dart';

import '../admin_module/home_feature/data_layer/models/all_notes_model.dart';

SaveData adminScreenData = SaveData();
class SaveData {
  /// quick notes
  List<AllNotesModel> _allQuickNotes = [];
  bool _allQuickNotesChanges = true ; /// will change if i add new note

  /// quick to do
  List<AllToDoListModel> _allQuickTodos =[];
  bool _allQucikToDoListChanges = true; /// will change if i add new to do

  /// all notes data
  List<AllNotesModel> _allNotesData = [];
  bool _allNotesChanges = true;

  List<AllNotesModel> get allNotesData => _allNotesData;

  set allNotesData(List<AllNotesModel> value) {
    _allNotesData = value;
  }

  List<AllNotesModel> get allQuickNotes => _allQuickNotes;
  set allQuickNotes(List<AllNotesModel> notes) {
    _allQuickNotes = notes;
  }
  bool get allQuickNotesChanges => _allQuickNotesChanges ;
  void allQuickNotesNewState(bool state){
    _allQuickNotesChanges = state;
  }

  List<AllToDoListModel> get allQuickToDoList => _allQuickTodos;
  bool get allQuickToDoListChanges => _allQucikToDoListChanges ;

  set setAllQuickToDoListData(List<AllToDoListModel> data ){
    _allQuickTodos = data ;
  }
  void setAllQuickToDoListChanges(bool state){
    _allQucikToDoListChanges = state;
  }

  bool get allNotesChanges => _allNotesChanges;

  set allNotesChanges(bool value) {
    _allNotesChanges = value;
  }
}

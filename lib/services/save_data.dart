import '../admin_module/home_feature/data_layer/models/all_notes_model.dart';

SaveData adminScreenData = SaveData();
class SaveData {
  List<AllNotesModel> _allNotes = [];
  //List<AllTodoModel> _allTodos =[];

  List<AllNotesModel> get allNotes => _allNotes;

  set allNotes(List<AllNotesModel> notes) {
    _allNotes = notes;
  }

  /*set allTodos(List<AllTodoModel> todos){
    _allTodos = todos;
  }*/
}

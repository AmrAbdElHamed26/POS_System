import '../admin_module/home_feature/data_layer/models/all_notes_model.dart';

SaveData adminScreenData = SaveData();
class SaveData {
  List<AllNotesModel> _allNotes = [];

  List<AllNotesModel> get allNotes => _allNotes;

  set allNotes(List<AllNotesModel> notes) {
    _allNotes = notes;
  }
}

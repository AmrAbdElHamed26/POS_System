import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';

import '../../../home_feature/data_layer/models/all_to_do_list_model.dart';

abstract class BaseAdminNotesRepository {

  /// get all notes is done in admin_home_screen

  Future<void>addNote(AllNotesModel note);
  Future<List<AllNotesModel>> getAllNotesData();
  Future<List<AllToDoListModel>> getAllToDoData();

}

// bin notes
// get all notes
//get all to do
// add note
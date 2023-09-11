import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';

abstract class BaseAdminNotesRepository {

  /// get all notes is done in admin_home_screen

  Future<void>addNote(AllNotesModel note);

}

// bin notes
// get all notes
//get all to do
// add note
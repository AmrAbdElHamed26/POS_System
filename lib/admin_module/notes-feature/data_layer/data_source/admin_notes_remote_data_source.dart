

import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_to_do_list_model.dart';
import 'package:side_proj/services/fire_store_functions.dart';
import 'package:side_proj/services/services_locator.dart';

abstract class BaseAdminNotesRemoteDataSource{
  Future<void>addNote(AllNotesModel note);
  Future<List<AllNotesModel>>getAllNotesData();
  Future<List<AllToDoListModel>>getAllToDoData();
}

class AdminNotesRemoteDataSource extends BaseAdminNotesRemoteDataSource{
  @override
  Future<void> addNote(AllNotesModel note) async {
    await getIt<FireStoreFunctions>().addNoteService(note);
  }

  @override
  Future<List<AllNotesModel>> getAllNotesData() async {
    final result = await FireStoreFunctions().getAllNotesService(userDocumentId: "AJn92NJE9hh8XUnzRtda");
    return result ;
  }

  @override
  Future<List<AllToDoListModel>> getAllToDoData() async {
    final result = await FireStoreFunctions().getAllToDoService(userDocumentId: "AJn92NJE9hh8XUnzRtda");
    return result ;
  }

}
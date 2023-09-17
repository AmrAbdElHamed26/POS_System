import 'package:side_proj/admin_module/home_feature/data_layer/models/all_notes_model.dart';
import 'package:side_proj/admin_module/home_feature/data_layer/models/all_to_do_list_model.dart';
import 'package:side_proj/admin_module/notes-feature/data_layer/data_source/admin_notes_remote_data_source.dart';
import 'package:side_proj/admin_module/notes-feature/domain_layer/repository/base_admin_notes_repository.dart';

class AdminNotesRepository extends BaseAdminNotesRepository{

  final BaseAdminNotesRemoteDataSource baseAdminNotesRemoteDataSource ;
  AdminNotesRepository(this.baseAdminNotesRemoteDataSource);
  @override
  Future<void> addNote(AllNotesModel note) async {
    baseAdminNotesRemoteDataSource.addNote(note);
  }

  @override
  Future<List<AllNotesModel>> getAllNotesData() async {
      final result = await  baseAdminNotesRemoteDataSource.getAllNotesData();
      return result ;
  }

  @override
  Future<List<AllToDoListModel>> getAllToDoData()async {
    final result = await  baseAdminNotesRemoteDataSource.getAllToDoData();
    return result ;
  }

}
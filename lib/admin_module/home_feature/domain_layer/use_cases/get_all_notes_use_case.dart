import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';

import '../../data_layer/models/all_notes_model.dart';

class GetAllNotesUseCase{
  final BaseAdminHomeRepository baseAdminHomeRepository ;

  GetAllNotesUseCase(this.baseAdminHomeRepository);

  Future<List<AllNotesModel>> execute() async {
    return await baseAdminHomeRepository.getAllNotes();
  }

}
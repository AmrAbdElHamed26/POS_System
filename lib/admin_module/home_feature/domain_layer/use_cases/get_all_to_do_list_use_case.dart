import 'package:side_proj/admin_module/home_feature/data_layer/models/all_to_do_list_model.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';


class GetAllToDoListUseCase{
  final BaseAdminHomeRepository baseAdminHomeRepository ;

  GetAllToDoListUseCase(this.baseAdminHomeRepository);

  Future<List<AllToDoListModel>> execute() async {
    return await baseAdminHomeRepository.getAllToDoList();
  }

}
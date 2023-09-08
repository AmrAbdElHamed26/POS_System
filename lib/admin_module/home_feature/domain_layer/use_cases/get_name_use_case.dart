import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';

class GetUserNameUseCase{
  final BaseAdminHomeRepository baseAdminHomeRepository ;

  GetUserNameUseCase(this.baseAdminHomeRepository);

  Future<String> execute() async {
    return await baseAdminHomeRepository.getUserName();
  }

}
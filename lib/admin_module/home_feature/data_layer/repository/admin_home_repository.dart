import 'package:side_proj/admin_module/home_feature/data_layer/data_source/admin_home_remote_data_source.dart';
import 'package:side_proj/admin_module/home_feature/domain_layer/repository/base_admin_home_repository.dart';

class AdminHomeRepository extends BaseAdminHomeRepository{

  final BaseAdminHomeRemoteDataSource baseAdminHomeRemoteDataSource ;

  AdminHomeRepository(this.baseAdminHomeRemoteDataSource);

  @override
  Future<String> getDateAndTimeUsingTimeStamp() async {

    final result = await baseAdminHomeRemoteDataSource.getDateAndTimeUsingTimeStamp();

    return result ;

  }

  @override
  Future<String> getUserName() async {

    final result = await baseAdminHomeRemoteDataSource.getUserName();

    return result ;
  }

}
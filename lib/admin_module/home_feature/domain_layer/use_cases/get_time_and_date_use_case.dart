import '../repository/base_admin_home_repository.dart';

class GetTimeAndDateUsingTimeStampUseCase {
  final BaseAdminHomeRepository baseAdminHomeRepository;

  GetTimeAndDateUsingTimeStampUseCase(this.baseAdminHomeRepository);

  Future<String> execute() async {
    return await baseAdminHomeRepository.getDateAndTimeUsingTimeStamp();
  }
}

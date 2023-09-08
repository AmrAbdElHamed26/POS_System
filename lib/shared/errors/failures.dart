abstract class Failure{
  final String errorMessage;

  Failure(this.errorMessage);
}
class RegistrationFailure extends Failure{
  RegistrationFailure(super.errorMessage);

}
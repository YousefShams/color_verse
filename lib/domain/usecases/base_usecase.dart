abstract class BaseUsecase {}


abstract class BaseUsecaseOut<In,Out> implements BaseUsecase {
  Out execute(In input);
}

abstract class BaseUsecaseFuture<In,Out> implements BaseUsecase {
  Future<Out> execute(In input);
}
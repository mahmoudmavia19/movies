abstract class BaseUseCase <input,output>{
  Future<output> execute(input);
}
  void nullVoid() {}

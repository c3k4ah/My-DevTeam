import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/repository.dart';

class DeleteUserUseCase extends Usecase<void, NoParams> {
  final HomeRepository repository;

  DeleteUserUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.deleteUser();
  }
}

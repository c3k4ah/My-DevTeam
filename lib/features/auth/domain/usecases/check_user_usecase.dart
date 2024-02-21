import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../domain.dart';

class CheckUserUseCase extends Usecase<bool, NoParams> {
  final AuthRepository domainRepo;
  CheckUserUseCase({required this.domainRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return domainRepo.checkIfUserCached();
  }
}

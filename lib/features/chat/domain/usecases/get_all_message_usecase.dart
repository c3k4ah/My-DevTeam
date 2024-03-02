import 'package:dartz/dartz.dart';

import 'package:mydevteam/core/error/failure.dart';

import '../../../../core/usecase/usecase.dart';
import '../entites/message_entity.dart';
import '../repositories/repositorie.dart';

class GetAllMessagesUseCase extends Usecase<List<MessageEntity>, NoParams> {
  final ChatRepository repository;

  GetAllMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MessageEntity>>> call(NoParams params) async {
    return await repository.getAllMessages();
  }
}

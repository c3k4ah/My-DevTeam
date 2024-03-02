import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entites/message_entity.dart';
import '../repositories/repositorie.dart';

class SendMessageUseCase extends Usecase<MessageEntity, MessageEntity> {
  final ChatRepository chatRepository;

  SendMessageUseCase(this.chatRepository);

  @override
  Future<Either<Failure, MessageEntity>> call(MessageEntity params) async {
    return await chatRepository.sendMessage(params);
  }
}

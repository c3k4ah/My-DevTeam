import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entites/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<MessageEntity>>> getAllMessages();

  Future<Either<Failure, MessageEntity>> sendMessage(MessageEntity message);
}

import 'package:dartz/dartz.dart';

import 'package:mydevteam/core/error/failure.dart';
import 'package:mydevteam/features/chat/data/models/message_model.dart';

import 'package:mydevteam/features/chat/domain/entites/message_entity.dart';

import '../../domain/repositories/repositorie.dart';
import '../datasources/chat_data_source.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDataSource datasource;

  ChatRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<MessageEntity>>> getAllMessages() async {
    try {
      final result = await datasource.getAllMessages();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage(
      MessageEntity message) async {
    try {
      final result =
          await datasource.sendMessage(MessageModel.fromEntity(message));
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}

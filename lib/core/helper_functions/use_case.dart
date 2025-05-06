import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';

abstract class UseCase<Type, Param> {
  Future<Either<ServerException, Type>> call(Param param);
}

class NoParam {}

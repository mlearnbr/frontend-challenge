import 'package:dartz/dartz.dart';
import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:flutter_application/features/character_list/domain/entities/specie_entity.dart';

abstract class ICharacterListRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacterList({int? page});
  Future<Either<Failure, SpecieEntity>> getCharacterSpecie(
      {required String? url});
}

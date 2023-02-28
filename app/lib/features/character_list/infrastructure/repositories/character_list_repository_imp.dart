import 'dart:convert';

import 'package:flutter_application/core/constants/endpoints.dart';
import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/core/failures/httpError_to_failure.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application/features/character_list/domain/repositories/character_list_repository.dart';
import 'package:flutter_application/features/character_list/infrastructure/models/character_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network.dart';
import '../../../../core/services/http/http.dart';

@Injectable(as: ICharacterListRepository)
class CharacterListRepository implements ICharacterListRepository {
  final INetworkInfo networkInfo;
  final IHttpClient client;

  CharacterListRepository({
    @injectable required this.networkInfo,
    @injectable required this.client,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacterList() async {
    if (await networkInfo.isConnected) {
      try {
        final HttpResponse response = await client.get(Endpoints.characters);
        final characterList = <CharacterEntity>[];
        final json = jsonDecode(response.data);
        final characters = json['results'] as List;
        for (var element in characters) {
          final character = CharacterModel.fromJson(element);
          characterList.add(character.toEntity());
        }
        return Right(characterList);
      } on HttpError catch (error) {
        return Left(httpErrorToFailure(error));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}

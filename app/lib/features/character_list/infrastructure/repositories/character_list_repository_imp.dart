import 'dart:convert';

import 'package:flutter_application/core/constants/endpoints.dart';
import 'package:flutter_application/core/failures/failures.dart';
import 'package:flutter_application/core/failures/http_error_to_failure.dart';
import 'package:flutter_application/features/character_list/domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application/features/character_list/domain/entities/specie_entity.dart';
import 'package:flutter_application/features/character_list/domain/repositories/character_list_repository.dart';
import 'package:flutter_application/features/character_list/infrastructure/models/character_model.dart';
import 'package:flutter_application/features/character_list/infrastructure/models/specie_model.dart';
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
  Future<Either<Failure, List<CharacterEntity>>> getCharacterList(
      {int? page}) async {
    final characterList = <CharacterEntity>[];
    final specieList = [];
    if (await networkInfo.isConnected) {
      try {
        final HttpResponse response =
            await client.get('${Endpoints.characters}/?page=${page ?? 1}');
        final json = jsonDecode(response.data);
        final characters = json['results'] as List?;
        if (characters != null) {
          for (var element in characters) {
            if (element['species'].isEmpty) {
              element['species'] = null;
            } else {
              final list = await getSpecies(element);
              specieList.addAll(list);
              element['species'] = specieList;
            }
            final character = CharacterModel.fromJson(element);
            characterList.add(character.toEntity());
          }
        }
        return Right(characterList);
      } on HttpError catch (error) {
        return Left(httpErrorToFailure(error));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<List<dynamic>> getSpecies(dynamic element) async {
    final specieList = [];
    for (var elementSpecie in element['species']) {
      final result = await getCharacterSpecie(url: elementSpecie);
      result.fold(
        (l) => null,
        (r) {
          final json = SpecieModel.toModel(r).toJson();
          specieList.add(json);
        },
      );
    }
    return specieList;
  }

  @override
  Future<Either<Failure, SpecieEntity>> getCharacterSpecie(
      {required String? url}) async {
    if (await networkInfo.isConnected && url != null) {
      try {
        final HttpResponse response = await client.get(url);
        final json = jsonDecode(response.data);
        final specie = SpecieModel.fromJson(json);
        return Right(specie);
      } on HttpError catch (error) {
        return Left(httpErrorToFailure(error));
      }
    } else if (url == null) {
      return Left(NotFoundFailure());
    } else {
      return Left(NetworkFailure());
    }
  }
}

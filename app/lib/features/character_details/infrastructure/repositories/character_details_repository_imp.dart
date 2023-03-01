import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_application/core/failures/http_error_to_failure.dart';
import 'package:flutter_application/core/services/http/http.dart';
import 'package:flutter_application/features/character_details/domain/repositories/character_details_repository.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

@Injectable(as: ICharacterDetailsRepository)
class CharacterDetailsRepository implements ICharacterDetailsRepository {
  final INetworkInfo networkInfo;
  final IHttpClient client;

  CharacterDetailsRepository({
    @injectable required this.networkInfo,
    @injectable required this.client,
  });
  @override
  Future<Either<Failure, List<CharacterFilmEntity>>> getFilmEntityList(
      List<String> urls) async {
    final filmList = <CharacterFilmEntity>[];
    if (await networkInfo.isConnected) {
      try {
        for (var url in urls) {
          final HttpResponse response = await client.get(url);
          final json = jsonDecode(response.data);
          final film = CharacterFilmModel.fromJson(json).toEntity();
          filmList.add(film);
        }
        return Right(filmList);
      } on HttpError catch (error) {
        return Left(httpErrorToFailure(error));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CharacterPlanetEntity>> getCharacterPlanet(
      String url) async {
    if (await networkInfo.isConnected) {
      try {
        final HttpResponse response = await client.get(url);
        final json = jsonDecode(response.data);
        final planet = CharacterPlanetModel.fromJson(json).toEntity();
        return Right(planet);
      } on HttpError catch (error) {
        return Left(httpErrorToFailure(error));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}

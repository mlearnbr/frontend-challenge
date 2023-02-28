import 'dart:convert';

import 'package:flutter_application/core/failures/httpError_to_failure.dart';
import 'package:flutter_application/core/services/http/http.dart';
import 'package:flutter_application/features/character_details/domain/entities/film_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application/features/character_details/domain/repositories/character_film_repository.dart';
import 'package:flutter_application/features/character_details/infrastructure/models/film_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/network/network.dart';

@Injectable(as: ICharacterFilmRepository)
class CharacterFilmRepository implements ICharacterFilmRepository {
  final INetworkInfo networkInfo;
  final IHttpClient client;

  CharacterFilmRepository({
    @injectable required this.networkInfo,
    @injectable required this.client,
  });
  @override
  Future<Either<Failure, List<FilmEntity>>> getFilmEntityList(
      List<String> urls) async {
    final filmList = <FilmEntity>[];
    if (await networkInfo.isConnected) {
      try {
        for (var url in urls) {
          final HttpResponse response = await client.get(url);
          final json = jsonDecode(response.data);
          final film = FilmModel.fromJson(json).toEntity();
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
}

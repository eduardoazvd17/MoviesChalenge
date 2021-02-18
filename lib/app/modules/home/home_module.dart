import 'package:dio/dio.dart';
import 'package:the_movie_challenge/app/modules/home/repositories/genre_repository.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/app/modules/home/views/home_page.dart';
import 'package:the_movie_challenge/app/shared/repositories/movies_repository.dart';

import 'controllers/home_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(
            i.get<GenreRepository>(),
            i.get<MovieRepository>(),
          ),
        ),
        Bind(
          (i) => GenreRepository(
            i.get<Dio>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

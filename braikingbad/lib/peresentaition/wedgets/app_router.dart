import 'package:braikingbad/busieness_logic/cubit/characters_cubit.dart';
import 'package:braikingbad/constants/strings.dart';
import 'package:braikingbad/data/model/characrers.dart';
import 'package:braikingbad/data/rebosotry/characters_rebository.dart';
import 'package:braikingbad/data/web_seveses/characters_web_servesces.dart';
import 'package:braikingbad/peresentaition/screens/charactars_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/characters_ditails_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServeces());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
    return null;
  }
}

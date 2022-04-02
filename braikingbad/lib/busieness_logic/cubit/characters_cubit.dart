import 'package:bloc/bloc.dart';
// import 'package:braikingbad/data/model/quote.dart';
import 'package:meta/meta.dart';
import 'package:braikingbad/data/model/characrers.dart';
import 'package:braikingbad/data/rebosotry/characters_rebository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(Caractersloaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  // void getQuotes(String charName) {
  //   charactersRepository.getCharactersQuotes(charName).then((quotes) {
  //     emit(Quotesloaded(quotes));
  //   });
  // }
}

// import 'package:braikingbad/data/model/quote.dart';
import 'package:braikingbad/data/web_seveses/characters_web_servesces.dart';
import 'package:braikingbad/data/model/characrers.dart';

/// recev the data from webserveces and send it to bloc///
class CharactersRepository {
  /// create an opject from webserveces class for cotact with it ///
  final CharactersWebServeces charactersWebserveces;
  CharactersRepository(this.charactersWebserveces);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebserveces.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  // Future<List<Quote>> getCharactersQuotes(String charName) async {
  //   final quotes = await charactersWebserveces.getCharactersQuotes(charName);
  //   return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  // }
}

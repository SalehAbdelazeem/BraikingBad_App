part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class Caractersloaded extends CharactersState {
  final List<Character> character;

  Caractersloaded(this.character);
}

// class Quotesloaded extends CharactersState {
//   final List<Quote> quotes;

//   Quotesloaded(this.quotes);
// }

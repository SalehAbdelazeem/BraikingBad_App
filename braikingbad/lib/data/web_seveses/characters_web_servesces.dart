import 'package:braikingbad/constants/strings.dart';
import 'package:dio/dio.dart';

/// receve the data from api///

class CharactersWebServeces {
  late Dio dio;
  CharactersWebServeces() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("characters");
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  // Future<List<dynamic>> getCharactersQuotes(String charName) async {
  //   try {
  //     Response response = await dio.get(
  //       "quote",
  //       queryParameters: {"auther": charName},
  //     );
  //     return response.data;
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e.toString());
  //     return [];
  //   }
  // }
}

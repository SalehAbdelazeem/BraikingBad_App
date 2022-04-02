/// create api elements ///

class Character {
  late int charId;
  late String name;
  late String nicName;
  late String image;
  late List<dynamic> jops;
  late String statusIfDeadOrAlife;
  late List<dynamic> appearanceOfseasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> petterCallSoulApearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nicName = json["nickname"];
    image = json["img"];
    jops = json["occupation"];
    statusIfDeadOrAlife = json["status"];
    appearanceOfseasons = json["appearance"];
    actorName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    petterCallSoulApearance = json["better_call_saul_appearance"];
  }
}

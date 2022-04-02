// import 'package:braikingbad/busieness_logic/cubit/characters_cubit.dart';
import 'package:braikingbad/constants/my_colors.dart';
import 'package:braikingbad/data/model/characrers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  Widget buldSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.mygray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nicName,
          style: const TextStyle(
            color: MyColors.mywhite,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget chracterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.mywhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.mywhite,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  // Widget checkIfQuotesAreoaded(CharactersState state){
  //   if(state is Quotesloaded){
  //     return displayRandomQuoreOrEmptySpace(state);
  //   }else{
  //     showBrogresIndicator();
  //   }
  // //

  // Widget displayRandomQuoreOrEmptySpace(State){
  //   var quotes =(State).chaQuote;
  //   if(quotes.length !=0){
  //     int rand
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mygray,
      body: CustomScrollView(
        slivers: [
          buldSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      chracterInfo("Job : ", character.jops.join("  /  ")),
                      buildDivider(335),
                      chracterInfo(
                          "Apeared in : ", character.categoryForTwoSeries),
                      buildDivider(270),
                      character.appearanceOfseasons.isEmpty
                          ? Container()
                          : chracterInfo("Seasons : ",
                              character.appearanceOfseasons.join("  /  ")),
                      character.appearanceOfseasons.isEmpty
                          ? Container()
                          : buildDivider(295),
                      chracterInfo("Status : ", character.statusIfDeadOrAlife),
                      buildDivider(295),
                      character.petterCallSoulApearance.isEmpty
                          ? Container()
                          : chracterInfo("Better Call Sal Season : ",
                              character.petterCallSoulApearance.join("  /  ")),
                      character.petterCallSoulApearance.isEmpty
                          ? Container()
                          : buildDivider(170),
                      chracterInfo("Actor : ", character.actorName),
                      buildDivider(315),
                    ],

                    // BlocBuilder<CharactersCubit, CharactersState>(
                    //     builder: (context, state) {
                    //       return checkIfQuotesAreoaded(state);
                    //     },
                    //   )
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:braikingbad/busieness_logic/cubit/characters_cubit.dart';
import 'package:braikingbad/constants/my_colors.dart';
import 'package:braikingbad/data/model/characrers.dart';
import 'package:braikingbad/peresentaition/wedgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearshing = false;
  final _searchTextController = TextEditingController();

  Widget _buldSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.mygray,
      decoration: const InputDecoration(
        hintText: "Find a Character...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.mygray, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.mygray, fontSize: 19),
      onChanged: (searchedCharacter) {
        adSearshedForItemsToSearshedList(searchedCharacter);
      },
    );
  }

  List<Widget> _buldAppBarActions() {
    if (_isSearshing) {
      return [
        IconButton(
          onPressed: () {
            _clearSearsh();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.mygray,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearsh,
          icon: const Icon(
            Icons.search,
            color: MyColors.mygray,
          ),
        ),
      ];
    }
  }

  void adSearshedForItemsToSearshedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void _startSearsh() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearshing));
    setState(() {
      _isSearshing = true;
    });
  }

  void _stopSearshing() {
    _clearSearsh();
    setState(() {
      _isSearshing = false;
    });
  }

  void _clearSearsh() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buldBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is Caractersloaded) {
          allCharacters = (state).character;
          return buldLoadedListWidget();
        } else {
          return showLoadedIndecator();
        }
      },
    );
  }

  Widget buldLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.mygray,
        child: Column(
          children: [
            buldCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buldCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (ctx, index) {
        return Characteritem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget showLoadedIndecator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget _buldAppBarTitle() {
    return const Text(
      'Character',
      style: TextStyle(color: MyColors.mygray),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearshing
            ? const BackButton(
                color: MyColors.mygray,
              )
            : Container(),
        title: _isSearshing ? _buldSearchField() : _buldAppBarTitle(),
        actions: _buldAppBarActions(),
      ),
      body: buldBlocWidget(),
    );
  }
}

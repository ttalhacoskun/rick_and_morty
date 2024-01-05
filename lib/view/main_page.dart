import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: viewModel.characters[index],
            child: _buildListItem(),
          );
        },
      ),
    );
  }

  Widget _buildListItem() {
    return Consumer<Character>(
      builder: (context, character, child) => ListTile(
        title: Text(character.name),
        subtitle: Text(character.gender),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.image),
        ),
      ),
    );
  }
}

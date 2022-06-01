import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(primary: Colors.green[400]),
        ),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomWordPairs = <WordPair>[];

  Widget buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();
        final index = item ~/ 2;
        if (item >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return buildRow(randomWordPairs[index]);
      },
    );
  }

  Widget buildRow(WordPair wordPair) {
    return ListTile(
        title: Text(wordPair.asPascalCase, style: const TextStyle(fontSize: 14)));
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: const Text('Test App')),
      body: buildList(),
    );
  }
}

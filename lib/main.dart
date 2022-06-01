import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme:
              const ColorScheme.light().copyWith(primary: Colors.green[400]),
        ),
        home: const WebViewExample());
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
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
        title:
            Text(wordPair.asPascalCase, style: const TextStyle(fontSize: 14)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test App')),
      body: buildList(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return WebViewPlus(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.loadUrl('assets/animation-playback/index.html');
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  
  List<WordPair> _suggestions = <WordPair>[];
 
  Widget _buildSuggestions() {

    var font = new TextStyle(fontSize: 30,);

    return Center(child:Container(child:Column(children: [
      RaisedButton(
        child: Text("ADD"),
        onPressed: (){
          setState(() {
            _suggestions.addAll(generateWordPairs().take(1));
          });
        }),
      Expanded(child:ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, index) {
          print(_suggestions);
          return Card(child: Center(child:Text(_suggestions[index].toString(), style: font),
            ),
            margin: EdgeInsets.all(5.0)
          );
          }
        ))
      ]
      )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Namer - Pick a Name before you change the world')
        ),
        body: _buildSuggestions()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
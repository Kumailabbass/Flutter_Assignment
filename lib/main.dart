import 'package:flutter/material.dart';

void main() => runApp(QuotesApp());

class QuotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuotesScreen(),
    );
  }
}

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<String> quotes = [
    "Money and success don’t change people; they merely amplify what is already there. — Will Smith",
    "When we do the best we can, we never know what miracle is wrought in our life or the life of another. — Helen Keller",
    "The best portion of a good man's life is his little nameless, unencumbered acts of kindness and of love. — Wordsworth",
    "When we do the best we can, we never know what miracle is wrought in our life or the life of another. — Helen Keller",
  ];

  String newQuote = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quotes[index],
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                SizedBox(height: 8.0),
                Text(getAuthorName(quotes[index]),
                    style: TextStyle(fontSize: 14.0, color: Colors.blue)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
              child: Icon(Icons.menu),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuScreen()))),
          FloatingActionButton(child: Icon(Icons.add), onPressed: addQuote),
          FloatingActionButton(
              child: Icon(Icons.settings),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()))),
        ],
      ),
    );
  }

  void addQuote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Quote'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter your quote'),
            onChanged: (value) => newQuote = value,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (newQuote.isNotEmpty) {
                  setState(() {
                    quotes.add(newQuote);
                    newQuote = '';
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  String getAuthorName(String quote) {
    final authorStartIndex = quote.lastIndexOf('—');
    if (authorStartIndex != -1 && authorStartIndex < quote.length - 1) {
      return quote.substring(authorStartIndex + 1).trim();
    } else {
      return '';
    }
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('This is the menu screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('This is the settings screen'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import "package:dokode_flutter/repository/event_repository.dart";
import "package:dokode_flutter/page/search_page.dart";
import "package:dokode_flutter/page/about_page.dart";
import "package:dokode_flutter/api/search_client.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dokode',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MainPage(title: 'Dokode Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  List<EventRepository> _events = [];

  void _onSelectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text("SEARCH"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("ABOUT"),
            icon: Icon(Icons.event_note),
          )
        ],
        currentIndex: _currentIndex,
        onTap: _onSelectTab,
      ),
      body:
          _buildPage(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPage() {
    switch (_currentIndex) {
      case 0:
        return SearchPage(events: _events, handleSearch: _handleSearch);
      case 1:
        return AboutPage();
      default:
        return Text("No page");
    }
  }

  void _handleSearch(String searchWord) {
    var searchClient = SearchClient();
    searchClient.search(searchWord).then((events) {
      setState(() {
        _events = events;
      });
    });
  }
}

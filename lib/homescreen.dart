import 'package:aniki_app/Widgets/airing.dart';
import 'package:flutter/material.dart';
import 'Widgets/categorySelector.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              isSearching
                  ? IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          this.isSearching = !this.isSearching;
                        });
                      })
                  : IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          this.isSearching = !this.isSearching;
                        });
                      })
            ],
            bottom: TabBar(tabs: [
              Tab(
                  child: Marquee(
                text: 'Watching      ',
              )),
              Tab(
                child: Text('Airing'),
              ),
              Tab(
                child: Marquee(
                  text: 'Next Season      ',
                ),
              ),
              Tab(
                child: Text('Trending'),
              ),
            ]),
            title: !isSearching
                ? Text('Aniki')
                : TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white),
                        hintText: 'Whats On Your Mind',
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
          ),
          body: TabBarView(
            children: [
              Text("airingList"),
              Airing(),
              Text("nextSeasonList"),
              Text("trendingList"),
            ],
          ),
        ));
  }
}

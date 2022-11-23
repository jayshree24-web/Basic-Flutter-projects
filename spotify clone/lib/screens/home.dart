import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/Models/category.dart';
import 'package:spotify_app/Models/music.dart';
import 'package:spotify_app/services/category_operations.dart';
import 'package:spotify_app/services/music_operations.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer); // dart constructor short hand
  //const Home({Key? key}) : super(key: key);
  Widget createcategory(category c) {
    //cresting object of class Category
    return Container(
      color: Colors.blueGrey.shade900,
      child: Row(
        children: [
          Image.network(
            c.imageURL,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              c.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ], // to make it adjustable accordingly we used Boxfit.cover
      ),
    );
  }

  List<Widget> createlistofcategories() {
    List<category> categorylist = categoryoperations
        .getCategories(); // to get all the list of categories available in categoryoperations, since it was static therefore object is not needed
    //convert data to widget using map function
    List<Widget> categories = categorylist
        .map((category c) => createcategory(c))
        .toList(); // data to widget map , finally we recieved the user end of categories
    return categories;
  }

  Widget createmusic(music m) {
    // to create a single music card
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // text aligns in left
        children: [
          Container(
              height: 200,
              width: 200,
              child: InkWell(
                  onTap: () {
                    _miniPlayer(m, stop: true);
                  },
                  child: Image.network(m.imageUrl, fit: BoxFit.cover))),
          Text(
            m.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            m.desc,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<music> musiclist = musicoperations.getmusic();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createmusic(musiclist[index]);
              },
              itemCount: musiclist.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 200,
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 5 / 2,
        crossAxisCount:
            2, // how may rows are there in a particular grid is the crosAxisCount
        children: createlistofcategories(),
      ),
    );
  }

  Widget createappbar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.settings_outlined),
        ),
      ],
    ); //AppBar is itself a widget
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            createappbar('Good Morning'),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('Made for u'),
            createMusicList('Popular playlists'),
          ], // contains list of widgets
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey.shade300, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3])),
      )),
    );
  }
}

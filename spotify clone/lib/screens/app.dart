import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/Models/music.dart';
import 'package:spotify_app/screens/home.dart';
import 'package:spotify_app/screens/search.dart';
import 'package:spotify_app/screens/yourlibraray.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(); // data section
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioplayer = new AudioPlayer(); //creating obect of AudioPlayer
  var Tabs =
      []; // to open multiple tabs we need multiple tabs so we create a array of these
  int currenttabindex = 0; // i don't encounter with a garbage value
  //UI design code goes under this build section
  music? m; //create an object of music class of music.dart
  bool isPlaying = false;
  Widget miniplayer(music? m, {bool stop = false}) {
    this.m = m;

    if (m == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioplayer.stop();
    }
    setState(() {});
    Size devicesize = MediaQuery.of(context)
        .size; // to get device size its basically just like we define int
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey.shade400,
      width: devicesize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            m.imageUrl,
            fit: BoxFit.cover,
          ),
          Text(
            m.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioplayer.play(m.songurl);
                } // wait till the song play doesn't end
                else {
                  await _audioplayer.pause();
                }
                setState(() {});
              },
              icon: isPlaying
                  ? Icon(
                      Icons.pause_rounded,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                    ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(miniplayer), Search(), YourLibraray()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currenttabindex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniplayer(m),
          BottomNavigationBar(
            selectedItemColor: Colors.white,
            currentIndex: currenttabindex,
            onTap: (currentIndex) {
              // on tapping it will give me a current index
              print('Current index is $currentIndex');
              currenttabindex = currentIndex;
              setState(() {}); // re-render
            },
            backgroundColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 15),
            items: [
              // total there are 3 items each with a icon , color and label
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.white70,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_add_check_rounded,
                    color: Colors.white70,
                  ),
                  label: 'Library'),
            ],
          ),
        ],
      ),
    );
  }
}

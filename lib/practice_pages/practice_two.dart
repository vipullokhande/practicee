import 'package:flutter/material.dart';
import 'package:practicee/play_store/apps.dart';
import 'package:practicee/play_store/books.dart';
import 'package:practicee/play_store/games.dart';
import 'package:practicee/play_store/movies.dart';
import 'package:provider/provider.dart';

import '../provider_example/providers/dar_mode_controller.dart';

class PracticeTwo extends StatefulWidget {
  const PracticeTwo({Key? key}) : super(key: key);

  @override
  State<PracticeTwo> createState() => _PracticeTwoState();
}

class _PracticeTwoState extends State<PracticeTwo> {
  List<String> title = [
    "Search for apps & ...",
    "Search for apps & ...",
    "Search Movies & tv...",
    "Search for books & ..",
  ];
  int index = 0;
  final screens = <Widget>[
    const GamesScreen(),
    const AppsScreen(),
    const MoviesScreen(),
    const BooksScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Colors.white : Colors.black,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: AppBar(
                elevation: 0,
                actions: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              Icons.search,
                              size: 26,
                              color: isDark ? Colors.black : Colors.white,
                            ),
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: PSSearchDelegate());
                            },
                            label: Text(
                              title[index],
                              style: TextStyle(
                                color: isDark ? Colors.black54 : Colors.white,
                                fontSize: 15,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_none_rounded,
                              color: isDark ? Colors.black : Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showAlert(context, isDark);
                            },
                            icon: Icon(
                              Icons.person,
                              color: isDark ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                backgroundColor: isDark
                    ? const Color.fromARGB(255, 217, 232, 233)
                    : const Color.fromARGB(255, 100, 100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    width: 1.0,
                    color: isDark
                        ? const Color.fromARGB(255, 89, 198, 249)
                        : Colors.yellow,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            IndexedStack(
              index: index,
              children: screens,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 20.0,
                bottom: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          Colors.pink.shade100,
                          Colors.pink.shade200,
                          Colors.pink.shade300,
                        ]
                      : [
                          Colors.white30,
                          Colors.white60,
                          Colors.black87,
                        ],
                ),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: isDark
                    ? const Color.fromARGB(255, 0, 181, 253)
                    : Colors.yellow,
                unselectedItemColor: isDark ? Colors.black : Colors.white,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.games_outlined),
                    label: "Games",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard_outlined),
                    label: "Apps",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_movies_rounded),
                    label: "Movies",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: "Books",
                  ),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: value
        //       ? Color.fromARGB(255, 189, 233, 244)
        //       : Color.fromARGB(96, 51, 49, 49),
        //   currentIndex: index,
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: value ? Colors.lightBlue : Colors.yellow,
        //   unselectedItemColor: value ? Colors.black : Colors.white,
        //   onTap: (value) {
        //     setState(() {
        //       this.index = value;
        //     });
        //   },
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.games_outlined),
        //       label: "Games",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.dashboard_outlined),
        //       label: "Apps",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.local_movies_rounded),
        //       label: "Movies",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.book),
        //       label: "Books",
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: isDark ? Colors.blue.shade500 : Colors.yellow,
          splashColor: Colors.deepPurpleAccent,
          child: Icon(
            isDark ? Icons.dark_mode : Icons.light_mode,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () {
            setState(() {
              isDark
                  ? context.read<DarkModeController>().changeToLight()
                  : context.read<DarkModeController>().changeToDark();
            });
          },
        ),
      ),
    );
  }
}

void showAlert(BuildContext context, bool value) => showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: value ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              width: 1.5,
              color: value ? Colors.blue.shade300 : Colors.yellow,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: value ? Colors.black : Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  "Google",
                  style: TextStyle(
                    fontSize: 20,
                    color: value ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person,
                size: 38,
                color: value ? Colors.black : Colors.white,
              ),
              title: Text(
                'Username',
                style: TextStyle(
                  fontSize: 15.0,
                  color: value ? Colors.black87 : Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(
                "fakemail@gmail.com",
                style: TextStyle(
                  fontSize: 10.0,
                  color: value ? Colors.black54 : Colors.white,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: value ? Colors.black : Colors.white,
                  ),
                ),
              ),
              child: Text(
                "Manage your Google Account",
                style: TextStyle(
                  fontSize: 15.0,
                  color: value ? Colors.black : Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.keyboard_alt_rounded,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Manage apps & device",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notifications_none_outlined,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Offers & notifications",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.payment,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Payments and subscriptions",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.verified_user_outlined,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Play Protect",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.folder_open_outlined,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Library",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Settings",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.help_outline_outlined,
                color: value ? Colors.black87 : Colors.white,
              ),
              title: Text("Help & feedback",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: value ? Colors.black : Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );

class PSSearchDelegate extends SearchDelegate {
  List<String> applications = [
    "Google",
    "YouTube",
    "LinkedIn",
    "Gmail",
    "NetFlix",
    "Google Chrome",
    "Amazon",
    "Zomato",
    "Google Photos",
    "FlipKart"
        "Swiggy",
    "Meesho",
    "Adobe",
    "realme store",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Scaffold();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var suggestion in applications) {
      if (suggestion.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(suggestion);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

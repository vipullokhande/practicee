import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicee/example_app_data/widgets/post_widget.dart';

enum MenuItem {
  item1,
  item2,
  item3,
}

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Profile'),
              background: Image.network(
                  'https://lilacinfotech.com/lilac_assets/images/blog/Why-Google-Flutter.jpg'),
            ),
            actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.google,
                          color: Colors.white),
                      iconSize: 30.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                      iconSize: 30.0,
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: MenuItem.item1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                              Text(
                                "Home",
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: MenuItem.item2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              Text(
                                "Search",
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: MenuItem.item3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.black,
                              ),
                              Text(
                                "Exit",
                              ),
                            ],
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == MenuItem.item1) {
                          final snack = SnackBar(
                            content: Text('Home clicked'),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snack);
                        } else if (value == MenuItem.item2) {
                        } else if (value == MenuItem.item3) {
                          final snack = SnackBar(
                            content: Text('Exit clicked'),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snack);
                        } else {
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          buildScroll(),
        ],
      ),
    );
  }

  Widget buildScroll() => SliverToBoxAdapter(
          child: Column(
        children: [Post(), Post(), Post()],
      ));
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'story_widget.dart';

enum MenuItem {
  item1,
  item2,
  item3,
}
enum PopItem {
  item1,
  item2,
  item3,
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Story(),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20, letterSpacing: 1.5),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: PopItem.item1,
                    child: Text("Open"),
                  ),
                  PopupMenuItem(
                    value: PopItem.item1,
                    child: Text("Save"),
                  ),
                  PopupMenuItem(
                    value: PopItem.item1,
                    child: Text("Close"),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          Image.network(
            "https://cdn-images-1.medium.com/max/1024/0*278rYAB5Pac8_7SD",
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : Container(
                        child: CircularProgressIndicator(
                          color: Colors.pinkAccent,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
            fit: BoxFit.fitHeight,
            height: 350.0,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.only(bottom: 20.0, right: 5.0),
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red.shade900,
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.messenger_outline_sharp,
                        color: Colors.black,
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send_sharp,
                        color: Colors.blue,
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.bookmark,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

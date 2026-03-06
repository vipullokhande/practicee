import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20.0,
            ),
            const Expanded(
              child: Text(
                'Flutter',
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, letterSpacing: 1.5),
              ),
            ),
            PopupMenuButton(
              color: const Color.fromARGB(255, 241, 212, 222),
              // icon: Icon(
              //   Icons.notification_add,
              // ),
              onSelected: (value) {
                const snackBar = SnackBar(content: Text('data'));
                switch (value) {
                  case PopItem.item1:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    break;
                  case PopItem.item2:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    break;
                  case PopItem.item3:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    break;
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.pink,
                  )),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: PopItem.item1,
                  child: Text('Open'),
                ),
                const PopupMenuItem(
                  value: PopItem.item2,
                  child: Text('Save'),
                ),
                const PopupMenuItem(
                  value: PopItem.item3,
                  child: Text('Close'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        Image.network(
          "https://cdn-images-1.medium.com/max/1024/0*278rYAB5Pac8_7SD",
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const CircularProgressIndicator(
                        color: Colors.pinkAccent,
                      ),
                    ),
          fit: BoxFit.fitHeight,
          height: 350.0,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.only(bottom: 20.0, right: 5.0),
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
                    icon: const Icon(
                      Icons.messenger_outline_sharp,
                      color: Colors.black,
                      size: 45,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
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
                    icon: const Icon(
                      FontAwesomeIcons.bookmark,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
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
    );
  }
}

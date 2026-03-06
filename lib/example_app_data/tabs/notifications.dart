import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isGrid = false;
  List<String> url = [
    "https://cdn-images-1.medium.com/max/1024/0*278rYAB5Pac8_7SD",
    "https://lilacinfotech.com/lilac_assets/images/blog/Why-Google-Flutter.jpg",
    "https://miro.medium.com/max/908/1*jBTJ6Kkt8Kf81PGKgOZ1fw.jpeg",
    "https://qph.fs.quoracdn.net/main-qimg-5987cf5c04aded28d942cda660dd062d",
    "https://redwerk.es/wp-content/uploads/2019/10/f-image.png",
    "https://cdn-images-1.medium.com/max/1024/0*278rYAB5Pac8_7SD",
    "https://lilacinfotech.com/lilac_assets/images/blog/Why-Google-Flutter.jpg",
    "https://miro.medium.com/max/908/1*jBTJ6Kkt8Kf81PGKgOZ1fw.jpeg",
    "https://qph.fs.quoracdn.net/main-qimg-5987cf5c04aded28d942cda660dd062d",
    "https://redwerk.es/wp-content/uploads/2019/10/f-image.png",
  ];
  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        actions: [
          Switch.adaptive(
            value: isGrid,
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
            onChanged: (value) {
              setState(() {
                this.isGrid = value;
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
            iconSize: 30.0,
          ),
        ],
      ),
      body: isGrid
          ? GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: url.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final item = url[index];
                final number = items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(10.0),
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: FocusedMenuHolder(
                    menuItemExtent: 50,
                    blurSize: 0,
                    menuOffset: 3,
                    menuWidth: 180.0,
                    openWithTap: false,
                    onPressed: () {},
                    menuItems: [
                      FocusedMenuItem(
                        title: Text(
                          number,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    child: Column(
                      children: [
                        Text(
                          number,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.cyan,
                            height: 2.0,
                          ),
                          maxLines: 1,
                        ),
                        Image.network(
                          item,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : Container(
                                      child: CircularProgressIndicator(
                                        color: Colors.pinkAccent,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                          fit: BoxFit.fill,
                          height: 135.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: url.length,
              itemBuilder: (context, index) {
                final item = url[index];
                final number = items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(10.0),
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: FocusedMenuHolder(
                    menuItemExtent: 50,
                    blurSize: 0,
                    menuOffset: 3,
                    menuWidth: MediaQuery.of(context).size.width,
                    openWithTap: false,
                    onPressed: () {},
                    menuItems: [
                      FocusedMenuItem(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Number : ',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              items[index],
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                    child: Column(
                      children: [
                        Text(
                          number,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.cyan,
                            height: 2.0,
                          ),
                          maxLines: 1,
                        ),
                        Image.network(
                          item,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : Container(
                                      height: 270.0,
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator(
                                        color: Colors.pinkAccent,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                          fit: BoxFit.fill,
                          height: 270.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ignore_for_file: dead_code_on_catch_subtype
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practicee/example_app_data/screens/profile.dart';
import 'package:practicee/example_app_data/widgets/bottom_sheet.dart';
import 'package:practicee/example_app_data/widgets/nav_item.dart';
import 'package:practicee/example_app_data/widgets/panel.dart';
import 'package:practicee/example_app_data/widgets/story_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum MenuItem {
  item1,
  item2,
  item3,
  item4,
}

enum PopItem {
  item1,
  item2,
  item3,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  bool value = false;
  bool fab = true;
  final List<String> questions = ["Rate our App", "Are you feeling well?"];
  final List<List<String>> options = [
    [
      "Great",
      "Moderate",
      "Not sure",
    ],
    [
      "Good",
      "Gentle",
      "Not Happy",
    ],
  ];
  int question = -1;
  final panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: !value ? ThemeData.light() : ThemeData.dark(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              color: value ? Colors.grey : Colors.white,
              controller: panelController,
              parallaxEnabled: true,
              parallaxOffset: .1,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18.0)),
              minHeight: 100.0,
              maxHeight: 300.0,
              panelBuilder: (sc) => Panel(
                controller: sc,
                panelController: panelController,
              ),
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    actions: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Spacer(
                              flex: 2,
                            ),
                            TextButton(
                                onLongPress: () {
                                  showAlert(context);
                                },
                                onPressed: () {
                                  showAlertDialog(context);
                                },
                                child: const Text(
                                  "Home",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                )),
                            Spacer(
                              flex: 3,
                            ),
                            IconButton(
                              onPressed: () {
                                showBS();
                              },
                              icon: const Icon(FontAwesomeIcons.google,
                                  color: Colors.white),
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: MySearchDelegate());
                              },
                              icon:
                                  const Icon(Icons.search, color: Colors.white),
                              iconSize: 30.0,
                            ),
                            //Swich.adaptive() is for both platform
                            //Swich() is for Android
                            //CupertinoSwich() is for IOS
                            Switch.adaptive(
                              value: value,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                              inactiveTrackColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  this.value = value;
                                });
                              },
                            ),
                            PopupMenuButton(
                              padding: EdgeInsets.all(5.0),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: MenuItem.item1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color:
                                            value ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color:
                                            value ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.exit_to_app,
                                        color:
                                            value ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Exit",
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: MenuItem.item4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star_rate_sharp,
                                        color:
                                            value ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Rate Us",
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
                                  showSearch(
                                      context: context,
                                      delegate: MySearchDelegate());
                                } else if (value == MenuItem.item3) {
                                  final snack = SnackBar(
                                    content: Text('Exit clicked'),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snack);
                                } else if (value == MenuItem.item4) {
                                  setState(() {
                                    question = 0;
                                  });
                                } else {
                                  return;
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 80.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: url.length,
                          itemBuilder: (context, index) {
                            final item = url[index];
                            return Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.grey.shade300,
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 10.0,
                                      left: 6.8,
                                      right: 6.8,
                                    ),
                                    width: 66.0,
                                    height: 66.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.orange.shade700,
                                          Colors.red.shade400,
                                          Colors.pink.shade300,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CircleAvatar(
                                        // backgroundImage: AssetImage('assets/splash.png'),
                                        backgroundImage: NetworkImage(item),
                                        radius: 60.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: value ? Colors.white : Colors.grey,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Center(
                          child: Column(
                            children: [
                              buildPost(),
                              buildPost(),
                              buildPost(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.amber.shade300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/splash.png"),
                        radius: 40,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Username',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
              NavItem(),
            ],
          ),
        ),
        bottomSheet: question != -1
            ? BottomSheetVIP(
                height: 170.0,
                options: options[question],
                title: questions[question],
                onClickConfirm: () {
                  setState(() {
                    if (question >= questions.length - 1) {
                      question = -1;
                    } else {
                      question++;
                    }
                  });
                },
                onClickClose: () {
                  setState(() {
                    question = -1;
                  });
                },
              )
            : null,
        floatingActionButton: SpeedDial(
          //we can also do SpeedDialChild in another SpeedDial i.e. nested SpeedDial
          backgroundColor: value ? Colors.orange.shade300 : Colors.blue,
          icon: fab ? Icons.add : Icons.close_rounded,
          iconTheme: IconThemeData(
            color: value ? Colors.black : Colors.white,
            size: 35.0,
          ),
          onOpen: () {
            setState(() {
              fab = false;
            });
          },
          onClose: () {
            setState(() {
              fab = true;
            });
          },
          spacing: 15.0,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.image,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 9.0,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                pickImage();
              },
            ),
            SpeedDialChild(
              backgroundColor: Colors.grey.shade300,
              child: Column(
                children: const [
                  Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Text(
                    "Story",
                    style: TextStyle(
                      fontSize: 9.0,
                    ),
                  )
                ],
              ),
              onTap: () {
                openCamera();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPost() => Container(
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
              height: 5.0,
            ),
            FocusedMenuHolder(
              menuItemExtent: 74,
              blurSize: 0,
              menuOffset: 3,
              menuWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              openWithTap: false,
              menuItems: [
                FocusedMenuItem(
                  backgroundColor: value ? Colors.black : Colors.white,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Story(),
                      SizedBox(
                        width: 180,
                        child: Center(
                          child: Text(
                            "Username",
                            style: TextStyle(
                                color: value ? Colors.white : Colors.black,
                                fontSize: 20,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Follow",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                FocusedMenuItem(
                    backgroundColor: value ? Colors.black : Colors.white,
                    title: Row(
                      children: [
                        Text(
                          "Followers : ",
                          style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "450",
                          style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {}),
                FocusedMenuItem(
                    backgroundColor: value ? Colors.black : Colors.white,
                    title: Row(
                      children: [
                        Text(
                          "Followings : ",
                          style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "450",
                          style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {}),
              ],
              child: Image.network(
                "https://cdn-images-1.medium.com/max/1024/0*278rYAB5Pac8_7SD",
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Container(
                            height: 350.0,
                            alignment: Alignment.center,
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

  void showBS() => showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        side: BorderSide(
          width: 2.0,
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      backgroundColor: value ? Colors.black : Colors.white,
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 18.0,
              ),
              InkWell(
                splashColor: Colors.purpleAccent.withOpacity(0.1),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: Ink(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Story(),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Username",
                        style: TextStyle(
                            color: value ? Colors.white : Colors.black,
                            fontSize: 20,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(
                        width: 150.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Add account",
                          style: TextStyle(
                              color: value ? Colors.white54 : Colors.black54,
                              fontSize: 20.0),
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: value ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: value ? Colors.white : Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width - 20, 55.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ));

  void showAlert(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                  color: Colors.red, width: 1.0, style: BorderStyle.solid),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "style: TextStyle(fontSize: 24,color: Colors.cyan,fontWeight: FontWeight.bold,style: TextStyle(fontSize: 24,color: Colors.cyan,fontWeight: FontWeight.bold,style: TextStyle(fontSize: 24,color: Colors.cyan,fontWeight: FontWeight.bold,"),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      setState(() {});
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                      ),
                      Text("Exit")
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

File? cimage;
Future openCamera() async {
  try {
    final cimage = await ImagePicker().pickImage(source: ImageSource.camera);
    // await ImagePicker().pickImage(source: ImageSource.camera);
    if (cimage == null) return;
    final imageTemp = File(cimage.path);
  } on Exception catch (e) {
    // TODO
  } on PlatformException catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}

File? image;
Future pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
  } on Exception catch (e) {
    // TODO
  } on PlatformException catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}

void showAlertDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
        title: TextButton.icon(
          label: Text("Flutter"),
          onPressed: () {},
          icon: Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
            height: 40,
            width: 60,
          ),
        ),
        content: TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Enter",
          ),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                      ),
                      Text("Exit")
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('CLOSE'),
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                        elevation: 10.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.home_max,
                      ),
                      label: Text("Close"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    "Google",
    "Apple",
    "Microsoft",
    "Goldmann Sachs",
    "Amazon",
    "Adobe",
    "TCS",
    "Wipro",
    "HP",
    "TATA motors",
    "Google 1",
    "Apple 1",
    "Microsoft 1",
    "Goldmann Sachs 1",
    "Amazon 1",
    "Adobe 1",
    "TCS 1",
    "Wipro 1",
    "HP 1",
    "TATA motors 1",
  ];
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> suggestions = searchResults.where((element) {
    //   final result = element.toLowerCase();
    //   final input = query.toLowerCase();
    //   return result.contains(input);
    // }).toList();
    // return ListView.builder(
    //   itemCount: suggestions.length,
    //   itemBuilder: (context, index) {
    //     final suggestion = suggestions[index];
    //     return ListTile(
    //         title: Text(suggestion),
    //         onTap: () {
    //           query = suggestion;
    //           showResults(context);
    //         });
    //   },
    // );
    List<String> matchQuery = [];
    for (var suggestion in searchResults) {
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
          // trailing: Icon(FontAwesomeIcons.google),
        );
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }
}

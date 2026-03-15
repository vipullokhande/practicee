import 'package:flutter/material.dart';
import 'package:practicee/example_app_data/screens/profile.dart';
import 'package:practicee/example_app_data/tabs/add.dart';
import 'package:practicee/example_app_data/tabs/notifications.dart';
import 'package:practicee/example_app_data/tabs/search.dart';

class HoemScreen extends StatefulWidget {
  HoemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HoemScreen> createState() => _HoemScreenState();
}

class _HoemScreenState extends State<HoemScreen> {
  // bool fab = true;
  final IconData active = Icons.add_a_photo_outlined;
  final IconData inactive = Icons.add_a_photo_outlined;
  DateTime timeBackPressed = DateTime.now();
  int index = 0;
  final screens = const [
    Scaffold(),
    Search(),
    Add(),
    Notifications(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: screens,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     splashColor: Colors.purpleAccent,
      //     icon: Icon(
      //       Icons.logout,
      //       color: Colors.blue,
      //       size: 30,
      //     ),
      //     onPressed: () {},
      //     label: Text(
      //       "Logout",
      //       style: TextStyle(
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 25.0),
      //     )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     pickImage();
      //   },
      //   child: ClipOval(
      //     child: image != null
      //         ? Image.file(
      //             image!,
      //             width: 55.0,
      //             height: 55.0,
      //             fit: BoxFit.cover,
      //           )
      //         : null,
      //   ),
      // ),
      // floatingActionButton: SpeedDial(
      //   //we can also do SpeedDialChild in another SpeedDial i.e. nested SpeedDial
      //   backgroundColor: Colors.blue,
      //   icon: fab ? Icons.add : Icons.close_rounded,
      //   iconTheme: IconThemeData(
      //     color: Colors.white,
      //     size: 35.0,
      //   ),
      //   onOpen: () {
      //     setState(() {
      //       fab = false;
      //     });
      //   },
      //   onClose: () {
      //     setState(() {
      //       fab = true;
      //     });
      //   },
      //   spacing: 15.0,
      //   children: [
      //     SpeedDialChild(
      //       child: Column(
      //         children: [
      //           Icon(
      //             Icons.image,
      //             color: Colors.black,
      //             size: 30.0,
      //           ),
      //           Text(
      //             "Post",
      //             style: TextStyle(
      //               fontSize: 9.0,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     SpeedDialChild(
      //       child: Column(
      //         children: [
      //           Icon(
      //             Icons.add_a_photo_rounded,
      //             color: Colors.black,
      //             size: 30.0,
      //           ),
      //           Text(
      //             "Story",
      //             style: TextStyle(
      //               fontSize: 9.0,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              tooltip: "Chats",
              activeIcon: Icon(
                Icons.home,
                color: Colors.pink,
                size: 26.0,
              ),
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: Colors.pink,
                size: 26.0,
              ),
              label: 'Search',
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.add,
                color: Colors.pink,
                size: 26.0,
              ),
              label: 'Add',
              icon: Icon(
                Icons.add,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.notifications,
                color: Colors.pink,
                size: 26.0,
              ),
              label: 'Notification',
              icon: Icon(
                Icons.notifications,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Colors.pink,
                size: 26.0,
              ),
              label: 'Profile',
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     // await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() {
  //       this.image = imageTemp;
  //     });
  //   } on Exception catch (e) {
  //     // TODO
  //   } on PlatformException catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }
}

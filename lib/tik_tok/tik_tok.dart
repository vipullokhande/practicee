import 'package:flutter/material.dart';

class TikTok extends StatefulWidget {
  const TikTok({Key? key}) : super(key: key);

  @override
  State<TikTok> createState() => _TikTokState();
}

class _TikTokState extends State<TikTok> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: currentIndex,
        children: [
          PageView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Scaffold(
              body: Image.asset(
                'assets/current.png',
                fit: BoxFit.fill,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pinkAccent.shade700,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: 50,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

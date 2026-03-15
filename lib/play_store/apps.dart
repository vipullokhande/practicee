import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practicee/provider_example/providers/dar_mode_controller.dart';
import 'package:practicee/play_store/recommends/apps_recommend.dart';
import 'package:provider/provider.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  List<String> tabs = [
    "For you",
    "Top charts",
    "Kids",
    "Events",
    "Premium",
    "Categories",
    "Editors Choice",
  ];
  List<String> rfyNames = [
    "Google",
    "Zoom",
    "Facebook",
    "Instagram",
    "G Drive",
    "WhatsApp",
    "Discord",
    "Linked-In",
    "Pinterest",
    "Snapchat",
  ];
  List<String> rfyLIST = [
    "assets/google.png",
    "assets/zoom.png",
    "assets/ficon.png",
    "assets/iicon.png",
    "assets/gdrive.png",
    "assets/wicon.png",
    "assets/discord.png",
    "assets/linkedin.png",
    "assets/pinterest.png",
    "assets/snapchat.png",
  ];
  List<String> rfyRating = [
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
  ];
  List<String> comNames = [
    "WhatsApp",
    "Discord",
    "Twitter",
    "Zoom",
    "Facebook",
    "Instagram",
    "Telegram",
    "Linked-In",
    "Messenger",
    "Messenger",
  ];
  List<String> comLIST = [
    "assets/wicon.png",
    "assets/discord.png",
    "assets/twitter.png",
    "assets/zoom.png",
    "assets/ficon.png",
    "assets/iicon.png",
    "assets/telegramm.png",
    "assets/linkedin.png",
    "assets/messenger.png",
    "assets/messenger.png",
  ];
  List<String> comRating = [
    "4.5 ",
    "4.4 ",
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.4 ",
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      color: !isDark ? Colors.black : Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 40.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: 7.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final item = tabs[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 3,
                    ),
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            color: isDark ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width / 10,
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 0.5,
            child: Container(
              color: !isDark ? Colors.white : Colors.black87,
            ),
          ),
          CarouselSlider.builder(
            // carouselController: carouselController,
            itemCount: rfyLIST.length,
            itemBuilder: ((context, index, realIndex) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      rfyLIST[index],
                    ),
                    fit: BoxFit.fill,
                    // opacity: 0.9,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.035, vertical: height * 0.035),
              );
            }),
            options: CarouselOptions(
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              height: height * 0.3,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 550,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 230,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AppsRecommend(),
                            ),
                          );
                        },
                        title: Text(
                          "Recommended for you",
                          style: TextStyle(
                            color: isDark ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.7,
                            fontSize: 18,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: isDark ? Colors.black : Colors.white,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        width: MediaQuery.of(context).size.width - 3,
                        key: const PageStorageKey('APPS'),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = rfyLIST[index];
                            final name = rfyNames[index];
                            final rating = rfyRating[index];
                            return Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color:
                                          isDark ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 103, 103, 103),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AppsRecommend(),
                            ),
                          );
                        },
                        title: Text(
                          "Communication",
                          style: TextStyle(
                            color: isDark ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.7,
                            fontSize: 18,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: isDark ? Colors.black : Colors.white,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        width: MediaQuery.of(context).size.width - 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = comLIST[index];
                            final name = comNames[index];
                            final rating = comRating[index];
                            return Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color:
                                          isDark ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 103, 103, 103),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AppsRecommend(),
                            ),
                          );
                        },
                        title: const Text(
                          "Based on Feed",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.7,
                            fontSize: 18,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        width: MediaQuery.of(context).size.width - 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = rfyLIST[index];
                            final name = rfyNames[index];
                            final rating = rfyRating[index];
                            return Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 0.3,
                                      ),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    name,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    rating,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 103, 103, 103),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

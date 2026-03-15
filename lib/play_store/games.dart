import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practicee/play_store/recommends/games_recommend.dart';
import 'package:provider/provider.dart';

import '../provider_example/providers/dar_mode_controller.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
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
    "Asphalt 8",
    "Nitro Race",
    "Unstoppable",
    "Aventador",
    "Speed Racing",
    "Simulator",
    "Buggy Burn",
    "Runner",
    "Top racer",
    "Asphalt 4",
  ];
  List<String> rfyLIST = [
    "assets/current.png",
    "assets/aventador.png",
    "assets/nitro.png",
    "assets/current.png",
    "assets/aventador.png",
    "assets/speed.png",
    "assets/current.png",
    "assets/aventador.png",
    "assets/nitro.png",
    "assets/speed.png",
    "assets/current.png",
  ];
  List<String> rfyType = [
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
  ];
  List<String> rfyRating = [
    "4.5 ",
    "4.4 ",
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
  ];
  List<String> rfySize = [
    "1.5 GB",
    "567 MB",
    "360 MB",
    "230 MB",
    "46 MB",
    "399 MB",
    "749 MB",
    "782 MB",
    "345 MB",
    "222 MB",
  ];
  List<String> mulNames = [
    "Unstoppable",
    "Aventador",
    "Speed Racing",
    "Asphalt 8",
    "Nitro Race",
    "Simulator",
    "Buggy Burn",
    "Runner",
    "Top racer",
    "Asphalt 4",
  ];
  List<String> mulLIST = [
    "assets/nitro.png",
    "assets/speed.png",
    "assets/current.png",
    "assets/aventador.png",
    "assets/speed.png",
    "assets/nitro.png",
    "assets/aventador.png",
    "assets/current.png",
    "assets/nitro.png",
    "assets/aventador.png",
  ];
  List<String> mulType = [
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
  ];
  List<String> mulRating = [
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
  ];
  List<String> mulSize = [
    "360 MB",
    "230 MB",
    "46 MB",
    "1.5 GB",
    "567 MB",
    "399 MB",
    "749 MB",
    "782 MB",
    "345 MB",
    "222 MB",
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      color: Colors.transparent,
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
                  height: 250,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GamesRecommend(),
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
                        height: 194,
                        width: MediaQuery.of(context).size.width - 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = rfyLIST[index];
                            final name = rfyNames[index];
                            final type = rfyType[index];
                            final rating = rfyRating[index];
                            final size = rfySize[index];
                            return Container(
                              width: 200,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 115,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          item,
                                          height: 55,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            name,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          // RichText(text: text)
                                          Text(
                                            type,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 103, 103, 103),
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                rating,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              Text(
                                                size,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
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
                  height: 250,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GamesRecommend(),
                            ),
                          );
                        },
                        title: Text(
                          "Multiplayer games",
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
                        height: 194,
                        width: MediaQuery.of(context).size.width - 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = mulLIST[index];
                            final name = mulNames[index];
                            final type = mulType[index];
                            final rating = mulRating[index];
                            final size = mulSize[index];
                            return Container(
                              width: 200,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 115,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          item,
                                          height: 55,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            name,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: isDark
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          // RichText(text: text)
                                          Text(
                                            type,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 103, 103, 103),
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                rating,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              Text(
                                                size,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
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
                  height: 250,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GamesRecommend(),
                            ),
                          );
                        },
                        title: const Text(
                          "Non-stop action",
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
                        height: 194,
                        width: MediaQuery.of(context).size.width - 3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final item = rfyLIST[index];
                            final name = rfyNames[index];
                            final type = rfyType[index];
                            final rating = rfyRating[index];
                            final size = rfySize[index];
                            return Container(
                              width: 200,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      item,
                                      height: 115,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          item,
                                          height: 55,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            name,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          // RichText(text: text)
                                          Text(
                                            type,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 103, 103, 103),
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                rating,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              Text(
                                                size,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 103, 103, 103),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                    ],
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

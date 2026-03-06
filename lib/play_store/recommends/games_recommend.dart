import 'package:flutter/material.dart';
import 'package:practicee/provider_example/providers/dar_mode_controller.dart';
import 'package:provider/provider.dart';

class GamesRecommend extends StatefulWidget {
  const GamesRecommend({Key? key}) : super(key: key);

  @override
  State<GamesRecommend> createState() => _GamesRecommendState();
}

class _GamesRecommendState extends State<GamesRecommend> {
  List<String> rfyNames = [
    "Asphalt 8",
    "Nitro Race",
    "Unstoppable",
    "Aventador",
  ];
  List<String> rfyLIST = [
    "assets/current.png",
    "assets/aventador.png",
    "assets/nitro.png",
    "assets/speed.png",
  ];
  List<String> rfyType = [
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
  ];
  List<String> rfySize = [
    "1.5 GB",
    "567 MB",
    "360 MB",
    "230 MB",
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Scaffold(
      backgroundColor: !isDark
          ? const Color.fromARGB(255, 39, 39, 39)
          : const Color.fromARGB(255, 248, 248, 250),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: !isDark
            ? const Color.fromARGB(255, 39, 39, 39)
            : const Color.fromARGB(255, 248, 248, 250),
        iconTheme: IconThemeData(
          color: !isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Recommended for you",
          style: TextStyle(
            color: isDark ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            final items = rfyLIST[index];
            final name = rfyNames[index];
            final type = rfyType[index];
            final rating = rfyRating[index];
            final size = rfySize[index];
            return Container(
              height: 290.0,
              width: double.maxFinite,
              color: !isDark ? Colors.black : Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 220.0,
                    width: double.maxFinite,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = rfyLIST[index];
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(
                            8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: 210.0,
                            width: 300.0,
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          items,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            style: TextStyle(
                              color: !isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          // RichText(text: text)
                          Text(
                            type,
                            maxLines: 1,
                            style: TextStyle(
                              color: !isDark
                                  ? const Color.fromARGB(186, 232, 232, 232)
                                  : const Color.fromARGB(255, 103, 103, 103),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                rating,
                                style: TextStyle(
                                  color: !isDark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 103, 103, 103),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(
                                width: 70.0,
                              ),
                              Text(
                                size,
                                style: TextStyle(
                                  color: !isDark
                                      ? Colors.white
                                      : const Color.fromARGB(255, 103, 103, 103),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

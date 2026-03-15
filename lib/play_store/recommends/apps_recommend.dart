import 'package:flutter/material.dart';
import 'package:practicee/provider_example/providers/dar_mode_controller.dart';
import 'package:provider/provider.dart';

class AppsRecommend extends StatefulWidget {
  const AppsRecommend({Key? key}) : super(key: key);

  @override
  State<AppsRecommend> createState() => _AppsRecommendState();
}

class _AppsRecommendState extends State<AppsRecommend> {
  List<String> comNames = [
    "WhatsApp",
    "Discord",
    "Twitter",
    "Zoom",
    "Facebook",
    "Instagram",
    "Zomatoo",
    "LinkedIn",
    "Messenger",
    "File Explorer",
    "Google Drive",
    "Snapchat",
    "Spotify",
    "Telegram",
    "YouTube",
    "Telegram",
    "Linked-In",
    "Messenger",
  ];
  List<String> comLIST = [
    "assets/wicon.png",
    "assets/discord.png",
    "assets/twitter.png",
    "assets/zoom.png",
    "assets/ficon.png",
    "assets/iicon.png",
    "assets/zomatoo.png",
    "assets/linkedin.png",
    "assets/messenger.png",
    "assets/file.png",
    "assets/gdrive.png",
    "assets/snapchat.png",
    "assets/spotify.png",
    "assets/telegramm.png",
    "assets/youtube.png",
    "assets/telegramm.png",
    "assets/linkedin.png",
    "assets/messenger.png",
  ];
  List<String> comSize = [
    "360 MB",
    "230 MB",
    "1.5 GB",
    "567 MB",
    "399 MB",
    "749 MB",
    "782 MB",
    "345 MB",
    "222 MB",
    "360 MB",
    "230 MB",
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
    bool isDark = context.watch<DarkModeController>().isDark;
    return Scaffold(
      backgroundColor:
          !isDark ? Colors.black : const Color.fromARGB(255, 248, 248, 250),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            !isDark ? Colors.black : const Color.fromARGB(255, 248, 248, 250),
        iconTheme: IconThemeData(
          color: isDark ? Colors.black : Colors.white,
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
        child: GridView.builder(
            itemCount: 18,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final name = comNames[index];
              final image = comLIST[index];
              final size = comSize[index];
              return Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: !isDark ? Colors.black : Colors.white,
                    child: Image.asset(
                      image,
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    size,
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

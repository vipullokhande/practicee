import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:practicee/animations/explicit/bouncing_loop_animation.dart';
import 'package:practicee/clean_architecture/core/di.dart';
import 'package:practicee/clean_architecture/presentation/bloc/counter_bloc/counter_bloc.dart';
import 'package:practicee/example_app_data/screens/profile.dart';
import 'package:practicee/firebase_options.dart';
import 'package:practicee/notifications/screens/notification_page.dart';
import 'package:practicee/notifications/services/notification_service.dart';
import 'package:practicee/notifications/services/push_notification_request_permission_service.dart';
import 'package:practicee/provider_example/providers/counter_provider.dart';
import 'package:practicee/provider_example/providers/dar_mode_controller.dart';
import 'package:practicee/provider_example/providers/navigation_controller.dart';
import 'package:provider/provider.dart';

// final pageStorageBucket = PageStorageBucket();

enum NavigationItem {
  home,
  edit,
  firstName,
  lastName,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  // String token = await GetServerkey.getServerKeyToken();
  // print("PUSH NOTIFICATION TOKEN $token");
  //For Awesome Notification
  await NotificationService.initNotificationService();
  ReceivedAction? initialAction = await AwesomeNotifications()
      .getInitialNotificationAction(removeFromActionEvents: true);
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  runApp(
    // const ProviderScope(
    //   child:
    MyApp(
      initialAction: initialAction,
    ),
    // ),
  );
}

class MyApp extends StatefulWidget {
  //For Awesome Notification
  final ReceivedAction? initialAction;

  const MyApp({super.key, this.initialAction});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationRequestPermissionService
      _pushNotificationRequestPermissionService =
      PushNotificationRequestPermissionService();
  List images = [
    'assets/aventador.png',
    'assets/current.png',
    'assets/discord.png',
    'assets/ficon.png',
    'assets/file.png',
    'assets/gdrive.png',
    'assets/google.png',
    'assets/iicon.png',
    'assets/linkedin.png',
    'assets/messenger.png',
    'assets/nitro.png',
    'assets/pinterest.png',
    'assets/snapchat.png',
    'assets/speed.png',
    'assets/spotify.png',
    'assets/telegramm.png',
    'assets/twitter.png',
    'assets/unstopppable.png',
    'assets/wicon.png',
    'assets/youtube.png',
    'assets/aventador.png',
    'assets/current.png',
    'assets/discord.png',
    'assets/ficon.png',
    'assets/file.png',
    'assets/gdrive.png',
    'assets/google.png',
    'assets/iicon.png',
    'assets/linkedin.png',
    'assets/messenger.png',
    'assets/nitro.png',
    'assets/pinterest.png',
    'assets/snapchat.png',
    'assets/speed.png',
    'assets/spotify.png',
    'assets/telegramm.png',
    'assets/twitter.png',
    'assets/unstopppable.png',
    'assets/wicon.png',
    'assets/youtube.png',
  ];

  List<String> dices = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
  ];

  String current1 = 'assets/6.png';
  String current2 = 'assets/6.png';
  //For Awesome Notification
  @override
  void initState() {
    super.initState();
    requestFirebaseNotificationPermission();
    if (widget.initialAction != null) {
      Future.delayed(Duration.zero, () {
        _handleNavigation(widget.initialAction!);
      });
    }
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (action) async {
        _handleNavigation(action);
      },
    );
  }

  Future<void> requestFirebaseNotificationPermission() async {
    _pushNotificationRequestPermissionService
        .requestPermissionPushNotificationFirebase();
    await _pushNotificationRequestPermissionService.getDeviceToken();
    await _pushNotificationRequestPermissionService.firebaseInit(context);
    await _pushNotificationRequestPermissionService.setUpMessage(context);
  }

  //For Awesome Notification
  void _handleNavigation(ReceivedAction action) {
    final route = action.payload?['route'];

    if (route != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushNamed(route);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // MultiRepositoryProvider(
        //   providers: const [],
        //   child:
        // ChangeNotifierProvider(
        // create: (context) => NavigationController(),
        // create: (context) => DarkModeController(),
        // child:
        MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => CounterBloc()),
        BlocProvider<CounterBloc>(
          create: (context) => s1<CounterBloc>()..add(LoadCounter()),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<DarkModeController>(
            create: (context) => DarkModeController(),
          ),
          ChangeNotifierProvider<CounterProviderExample>(
            create: (context) => CounterProviderExample(),
          ),
          ChangeNotifierProvider<NavigationController>(
            create: (context) => NavigationController(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //For Awesome Notification
          navigatorKey: navigatorKey,
          //For Awesome Notification
          routes: {
            '/profile': (context) => Profile(),
            '/home': (context) => const NotificationPage(),
          },
          home:
              // PageStorage(
              //   bucket: pageStorageBucket,
              // child:
              const BouncingLoopAnimation(),
          // ),
          // getPages: [],
          // ),
        ),
      ),
    );
  }
}

// class Item {
//   String name;
//   int price;
//   Item({
//     required this.name,
//     required this.price,
//   });
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Item> items = [];
//   List<String> countries = [
//     'India',
//     'Russia',
//     'Armenia',
//     'Italy',
//     'Moscow',
//     'Japan',
//     'London',
//   ];
//   late List<String> newCountries;
//   late final TextEditingController con1;
//   late final TextEditingController con2;
//   @override
//   void initState() {
//     super.initState();
//     con1 = TextEditingController();
//     con2 = TextEditingController();
//     newCountries = countries;
//   }

//   @override
//   void dispose() {
//     con1.dispose();
//     con2.dispose();
//     super.dispose();
//   }

//   IconData _getIcon(NavigationItem item) {
//     switch (item) {
//       case NavigationItem.home:
//         return Icons.home;
//       case NavigationItem.edit:
//         return Icons.edit;
//       case NavigationItem.firstName:
//         return Icons.near_me;
//       case NavigationItem.lastName:
//         return Icons.person;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final navigationController = Provider.of<NavigationController>(context);
//     return Scaffold(
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: ListView(
//           children: NavigationItem.values
//               .map((item) => _buildNavigation(item, navigationController))
//               .toList(),
//         ),
//       ),
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(
//               controller: con1,
//               onChanged: (value) {
//                 // setState(() {
//                 //   newCountries = countries
//                 //       .where((element) => element.contains(value))
//                 //       .toList();
//                 // });
//               },
//             ),
//             TextField(
//               controller: con2,
//               onChanged: (value) {},
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   items.add(
//                     Item(
//                       name: con1.text,
//                       price: 10,
//                     ),
//                   );
//                 });
//               },
//               child: const Text('Add'),
//             ),
//             Text(items.isNotEmpty
//                 ? items
//                     .map((e) => e.price)
//                     .reduce((value, element) => value + element)
//                     .toString()
//                 : '0'),
//             Text(items
//                 .fold(200,
//                     (previousValue, element) => previousValue - element.price)
//                 .toString()),

//             // SizedBox(
//             //   height: 500,
//             //   child: ListView.builder(
//             //     itemCount: newCountries.length,
//             //     itemBuilder: (context, index) => Text(
//             //       newCountries[index],
//             //       style: TextStyle(
//             //         fontSize: 30,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavigation(
//       NavigationItem item, NavigationController navigationController) {
//     final isSelected = navigationController.navigationItem == item;
//     return SingleNavigationWidget(
//       navigationItem: item,
//       icon: _getIcon(item),
//       title: item.name,
//       color: isSelected ? Colors.blueGrey : Colors.white,
//       textColor: isSelected ? Colors.white : Colors.black,
//       iconColor: isSelected ? Colors.white : Colors.black,
//       onTap: () => navigationController.changeNavigation(item),
//     );
//   }
// }

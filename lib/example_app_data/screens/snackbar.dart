import 'package:flutter/material.dart';
import 'package:practicee/example_app_data/tabs/search.dart';

class SnackBAR extends StatelessWidget {
  const SnackBAR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              child: Icon(Icons.add),
              onPressed: () {
                final String text = "SnackBar";
                final snackbar = SnackBar(
                  content: Text(text),
                  backgroundColor: Colors.cyan,
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar);
              },
            ),
            OutlinedButton(
              // color: Colors.amber,
              // splashColor: Colors.white,
              // shape: RoundedRectangleBorder(
              //     side: BorderSide(
              //         color: Colors.yellow,
              //         width: 1.0,
              //         style: BorderStyle.solid),
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  "Click",
                  style: TextStyle(color: Colors.cyan),
                ),
              ]),
              onPressed: () {
                final String text = "SnackBar";
                final snackbar = SnackBar(
                  duration: Duration(seconds: 60),
                  content: Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  action: SnackBarAction(
                    label: "Dismiss",
                    textColor: Colors.cyanAccent,
                    onPressed: () {
                      DismissDirection.startToEnd;
                    },
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final String text = "SnackBar";
                final snackbar = SnackBar(
                  duration: Duration(seconds: 3),
                  content: Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        child: Image.network(
                            "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj"),
                        height: 30,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  action: SnackBarAction(
                    label: "Dismiss",
                    textColor: Colors.cyanAccent,
                    onPressed: () {
                      DismissDirection.endToStart;
                    },
                  ),
                );
                await Future.delayed(Duration(seconds: 2));
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(),
                ));
                await Future.delayed(Duration(seconds: 3));
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue])),
                child: Row(
                  children: const [
                    Icon(
                      Icons.done,
                      color: Colors.black,
                    ),
                    Text(
                      "Click",
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              child: Ink(
                child: Container(
                  width: 200.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient:
                          LinearGradient(colors: [Colors.white, Colors.blue])),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      Text(
                        "Click",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              onTap: () {},
              child: Ink(
                height: 40.0,
                width: MediaQuery.of(context).size.width - 90,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.orange,
                    Colors.white,
                    Colors.green,
                  ]),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Image.network(
                    //     "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png"),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        letterSpacing: 1.8,
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              onTap: () {},
              child: Ink(
                height: 40.0,
                width: 300.0,
                child: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.purple,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.deepPurpleAccent,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              onTap: () {},
              child: Ink(
                height: 40.0,
                width: 300.0,
                child: Row(
                  children: const [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(Icons.home_max_sharp, color: Colors.white),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Hey",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.purple,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onDoubleTap: () async {
                final String text = "SnackBar";
                final snackbar = SnackBar(
                  duration: Duration(seconds: 3),
                  content: Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        child: Image.network(
                            "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj"),
                        height: 30,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  action: SnackBarAction(
                    label: "Dismiss",
                    textColor: Colors.cyanAccent,
                    onPressed: () {
                      DismissDirection.endToStart;
                    },
                  ),
                );
                await Future.delayed(Duration(seconds: 2));
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(),
                ));
                await Future.delayed(Duration(seconds: 3));
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar);
              },
              splashColor: Colors.deepPurpleAccent,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              onTap: () {},
              child: Ink(
                height: 40.0,
                width: 300.0,
                child: Row(
                  children: const [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(Icons.portrait_sharp, color: Colors.white),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.shade200,
                      Colors.pink.shade300,
                      Colors.pink.shade300,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

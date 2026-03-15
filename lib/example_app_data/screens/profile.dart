// ignore_for_file: deprecated_member_use

import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  RemoteMessage? remoteMessage;
  Profile({
    super.key,
    this.remoteMessage,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController _email = TextEditingController();
    // TextEditingController _phone = TextEditingController();
    // TextEditingController _password = TextEditingController();

    // bool _secured = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: widget.remoteMessage != null
            ? Column(
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Text(
                      "DATA ${widget.remoteMessage!.data['route']}",
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Image.network(
                    "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png",
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                  ),
                  Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white60,
                    child: const Stack(
                      alignment: AlignmentDirectional.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -66,
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                                radius: 66.0,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    "https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                    ),
                    child: Column(
                      children: [
                        Form(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 200,
                                  child: OutlinedButton(
                                    // shape: const RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.all(Radius.circular(30.0))),
                                    // splashColor: Colors.white,
                                    onPressed: () {},
                                    // color: Colors.cyanAccent,
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Click",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: OutlinedButton(
                                    // height: 50,
                                    // shape: const RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.all(Radius.circular(30.0))),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Click",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    // color: Colors.cyan,
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    print("Clicked");
                                  },
                                  // padding: EdgeInsets.zero,
                                  // shape: const RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         BorderRadius.all(Radius.circular(30.0))),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        gradient: LinearGradient(colors: [
                                          Colors.blue,
                                          Colors.white,
                                        ])),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: const Text(
                                      'click',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: null,
                                  // highlightedBorderColor: Colors.red,
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(20.0)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        gradient: const LinearGradient(colors: [
                                          Colors.blue,
                                          Colors.white,
                                        ])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.cyan.shade200,
        onPressed: null,
        label: const Text("Click"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

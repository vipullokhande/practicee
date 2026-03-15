import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicee/widgets/story.dart';

class PracticeOne extends StatefulWidget {
  const PracticeOne({Key? key}) : super(key: key);

  @override
  State<PracticeOne> createState() => _PracticeOneState();
}

class _PracticeOneState extends State<PracticeOne> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: value ? const Color.fromARGB(255, 46, 44, 44) : Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                value = !value;
              });
            },
            icon: Icon(
              value ? Icons.light_mode : Icons.dark_mode,
              color: value ? Colors.white : Colors.black,
              size: 35.0,
            ),
          ),
          IconButton(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: Icon(
              Icons.add,
              color: value ? Colors.black : Colors.white,
              size: 35.0,
            ),
          ),
          IconButton(
            onPressed: () {
              showAD(context, value);
            },
            icon: Icon(
              Icons.add_photo_alternate_rounded,
              color: value ? Colors.black : Colors.white,
              size: 35.0,
            ),
          ),
          IconButton(
            onPressed: () {
              showMBS(context, value);
            },
            icon: Icon(
              FontAwesomeIcons.google,
              color: value ? Colors.black : Colors.white,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: MySearchDelegate(),
            ),
            icon: Icon(
              Icons.search,
              color: value ? Colors.black : Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    "Google",
    "MicroSoft",
    "Amazon",
    "Netflix",
    "Apple",
    "Adobe",
    "Alibaba",
    "Krafton",
    "Goldmann Sachs",
    "Tesla",
    "Wipro",
    "TATA Motors",
    "TCS",
    "Congnizant",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
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
          title: Text(
            result,
          ),
        );
      },
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
        title: TextButton.icon(
          label: const Text("Flutter"),
          onPressed: () {},
          icon: Image.asset(
            'assets/current.png',
            height: 40,
            width: 60,
          ),
          // Image.network(
          //   'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          //   height: 40,
          //   width: 60,
          // ),
        ),
        content: TextField(
          // autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Enter",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              )),
        ),
        actions: [
          Column(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.amber,
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width, 50.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                    ),
                    Text("Exit")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.cyan, backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('CLOSE'),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      elevation: 10.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.home_max,
                      // color: Colors.black,
                    ),
                    label: const Text("Close"),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

void showAD(BuildContext context, bool value) => showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.orange,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Colors.pink.shade100,
                Colors.pink.shade200,
                Colors.pink.shade300,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50.0,
                color: Colors.white,
                child: const Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "EXIT APP",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Are you sure want to exit the App ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {},
                      child: Ink(
                        height: 50.0,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                width: 1.5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Exit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {},
                      child: Ink(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blueGrey,
                        ),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );

void showMBS(BuildContext context, bool value) => showModalBottomSheet(
      backgroundColor:
          value ? const Color.fromARGB(255, 46, 44, 44) : Colors.grey.shade300,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        side: BorderSide(
          color: value ? Colors.yellow : Colors.white,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 17.0),
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              const Story(),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                "Username",
                style: TextStyle(
                  color: value ? Colors.white : Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: value
                      ? Colors.black45
                      : const Color.fromARGB(230, 230, 229, 229),
                  side: BorderSide(
                    color: value ? Colors.white : Colors.black,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width - 30, 50.0),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20.0),
                    Text(
                      "Add account",
                      style: TextStyle(
                        color: value ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add,
                      color: value ? Colors.white : Colors.black,
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
        ],
      ),
    );

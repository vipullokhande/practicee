import 'package:flutter/material.dart';
import 'package:practicee/example_app_data/tabs/add.dart';
import 'package:practicee/example_app_data/widgets/call.dart';
import '../widgets/chats.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? value;
  final items = [
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
    'Google',
    'Microsoft',
    'Apple',
  ];
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
              iconSize: 30.0,
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Calls',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Chat(),
            Add(),
            Callss(),
          ],
        ),
      ),
    );
  }
}

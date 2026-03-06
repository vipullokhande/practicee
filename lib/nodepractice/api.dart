import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicee/nodepractice/title_model.dart';

class Api {
  static const baseUrl = 'http://192.168.43.250/api/';
  static addTitle(Map titleData) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/add_title'),
        body: titleData,
      );
      if (res.statusCode == 200) {
        // ignore: unused_local_variable
        var data = jsonDecode(res.body.toString());
      } else {
        //
        print('Failed to upload data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getTitle() async {
    List<TitleModel> person = [];
    try {
      final res = await http.get(Uri.parse('$baseUrl/gettitle'));
      if (res.statusCode == 200) {
        // ignore: unused_local_variable
        var data = jsonDecode(res.body.toString());
        data['title'].forEach((title, index) => {
              person.add(
                TitleModel(
                  title: data['title'][index].title,
                  subTitle: data['title'][index].subtitle,
                ),
              ),
            });
        return person;
      } else {
        //
        print('Failed to upload data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

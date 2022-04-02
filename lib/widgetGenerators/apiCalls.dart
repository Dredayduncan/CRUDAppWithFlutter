import 'dart:convert';

import 'package:contact_management_system/commonWidgets/contact.dart';
import 'package:http/http.dart' as http;

class APICalls {

  Future<List> getAllContacts() async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/getallcontact");
    var response = await http.post(url);
    List results = [];

    List res = jsonDecode(response.body);

    for (var i = 0; i < res.length; i++){

      results.add(Contact(
        pid: res[i]["pid"],
        pname: res[i]['pname'],
        contact: res[i]['pphone'],
      ));
    }
    return results;
  }
}
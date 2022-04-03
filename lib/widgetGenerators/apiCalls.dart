import 'dart:convert';

import 'package:contact_management_system/commonWidgets/contact.dart';
import 'package:http/http.dart' as http;

class APICalls {

  Future<List> getAllContacts() async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/getallcontact");
    var response = await http.get(url);
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

  Future<Map> getOneContact({contID}) async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/viewAcontact?contid=$contID");
    var response = await http.get(url);
    return jsonDecode(response.body)[0] as Map;
  }

  Future<String> updateContact({conID, uname, unumber}) async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/up_date_con");
    var response = await http.post(url, body: {"conid": conID, "uname": uname, "unumber": unumber});
    return response.body;
  }

  Future<String> addContact({uname, unumber}) async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/add_con_mobi");
    var response = await http.post(url, body: {"uname": uname, "unumber": unumber});
    return response.body;
  }

  Future<String> deleteContact({ppid}) async {
    var url = Uri.parse("https://apps.ashesi.edu.gh/contactmgt/view/delcontact");
    var response = await http.post(url, body: {"ppid": ppid});
    return response.body;
  }
}
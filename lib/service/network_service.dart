import 'dart:convert';

import 'package:http/http.dart';
import 'package:parsinresponse/model/request_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";


//  http serice

  static String API_EMPLOYEES = "/api/v1/employees";
  static String API_EMPLOYEE = "/api/v1/employees/";   //id


  //http request
  static Future<String?> GET(String api ,Map<String, String> params) async {
    var uri = Uri.https(BASE,api,params);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


//  http params

  static Map<String,String> paramsEmpty(){
    return {};
  }

//  http persing

  static parEmpList(String body){
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }
}
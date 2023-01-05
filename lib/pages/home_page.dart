import 'package:flutter/material.dart';
import 'package:parsinresponse/model/request_model.dart';

import '../model/employee_model.dart';
import '../service/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiParsingEmpList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return itemOffList(items[index]);
        },
      ),
    );
  }

  /// C O N T R O L L E R
  List<Employee> items = [];

  void _apiParsingEmpList() async {
    String? response = await Network.GET(Network.API_EMPLOYEES, Network.paramsEmpty());
    EmpList empList = Network.parEmpList(response!);
    setState(() {
      items = empList.data;
    });
  }


  Widget itemOffList(Employee emp) {
    return Container(

      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${emp.employee_name!} ${emp.employee_age}",style: TextStyle(fontSize: 18)),
          SizedBox(height: 10,),
          Text(emp.employee_salary.toString(),style: TextStyle(fontSize: 18)),
          Divider()
        ],
      ),
    );
  }
}

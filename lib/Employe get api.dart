import 'package:employeedetails/Model/Employe%20class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';


class empdetails extends StatefulWidget {
  const empdetails({super.key});

  @override
  State<empdetails> createState() => _empdetailsState();
}

class _empdetailsState extends State<empdetails> {
 late Future<List<EmployeeList>> _EmployeeList;

 Future<List<EmployeeList>> Fetchemp() async{
var resp = await http.get(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/GetAllEmployeeDetails"));
var abc =jsonDecode(resp.body)["employeeList"];
print(abc);
return (abc as List).map((e) => EmployeeList.fromJson(e)).toList();

 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _EmployeeList = Fetchemp();

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          FutureBuilder(
              future: _EmployeeList,
              builder: (context , snapshot){
              if(snapshot.hasData){
              List<EmployeeList> list= snapshot.data!;
              return Container(
                      height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(),
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ( context , index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all()
                          ),
                          child: Column(
                            children: [
                              Text(list[index].employeeId.toString()),
                              Text(list[index].employeeName.toString()),
                              Text(list[index].mobile.toString()),
                              Text(list[index].userName.toString()),
                              Text(list[index].password.toString()),
                              Text(list[index].confirmPassword.toString()),

                            ],
                          ),


                        ),
                      );


                    }







                      )

              );



              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();



              }







          )
        ],
      )







    );
  }
}

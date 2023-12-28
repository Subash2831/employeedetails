import 'dart:convert';
import 'package:employeedetails/Employe%20get%20api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shimmer_animation/shimmer_animation.dart';
import 'Model/Employee post class.dart';

class empapi extends StatefulWidget {
  const empapi({super.key});

  @override
  State<empapi> createState() => _empapiState();
}

class _empapiState extends State<empapi> {
    Future<Success>? _future;
    Future<Success> postdata(String employeeName, String mobile, String userName, String password, String confirmPassword) async{
    var resp = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "employeeId": 0,
        "employeeName": employeeName,
        "mobile": mobile,
        "userName": userName,
        "password": password,
        "confirmPassword": confirmPassword,
      })
    );
    return Success.fromJson(jsonDecode(resp.body));
    }
    TextEditingController employeeName1 = TextEditingController();
    TextEditingController mobile1 = TextEditingController();
    TextEditingController  userName1= TextEditingController();
    TextEditingController password1 = TextEditingController();
    TextEditingController confirmPassword1 = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading:
        Row(
          children: [
            Icon(Icons.arrow_back_ios),

            
            
          ],
        ),

      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_future == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }
  Column buildColumn(){
          return Column(
            children: [
              TextField(
                controller: employeeName1,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter employeeName'),
              ),

              TextField(
                controller: mobile1,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter mobile Number'),

              ),

              TextField(
                controller: userName1,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter userName'),
              ),

              TextField(
                controller: password1,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter password'),
              ),

              TextField(
                controller: confirmPassword1,
                decoration: const InputDecoration
                  (
                    enabledBorder: OutlineInputBorder(),

                    hintText: 'Enter confirmPassword'),

              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _future = postdata(

                      employeeName1.text,
                      mobile1.text,
                      userName1.text,
                      password1.text,
                      confirmPassword1.text,

                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> empdetails() ));
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,foregroundColor: Colors.red),
                child: const Text('Create Data'),
              ),
              



            ],
          );

  }
    FutureBuilder<Success> buildFutureBuilder() {
      return FutureBuilder<Success>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.success.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Shimmer(
              duration: Duration(seconds: 3),
              interval: Duration(seconds: 5),
              color: Colors.black,
              colorOpacity: 0,
              direction: ShimmerDirection.fromLTRB(),
              child: Container(
                color: Colors.white10,
              )
          );
        },
      );
    }
}


import 'package:flutter/material.dart';
import 'package:main_project/Models/Employee.dart';
import 'package:main_project/sqlite/sqlite.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {   
  List<Employee> employeelist=[
    // Employee(id: "1",name: "Reshma",Role: "Flutter Developer"),
    // Employee(id: "2",name: "lakshya",Role: "Java Developer"),
    // Employee(id: "3",name: "musthafa",Role: "Flutter Developer"),
    // Employee(id: "4",name: "Rekha",Role: "Web Developer"),
    // Employee(id: "5",name: "Shabaz",Role: "Python Developer"),
    // Employee(id: "6",name: "Razik",Role: "C# Developer"),
    // Employee(id: "7",name: "vyshnav",Role: "Customer Support"),
    // Employee(id: "7",name: "Arya",Role: "Buissness Analyst"),
    // Employee(id: "8",name: "Aparna",Role: "C Developer"),
    // Employee(id: "9",name: "Anu",Role: "Angular Developer"),
    // Employee(id: "10",name: "Sam",Role: "Flutter Developer"),
    // Employee(id: "11",name: "Anil",Role: "Java Developer"),
  ];

@override
  void initState() {
  loadInitialvalue();
    super.initState();
  }
  // function is used to load the initial value of team members from the  database and update the value using setState
  void loadInitialvalue()async{
    List<Employee> members = await DatabaseTeam().getTeamMembers();
    setState(() {
      employeelist = members;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(

        title: Text("MyTeam"),
        backgroundColor: Colors.grey,
        centerTitle: true,
        automaticallyImplyLeading: true,
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back),
    // onPressed: (){
    //         Navigator.pop(context);
    // },
    //
    //   )
      ),
      // List view builder is used to display the data in the add_team_member
      body:  employeelist.isEmpty
          ? Center(
        child: Text(
          'No team members found.',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      )
          :ListView.builder(

        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: employeelist.length,
        itemBuilder: (context, index) {
          Employee?employeedetails=employeelist[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(10),
              // height: 150,
              width: 300,
              decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person,size: 40,),
                    // backgroundImage: AssetImage('Assets/images/Profileicon.webp'),
                  ),
                  SizedBox(width: 35,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Text(employeedetails.name??"",style: TextStyle(fontSize: 25,color: Colors.black),),
                      Text(employeedetails.role??"",style: TextStyle(fontSize: 25,color: Colors.black),),
                       Text(employeedetails.gender??"",style: TextStyle(fontSize: 25,color: Colors.black),),

                    ],
                  ),
                ],
              ),


            ),
          );
        },


      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:main_project/Models/Employee.dart';
import 'package:main_project/sqlite/sqlite.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {   
  List<Employee> employeelist=[];

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
  void deleteTeamMember(String id) async {
    await DatabaseTeam().deleteTeamMember(id);
    setState(() {
      employeelist.removeWhere((member) => member.id == id);
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
        automaticallyImplyLeading:false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
    onPressed: (){
            Navigator.pop(context);
    },

      )
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,

              decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(20)),
              child: Row(


                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person,size: 40,),
                        // backgroundImage: AssetImage('Assets/images/Profileicon.webp'),
                      ),
                    ],
                  ),

                  SizedBox(width: 30,),
                  Column(
                     mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(employeedetails.name??"",style: TextStyle(fontSize: 25,color: Colors.black),),
                      Text(employeedetails.role??"",style: TextStyle(fontSize: 25,color: Colors.black),),
                      Text(employeedetails.gender??"",style: TextStyle(fontSize: 25,color: Colors.black),),




                    ],
                  ),
                Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      ElevatedButton(onPressed:() {
                        if (employeedetails.id != null) {
                          deleteTeamMember(employeedetails.id!);
                        }


                      }, child: Text("delete",style:TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.w400),))

                    ],
                  )
                ],

              ),


            ),
          );
        },


      ),

    );
  }
}

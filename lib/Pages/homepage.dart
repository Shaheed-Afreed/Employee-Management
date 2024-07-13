import 'package:flutter/material.dart';
import 'package:main_project/Pages/Apply_Leave.dart';
import 'package:main_project/Pages/Login.dart';
import 'package:main_project/Pages/MyTeam.dart';
import 'package:main_project/Pages/add_team_member.dart';
import 'package:main_project/Pages/profile_page.dart';
import 'package:main_project/Pages/view_leave_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // appbar text is used to display the text on top of the page
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      //when user tap the Drawer icon this function will executed
      drawer: Drawer(
        child: Container(
          color: Colors.grey[900],
          // List View is display's a scrollable list of widgets
          child: ListView(
            children: [
              // User account information displayed at the top of the drawer
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Shaheed",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                accountEmail: Text(
                  "shaheedafreed76@gmail.com",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'Assets/images/my photo.jpg',
                  ),
                ),
                decoration: BoxDecoration(color: Colors.grey),
              ),
              // Display the user's employee ID
              ListTile(
                leading: Icon(
                  Icons.badge,
                  color: Colors.white,
                ),
                title: Text(
                  ' ID :  EMP046',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              // Display the user's Phone no
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  "7676998338",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              // Divider to separate sections
              Divider(),
              // Navigation item to the Home page
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              Divider(),
              // Navigation item to the MyTeam page
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title: Text(
                  'My Team',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyTeam()));
                },
              ),
              Divider(),
              // Navigation item to the profile page
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
      // SingleChildscrollView is makes entire column scrollable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi,Good Morning",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        "Shaheed",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  // spacer
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (bc)=>Profile()));
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('Assets/images/my photo.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  //container for My Team
                  Container(
                    width: 185,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    // Row for My Team and Apply Leave buttons
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.people,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        // Button to navigate to My Team page
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyTeam()),
                              );
                            },
                            child: Text(
                              "My Team",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //Container for Leave Applying Page
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.leave_bags_at_home_outlined,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        // Button to navigate to Apply Leave
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ApplyLeave()),
                              );
                            },
                            child: Text(
                              "Apply Leave",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Container for Add Team button
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.person_add,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        // Button to navigate to Add Team Member page
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTeamMember()),
                            );
                          },
                          child: Text(
                            "Add Team",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Container for Profile button
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.list_alt_sharp,
                            size: 40,
                          ),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        // Button to navigate to Profile page
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewLeaveList()),
                              );
                            },
                            child: Text(
                              " Leave List",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),

              //copy and paste
            ],
          ),
        ),
      ),
    );
  }
}

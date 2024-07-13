import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Profile",),
        centerTitle: true,
        backgroundColor: Colors.grey,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Assets/images/my photo.jpg'),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(
                    width:120,child: Text("EMPID",style: TextStyle(fontSize: 25,color: Colors.white),)),

                  Text("EMP046",style: TextStyle(fontSize: 25,color: Colors.white),),
                ],
              ),
                               // SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:120,child: Text("NAME",style: TextStyle(fontSize: 25,color: Colors.white),)),

                  Text("SHAHEED AFREED",style: TextStyle(fontSize: 25,color: Colors.white),),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:120,child: Text("D O B",style: TextStyle(fontSize: 25,color: Colors.white),)),
                  Text("11/04/2001",style: TextStyle(fontSize: 25,color: Colors.white),),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:120,child: Text("PHONE ",style: TextStyle(fontSize: 25,color: Colors.white),)),
                  Text("7676998338",style: TextStyle(fontSize: 25,color: Colors.white),),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:120,child: Text("GENDER ",style: TextStyle(fontSize: 25,color: Colors.white),)),
                  Text("MALE",style: TextStyle(fontSize: 25,color: Colors.white),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:120,child: Text("ROLE ",style: TextStyle(fontSize: 25,color: Colors.white),)),
                  Text("FLUTTER DEVELOPER",style: TextStyle(fontSize: 25,color: Colors.white),)
                ],
              ),



            ],
          ),
        ),
      ),

    );
  }
}

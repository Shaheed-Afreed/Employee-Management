import 'package:flutter/material.dart';
import 'package:main_project/Pages/Login.dart';
import 'package:main_project/Pages/homepage.dart';
import 'package:main_project/sqlite/sqlite.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Texteditingcontroller is used to take the value from Text Field
  final username = TextEditingController();
  final password =  TextEditingController();
  final conpassword=TextEditingController();
  bool isVisible=false;
  bool isvisible=false;
  String? passwordError;
  // This function is check password and confirm password are same
  bool isPasswordMatch() {
    if (password.text != conpassword.text) {
      passwordError = 'Passwords do not match.';
      return false;
    }
    passwordError = null;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Register New Account",
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Colors.white.withOpacity(0.9),
                      ),
                      child: TextFormField(
                        controller: username,
                        style: TextStyle(fontSize: 25),
                        decoration:const InputDecoration(

                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: "Username",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Colors.white.withOpacity(0.9),
                      ),
                      child: TextFormField(
                        controller: password,
                        obscureText:!isVisible,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(

                            icon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              },
                              icon:Icon(isVisible?Icons.visibility:Icons.visibility_off),)
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(

                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: TextFormField(
                        controller: conpassword,
                        obscureText:!isvisible,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(

                            icon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isvisible=!isvisible;
                                });
                              },
                              icon:Icon(isvisible?Icons.visibility:Icons.visibility_off),)
                        ),
                      ),
                    ),
                    if (passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          passwordError!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),



              Container(
                margin: EdgeInsets.only(top: 10),
                height: 60,
                width: 225,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple
                ),
                child: TextButton(
                  onPressed: ()async{
    if(isPasswordMatch()) {
    DatabaseHelper db = DatabaseHelper();
    await db.insertUser({
    'username': username.text,
    'password': password.text,
    });

    print(username.text);
    print(password.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Registered')));
    Navigator.pop(context);

    } else {
    setState(() {

    });
    }

    },

                  child: const Text(
                    "SIGNUP",
                    style:TextStyle(color: Colors.white,
                        fontSize: 25) ,
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Already have an account?",
                    style: TextStyle(fontSize:18 ),),
                  TextButton(onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                    child: Text("Login",style: TextStyle(fontSize:18 ),),)
                ],
              )






            ],
          ),
        ),
      ),

    );
  }
}



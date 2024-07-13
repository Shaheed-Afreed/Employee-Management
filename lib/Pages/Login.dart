import 'package:flutter/material.dart';
import 'package:main_project/Pages/Register.dart';
import 'package:main_project/Pages/homepage.dart';
import 'package:main_project/sqlite/sqlite.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variable is created to store the value from textfield
  final username = TextEditingController();
  final password =  TextEditingController();
  // State variable to toggle password visibility
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color of the scaffold
     backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Login",style: TextStyle(fontSize: 50,color: Colors.black),),
              ),

              SizedBox(
                height: 80,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      // Username input Text field
                      child: TextFormField(
                        // controller is used to hold the value of user entered
                        controller: username,
                        style: TextStyle(fontSize: 25),
                        decoration:const InputDecoration(

                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          // Placeholder text
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
                        color: Colors.white.withOpacity(0.9),
                      ),
                      // password input Text field
                      child: TextFormField(
                        controller: password,
                        obscureText:!isVisible,// Hide/show password
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(

                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",// Placeholder text
                          suffixIcon: IconButton(
                            onPressed: (){
                            setState(() {
                              isVisible=!isVisible; // Toggle password visibility
                            });
                          },
                            icon:Icon(isVisible?Icons.visibility:Icons.visibility_off),)
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              // Login button
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
                   // Database operation to validate user credentials
                   DatabaseHelper db = DatabaseHelper();
                   var user = await db.getUser(
                     username.text,
                     password.text,
                   );
                   // If credentials are valid, show a success message and navigate to HomePage
                   if (user != null) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>HomePage()));
                     // If credentials are invalid, show an error message
                   } else {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
                   }

                 },
                 child: const Text(
                   "Login",  // Text displayed on the button
                   style:TextStyle(color: Colors.white,
                   fontSize: 25) ,
                 ),

               ),
             ),
              // Row with "Don't have an account?" text and Register button
             Row(
               mainAxisAlignment: MainAxisAlignment.center,

               children: [
                 Text("Dont have an account?",
                   style: TextStyle(fontSize:18 ),),
                 TextButton(onPressed: (){
                   // Navigate to RegisterPage when Register button is pressed

                   Navigator.push(context,
                     MaterialPageRoute(builder:(context)=>RegisterPage()),);

                 },
                     child: Text("Register",style: TextStyle(fontSize:18 ),),)
               ],
             )






            ],
          ),
        ),
      ),
    );
  }
}

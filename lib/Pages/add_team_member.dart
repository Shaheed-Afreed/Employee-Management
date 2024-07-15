import 'package:flutter/material.dart';
import 'package:main_project/Models/Employee.dart';
import 'package:main_project/sqlite/sqlite.dart';

class AddTeamMember extends StatefulWidget {
  const AddTeamMember({super.key});

  @override
  State<AddTeamMember> createState() => _AddTeamMemberState();
}

class _AddTeamMemberState extends State<AddTeamMember> {
  //Controller to take the data from Form

  TextEditingController _name=TextEditingController();
  TextEditingController id=TextEditingController();
  TextEditingController _designation=TextEditingController();
  List<String> _gender=["Male","Female"];
  String? gender;
  DateTime? _selecteddate;
  // function for the date picker
  Future<void>_dateofbirth(BuildContext Context)async{
    final DateTime? picked=await showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),);
    if(picked!=null && picked!=_selecteddate)
      {
        setState(() {
          _selecteddate=picked;
        });
      }
  }
  // _submit function is used to give the value from the Text field  to instance variable present inside the Employee class through Constructor
  void _submit() async {
    Employee member = Employee(

      gender: gender,
      name: _name.text,
      role: _designation.text,
      dateOfBirth: _selecteddate,



    );
     await DatabaseTeam().insertTeamMember(member);
    // Navigator.push(
    //   context,
    //    MaterialPageRoute(builder: (context) => TeamMembersPage()),
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Add Team",
          style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.grey,
     // automaticallyImplyLeading: false,

    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("id of employee",
                style:TextStyle(color: Colors.white,fontSize: 15),
              ),
              SizedBox(height: 10,),
              TextField(
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                controller: id,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    hintText: "enter id",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    )

                ),

              ),
              SizedBox(height: 10,),


              //text for the Name field
              Text("Name of employee",
                style:TextStyle(color: Colors.white,fontSize: 15),
              ),
              SizedBox(height: 10,),
              // Text field to enter the name
              TextField(
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    )

                  ),

              ) ,

              SizedBox(height: 20,),
              // Text of Designation
              Text("Designation",
                style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              // Text field to enter the designation
              TextField(
                controller: _designation,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: "Designation",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)
                  )

                ),

              ),
              SizedBox(height: 10,),
              // Text for DOB
              Text("Date of Birth",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              // Container of Date Of Birth field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)
                ),
                // List tile is used to combine several widgets like title,leading icon and trailing icon
                child: ListTile(
                  title: Text(
                     _selecteddate==null? 'select Date of Birth':'${_selecteddate?.day}/${_selecteddate?.month}/${_selecteddate?.year}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(Icons.calendar_today,color: Colors.white,),
                  onTap: ()=>_dateofbirth(context),
                ),

              ),
              SizedBox(height: 20,),
              Text("Select Gender ",style: TextStyle(fontSize: 15,color: Colors.white),),
              SizedBox(height: 20,),
              DropdownButtonFormField<String>(
                value: gender,
                hint: Text("Select Gender",
                style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400),
                ),
                onChanged: (String ?newValue) {
                  setState(() {
                    gender=newValue;
                  });

                },
                items:_gender.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                  value:value,


                 child:Text(value,style: TextStyle(color:Colors.white),),

                  );
              }).toList(),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),

                ),
                 dropdownColor: Colors.grey[900],
              ),
              SizedBox(height: 30,),
              // Container for submit button when user enter submit button control goes to _submit function
              Align(
                alignment: Alignment.center,
                child: Container(height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                    borderRadius: BorderRadius.circular(20),

                ),
                  child: TextButton(onPressed: (){

                    print(_name.text);
                    print(_selecteddate.toString());
                    print(_designation.text);
                    print(gender);

                    _submit();
                    Navigator.pop(context);
                  },child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20),),),
                ),
              )




            ],
          ),
        ),
      ),


    );
  }
}

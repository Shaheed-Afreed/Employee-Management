import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  // Variables are created to strore the data user enters in textfield
  String? _leaveoptions = 'Full Day';

  final List<String>  _leaveType=["UnPaid Leave","Casual Leave","Sick Leave"];
  String? leaveType;
  DateTime? _startdate;
  DateTime? _enddate;
  // this function is used to display the calender to user to choose start date
  Future<void>_selectstartdate(BuildContext Context)async{
    final DateTime? picked=await showDatePicker(context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026));
    if(picked!=null && picked!=_startdate)
    {
      setState(() {
        _startdate=picked;
      });
    }
  }
  // this function is used to display the calender to user to choose end date
  Future<void>_selectedEndDate(BuildContext Context)async{
    final DateTime? picked=await showDatePicker(context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),);
    if(picked!=null && picked!=_enddate)
    {
      setState(() {
        _enddate=picked;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar Text is used to display the Text on the top of the page
      appBar: AppBar(title: Text("Apply Leave"),
        backgroundColor: Colors.grey,
        centerTitle: true,),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Leave Apply for: ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
            SizedBox(height: 10,),

            //Container for the leave mode like full day or half day using radio button
            Container(
              height: 60,
              width: 450,
              decoration: BoxDecoration(border: Border.all(color: Colors.white),
                borderRadius:BorderRadius.circular(10),

              ),
              margin: EdgeInsets.only(left: 2),
              padding: EdgeInsets.all(10.0),


              child: Row(
                children: [

                  Radio<String>(value:'Full day',
                      groupValue:_leaveoptions,
                      onChanged:(value)
                      {
                        setState(() {
                          _leaveoptions=value;
                        });
                      }),
                  Text("Full day",style: (TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400)),),
                  SizedBox(width: 40,),
                  Radio<String>(value:'Half day',
                      groupValue:_leaveoptions,
                      onChanged:(value)
                      {
                        setState(() {
                          _leaveoptions=value;
                        });
                      }),
                  Text("Half day",style: (TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400)),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Leave Type ",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 10,),
            // this container for leave type in dropdown
            DropdownButtonFormField<String>(
              value: leaveType,
              hint: Text("Select Leave Type",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),),
              onChanged: (String?newValue) {
                setState(() {
                  leaveType=newValue;
                });

              },
              items: _leaveType.map<DropdownMenuItem<String>>((String value)
              {
                return DropdownMenuItem<String>(value: value,child:Text(value),);
              }).toList(),
              decoration: InputDecoration(enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)
              ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white))
              ),

            ),


            SizedBox(height: 20,),
            Text("Start Date",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 10,),
            // ->container is used for to choose the start date
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)
              ),

              child: ListTile(
                title: Text(
                  _startdate==null? 'Enter Start date' :' ${_startdate?.day}/${_startdate?.month}/${_startdate?.year}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.calendar_today,color: Colors.white,),
                onTap: ()=>_selectstartdate(context),
              ),

            ),
            SizedBox(height: 20,),
            Text("End Date",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 10,),
            // ->container is used for to choose the end date

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)
              ),

              child: ListTile(
                title: Text(
                  _enddate==null? 'Enter End date' :' ${_enddate?.day}/${_enddate?.month}/${_enddate?.year}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.calendar_today,color: Colors.white,),
                onTap: ()=>_selectedEndDate(context),
              ),

            ),


            SizedBox(height: 30,),
            // ->this Container is for Apply button
            Align(
              alignment: Alignment.center,
              child: Container(height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(onPressed: (){

                  Navigator.pop(context);

                },child: Text("Apply",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            )






          ],





        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:main_project/Models/View_leave.dart';

class ViewLeaveList extends StatefulWidget {
  const ViewLeaveList({super.key});

  @override
  State<ViewLeaveList> createState() => _ViewLeaveListState();
}

class _ViewLeaveListState extends State<ViewLeaveList> {
 List<ViewLeave> viewList=[
   ViewLeave(leaveoptions: "half day",leavetype: "Casual leave",startdate: "12/05/2024",enddate: "12/05/2024"),
   ViewLeave(leaveoptions: "Full day",leavetype: "Unpaid leave",startdate: "12/05/2024",enddate: "13/05/2024"),
   ViewLeave(leaveoptions: "Full day",leavetype: "Casual leave",startdate: "14/05/2024",enddate: "15/05/2024"),
   ViewLeave(leaveoptions: "half day",leavetype: "Sick leave",startdate: "17/05/2024",enddate: "17/05/2024"),

 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Leave List"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),

          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          itemCount: viewList.length,
          itemBuilder: (context, index) {
            ViewLeave ?Leavedetails=viewList[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10),
                // height: 150,
                width: 300,
                decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(

                    ),

                    SizedBox(width: 35,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Leave Type: ${Leavedetails.leavetype??""}',style: TextStyle(fontSize: 25,color: Colors.black),),
                        Text('Leave Option: ${Leavedetails.leaveoptions??""}',style: TextStyle(fontSize: 25,color: Colors.black),),

                        Text('Start Date: ${Leavedetails.startdate??""}',style: TextStyle(fontSize: 25,color: Colors.black),),
                        Text('End Date: ${Leavedetails.enddate??""}',style: TextStyle(fontSize: 25,color: Colors.black),),

                      ],
                    ),
                  ],
                ),


              ),
            );
          },


        ),
      ),
    );
  }
}

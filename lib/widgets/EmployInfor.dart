import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home/widgets/NhanVien.dart';
import 'package:intl/intl.dart';

class EmployInfor extends StatefulWidget {
  const EmployInfor({super.key});

  @override
  State<EmployInfor> createState() => _EmployInforState();
}

class _EmployInforState extends State<EmployInfor> {
 
  final NgaySinhController = TextEditingController();
  bool isEditableName = false;
  bool isEditableId = false;
  bool isEditableDate = false;
  bool isEditablePosi = false;
  String name = 'Nguyễn Thị A';
  String employId = '123456';
  String date = "22/10/2002";
  String Posi = "Trưởng Phòng";

  

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 4, 53, 60),
        title: Text("Employee Information" ),
        titleTextStyle: TextStyle(fontSize: 20, ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom:15 ),
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                      image: DecorationImage(
                        image: AssetImage("assets/images/employee_1.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  
                  Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          child: Card(
                            child: Row(children: [
                              Icon(Icons.person_3_rounded),
                              Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 10),
                                    child: !isEditableName
                                        ? Text('Họ và tên: ' +name, style: TextStyle(fontSize: 20),)
                                        : TextFormField(
                                            style: TextStyle(fontSize: 20),
                                            initialValue: name,
                                            focusNode: FocusNode(),
                                            textInputAction: TextInputAction.done,
                                            onFieldSubmitted: (value) {
                                              setState(() => {isEditableName = false, name = value});
                                            }),
                                  )),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isEditableName = true,
                                      });
                                },
                              )
                            ])
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Card(
                            child: Row(children: [
                              Icon(Icons.code),
                              Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 10),
                                    child: !isEditableId
                                        ? Text('Mã nhân viên: ' +employId, style: TextStyle(fontSize: 20),)
                                        : TextFormField(
                                            style: TextStyle(fontSize: 20),
                                            initialValue: employId,
                                            focusNode: FocusNode(),
                                            textInputAction: TextInputAction.done,
                                            onFieldSubmitted: (value) {
                                              setState(() => {isEditableId = false, employId = value});
                                            }),
                                  )),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isEditableId = true,
                                      });
                                },
                              )
                            ])
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Card(
                            child: Row(children: [
                              Icon(Icons.calendar_month_rounded),
                              Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 10),
                                    child: !isEditableDate
                                        ? Text('Ngày Sinh: ' +date, style: TextStyle(fontSize: 20),)
                                        : TextFormField(
                                            style: TextStyle(fontSize: 20),
                                            initialValue: date,
                                            focusNode: FocusNode(),
                                            textInputAction: TextInputAction.done,
                                            onFieldSubmitted: (value) {
                                              setState(() => {isEditableDate = false, date = value});
                                            }),
                                  )),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isEditableDate = true,
                                      });
                                },
                              )
                            ])
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Card(
                            child: Row(children: [
                              Icon(Icons.people_rounded),
                              Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 10),
                                    child: !isEditablePosi
                                        ? Text('Chức Vụ: ' +Posi, style: TextStyle(fontSize: 20),)
                                        : TextFormField(
                                            style: TextStyle(fontSize: 20),
                                            initialValue: Posi,
                                            focusNode: FocusNode(),
                                            textInputAction: TextInputAction.done,
                                            onFieldSubmitted: (value) {
                                              setState(() => {isEditablePosi = false, Posi = value});
                                            }),
                                  )),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() => {
                                        isEditablePosi = true,
                                      });
                                },
                              )
                            ])
                          ),
                        ),
                      //   ElevatedButton(
                      //     onPressed: (){
                      //       setState(() {
                      //         isEditable = true;
                      //       });
                      //     },
                      //     child: isEditable?
                      //           Text("Done")
                      //           : Text("Edit")
                      //   )
                      
                      ],
                    ),
                  ),
                  Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.4,
                              child: ElevatedButton(
                                onPressed: (){}, 
                                child: Text('Edit', style: TextStyle(fontSize: 20),)),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.4,
                              child: ElevatedButton(
                                onPressed: (){}, 
                                child: Text('Delete', style: TextStyle(fontSize: 20),)),
                            )
                          ],
                        ),
                      )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

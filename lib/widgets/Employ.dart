import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:home/widgets/EmployInfor.dart';
import 'package:intl/intl.dart';
import '/widgets/NhanVien.dart';
import '/widgets/FormAddEmploy.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {


  List<NhanVien> danhSachNhanVien = [
    NhanVien(
      ma: '123456',
      hoVaTen: "Nguyen Van A",
      ngaySinh: "20/10/2002", 
      chucVu: "Ke Toan",
    ),
    NhanVien(
      ma: '654321', 
      hoVaTen: "Nguyen Van B", 
      ngaySinh: "30/1/2003", 
      chucVu: "Thu ky")
  ];
  

  addNhanVien(String ma, String hoVaTen, String ngaySinh ,String chucVu){
    final newNhanVien = NhanVien(
      ma: ma, 
      hoVaTen: hoVaTen, 
      ngaySinh: ngaySinh, 
      chucVu: chucVu);

      setState(() {
        danhSachNhanVien.add(newNhanVien);
      });
  }

  formAddNhanVien(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: FormNhapNhanVien(addNhanVien),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }


  // formEditNhanVien(BuildContext context){
  //   showModalBottomSheet(
  //     context: context, 
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () => EditProfile(),
  //         behavior: HitTestBehavior.opaque,
          
  //       );
  //     });
  // }

  xoaNhanVien(String ma){
    setState(() {
      danhSachNhanVien.removeWhere((element) => element.ma == ma);
    });
  }

  String textTen ="";
  String maMoi = "";
  String TextChucVu = "Trưởng phòng";
  final TextNgay = TextEditingController();

  onSubmit(){
    final textNgaySinh = TextNgay.text;
  }

  final danhSachChucVu = ['Trưởng phòng', 'Kế toán', 'Thư ký', 'Quản lý'];

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Employee"),
        backgroundColor: Colors.blue
      ),
    body: SingleChildScrollView(
      child: Column(
          children: danhSachNhanVien.map((nv) {
        return Card(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => EmployInfor()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nv.ma.toString() + ' - ' + nv.hoVaTen,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "Ngày sinh: " + nv.ngaySinh,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15
                              ),
                            ),
                            Text(
                              "Chức vụ: " + nv.chucVu.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed:  () {
                                showDialog(
                                  context: context, 
                                  builder: (context) => SimpleDialog(
                                    children: [
                                      Visibility(
                                        visible: true,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(
                                                  icon: Icon(Icons.person_3_rounded),
                                                  labelText: "Họ và tên"
                                                ),
                                                onChanged:  (value) async{
                                                  setState(() {
                                                    textTen = value;
                                                  });
                                                },
                                              ),
                                        TextField(
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.code_rounded),
                                            labelText: 'Mã nhân viên'
                                          ),
                                          onChanged: (value){
                                            setState(() {
                                              maMoi = value;
                                            });
                                          } ,
                                        ),
                                        
                                        TextField(
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.calendar_today_rounded),
                                              labelText: 'Ngày sinh'
                                            ),
                                            controller: TextNgay,
                                            onSubmitted: onSubmit(),
                                            onTap: () async{
                                              DateTime? pickeddate = await showDatePicker(
                                                context: context, 
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900), 
                                                lastDate: DateTime(2110));
                                        
                                                TextNgay.text = DateFormat('dd/MM/yyyy').format(pickeddate!);
                                            },
                                            onChanged: (value){
                                              setState(() {
                                                TextNgay.text = value;
                                              });
                                            },
                                          ),
                                          DropdownButtonFormField(
                                            padding: EdgeInsets.only(bottom: 20),
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.people_alt_rounded),
                                              labelText: 'Chức vụ'
                                            ),
                                            value: TextChucVu,
                                            items: danhSachChucVu.map(
                                              (e) => DropdownMenuItem(
                                                child: Text(e),
                                                value: e,
                                              )
                                              ).toList(),
                                              onChanged: (val){
                                                setState(() {
                                                  TextChucVu = val!;
                                                });
                                              },
                                          ),
                                        
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: ElevatedButton(
                                            child: Text("Submit"),
                                            onPressed: ()  {
                                              setState(() {
                                                if((maMoi != null) && 
                                                  (textTen.length != null) && 
                                                  (TextNgay != null) && 
                                                  (TextChucVu != null)){
                                                    nv.hoVaTen = textTen;
                                                    nv.ma = maMoi;
                                                    nv.ngaySinh = TextNgay.text;
                                                    nv.chucVu = TextChucVu;
                                                  }
                                              });
                                              setState(() {
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        )
                                            ],
                                          ),
                                        ),
                                      )
                                      
                                    ],
                                  ));
                              }, 
                              icon: Icon(Icons.edit)
                              ),
                            InkWell(
                              onTap: () async{
                                if(await confirm(context)){
                                  xoaNhanVien(nv.ma);
                                }
                                return;
                              },
                              child: Icon(Icons.delete),
                            )
                          ],
                        ),
                      )
                    ],
                
                  )
                ),
              ),
            ],
          ),
        );
      }).toList(),
        ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat ,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => formAddNhanVien(context),
    ),
    );
  }
}
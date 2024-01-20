import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormNhapNhanVien extends StatefulWidget {

  final Function addNhanVien;


  FormNhapNhanVien(this.addNhanVien);

  @override
  State<FormNhapNhanVien> createState() => _FormNhapNhanVienState();
}

class _FormNhapNhanVienState extends State<FormNhapNhanVien> {

  _FormNhapNhanVienState(){
    selected = danhSachChucVu[0];
  }

  final maController = TextEditingController();

  final hoVaTenController = TextEditingController();

  final NgaySinhController = TextEditingController();

  final chucVuController = TextEditingController();

  final danhSachChucVu = ['Trưởng phòng', 'Kế toán', 'Thư ký', 'Quản lý'];
  String? selected = "Truong phong";

  

  submitData(){
    final enterMaController = maController.text;
    final enterHoVaTenController = hoVaTenController.text;
    final enterNgaySinhController = NgaySinhController.text;
    final enterChucVuController = selected;

    if((enterMaController != null) && 
        (enterHoVaTenController.length > 3) && 
        (enterNgaySinhController != null) && 
        (selected != null))
          widget.addNhanVien(
            enterMaController,
            enterHoVaTenController,
            enterNgaySinhController, 
            enterChucVuController,
          );
    else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person_3_rounded),
                labelText: 'Họ và tên',
              ),
              controller: hoVaTenController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mã nhân viên',
                icon: Icon(Icons.code_rounded)
              ),
              controller: maController,
              onSubmitted: (_) => submitData() ,
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today_rounded),
                labelText: 'Ngày sinh'
              ),
              controller: NgaySinhController,
              onSubmitted: (_) => submitData(),
              onTap: () async{
                DateTime? pickeddate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900), 
                  lastDate: DateTime(2110));

                  if(pickeddate != null){
                    NgaySinhController.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                  }
              },
            ),
            DropdownButtonFormField(
              padding: EdgeInsets.only(bottom: 20),
              decoration: InputDecoration(
                icon: Icon(Icons.people_alt_rounded),
                labelText: 'Chức vụ'
              ),
              value: selected,
              items: danhSachChucVu.map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                )
                ).toList(),
                onChanged: (val){
                  setState(() {
                    selected = val as String;
                    
                  });
                },
            ),
            ElevatedButton(
              onPressed: () => submitData(),
              child: Text('Add')),
          ],
        ),
      ),
    );
  }
}
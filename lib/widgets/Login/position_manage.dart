import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/theme_manager.dart';

class Department {
  String name;
  List<String> positions;

  Department(this.name, this.positions);
}

class PositionManage extends StatefulWidget {
  @override
  State<PositionManage> createState() => _MyAppState();
}

class _MyAppState extends State<PositionManage> {
  final List<Department> departments = [
    Department("Nhân sự", ["Nhân viên nhân sự", "Quản lý nhân sự"]),
    Department("Kế toán", ["Kế toán viên", "Kế toán trưởng"]),
    Department("Marketing", ["Chuyên viên quảng cáo", "Trưởng phòng marketing"]),
    Department("Kinh doanh (Sales)", ["Nhân viên kinh doanh", "Quản lý kinh doanh"]),
    Department("IT", ["Lập trình viên", "Quản lý hệ thống"]),
    Department("Tài chính", ["Kế toán tài chính", "Giám đốc tài chính"]),
    // Thêm các phòng ban khác và chức vụ tương ứng ở đây
  ];

  final List<Color?> cardColors = [
    Colors.blue[100],
    Colors.green[100],
    Colors.cyan[100],
    Colors.orange[100],
    Colors.purple[100],
    Colors.red[100],
  ];

  final List<MaterialColor> departmentColors = [
    Colors.blue,
    Colors.green,
    Colors.cyan,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  TextEditingController _positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quản lý Chức vụ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 3,
              // color: cardColors[index % cardColors.length],
              child: ExpansionTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: departmentColors[index % departmentColors.length],
                    shape: BoxShape.circle,
                  ),
                  child: _getDepartmentIcon(departments[index].name),
                ),
                title: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    departments[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.black,
                      // color: departmentColors[index % departmentColors.length],
                      fontSize: 18,
                    ),
                  ),
                ),
                children: [
                  Column(
                    children: departments[index].positions
                        .map((position) => ListTile(
                      title: Text(position),
                      trailing: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          // color: departmentColors[index % departmentColors.length].shade700,
                          onPressed: () {
                            _deletePosition(index, position);
                          },
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: departmentColors[index % departmentColors.length],
                      ),
                      onPressed: () {
                        _showAddPositionDialog(context, index);
                      },
                      child: Text(
                        'Thêm Chức vụ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getDepartmentIcon(String departmentName) {
    switch (departmentName) {
      case "Nhân sự":
        return Image.asset('assets/images/human-resources.png');
      case "Kế toán":
        return Image.asset('assets/images/bank.png');
      case "Marketing":
        return Image.asset('assets/images/social-media.png');
      case "Kinh doanh (Sales)":
        return Image.asset('assets/images/coupon.png');
      case "IT":
        return Image.asset('assets/images/it.png');
      case "Tài chính":
        return Image.asset('assets/images/budget.png');
      default:
        return Image.asset('assets/images/human-resources.png');
    }
  }

  Future<void> _showAddPositionDialog(BuildContext context, int departmentIndex) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Thêm Chức vụ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: _positionController,
            decoration: InputDecoration(labelText: 'Tên Chức vụ'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Xong'),
              onPressed: () {
                _addPosition(departmentIndex, _positionController.text);
                _positionController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addPosition(int departmentIndex, String position) {
    setState(() {
      departments[departmentIndex].positions.add(position);
    });
  }

  void _deletePosition(int departmentIndex, String position) {
    setState(() {
      departments[departmentIndex].positions.remove(position);
    });
  }
}
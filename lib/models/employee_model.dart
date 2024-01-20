// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmployeeModel {
  final String name;
  final int id;
  final String position;
  final int room;
  final String profile;
  EmployeeModel({
    required this.name,
    required this.id,
    required this.position,
    required this.room,
    required this.profile,
  });
}

final List<EmployeeModel> nearbyEmployee = [
  EmployeeModel(
    name: "Nguyễn Thị Vy",
    id: 21012479,
    position: "Kế toán",
    room: 01,
    profile: "assets/images/employee_1.png",
  ),
  EmployeeModel(
    name: "Nguyễn Ngọc Ánh",
    id: 21012480,
    position: "Kiểm toán",
    room: 03,
    profile: "assets/images/employee_2.png",
  ),
  EmployeeModel(
    name: "Hoàng Ngọc Huyền",
    id: 21012481,
    position: "Ca sĩ",
    room: 07,
    profile: "assets/images/employee_3.png",
  ),
  EmployeeModel(
    name: "Lê Trà My",
    id: 21012482,
    position: "Dance",
    room: 05,
    profile: "assets/images/employee_4.png",
  ),
  EmployeeModel(
    name: "Hoàng Thị Trang",
    id: 21012483,
    position: "Dance",
    room: 05,
    profile: "assets/images/employee_5.png",
  ),
  EmployeeModel(
    name: "Nguyễn Linh Anh",
    id: 21012484,
    position: "Ca sĩ",
    room: 07,
    profile: "assets/images/employee_3.png",
  ),
];

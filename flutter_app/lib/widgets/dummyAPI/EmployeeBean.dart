class EmployeeBean {
  final String name;
  final int id;
  final double Salary;
  final int age;

  EmployeeBean(this.id, this.name, this.Salary, this.age);

  factory EmployeeBean.fromJson(Map<String, dynamic> list) {
    String name = list[""];
    int id = list[""] as int;
    double Salary = list[""] as double;
    int age;
    return EmployeeBean(id, name, Salary, age);
  }
}

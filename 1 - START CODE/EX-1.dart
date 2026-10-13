enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String? street;
  final String? city;
  final double? zipCode;

  Address({this.street, this.city, this.zipCode});
}

class Employee {
  final String _name;
  final double _baseSalary;

  //Q1 new attirubute
  final List<Skill> _skills;

  final Address _address;

  final int _yearsOfExperience;

  //Q2  update constructor use Named constructor

  Employee(
    this._name,
    this._baseSalary,
    this._address,
    this._skills,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper({
    required this._name,
    required this._baseSalary,
    required this._address,
    required this._yearsOfExperience,
  }) : this._skills = [Skill.FLUTTER, Skill.DART];

  //Q4 compute salary

  double computeSalary() {
    double total = _baseSalary;

    total += (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          total += 5000;
          break;
        case Skill.DART:
          total += 3000;
          break;
        case Skill.OTHER:
          total += 1000;
          break;
      }
    }

    return total;
  }

  void printDetails() {
    print(
      'Employee: $_name, Base Salary: \$${_baseSalary}, Total Salary: ${computeSalary()}',
    );
  }

  String get name => _name;
  double get baseSalary => _baseSalary;

  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsofExperience => _yearsOfExperience;
}

void main() {
  var add1 = Address(street: "st202003", city: "PP", zipCode: 122000);

  var emp1 = Employee('Sokea', 40000, add1, [Skill.FLUTTER], 1);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, add1, [Skill.OTHER], 7);
  emp2.printDetails();

  var dev = Employee.mobileDeveloper(
    name: "Nhom Dina",
    baseSalary: 40000,
    address: add1,
    yearsOfExperience: 3,
  );

  dev.printDetails();
}

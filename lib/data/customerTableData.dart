class Customer {
  final int id;
  final String name;
  final int age;
  final bool paidStatus;

  Customer(
      {required this.id,
      required this.name,
      required this.age,
      required this.paidStatus});
}

List<Customer> customers = [
  Customer(id: 1, name: 'Alice', age: 28, paidStatus: true),
  Customer(id: 2, name: 'Bob', age: 35, paidStatus: false),
  Customer(id: 3, name: 'Carol', age: 42, paidStatus: true),
  Customer(id: 4, name: 'Dave', age: 21, paidStatus: false),
  Customer(id: 5, name: 'Eve', age: 19, paidStatus: true),
  Customer(id: 6, name: 'Frank', age: 44, paidStatus: false),
  Customer(id: 7, name: 'Grace', age: 39, paidStatus: true),
  Customer(id: 8, name: 'Heidi', age: 25, paidStatus: false),
  Customer(id: 9, name: 'Ivan', age: 36, paidStatus: true),
  Customer(id: 10, name: 'Judy', age: 32, paidStatus: false),
  // Add more customers as needed
];

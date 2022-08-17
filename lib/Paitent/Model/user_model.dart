class User {
  String name;
  String email;
  String image;
  int age;
  String sex;
  String userId;
  String phNum;
  List<String> apptlist;
  List<String> preslist;

  User(
    this.name,
    this.email,
    this.image,
    this.age,
    this.sex,
    this.userId,
    this.phNum,
    this.apptlist,
    this.preslist,
  );
  static List<User> Userlist = [
    User(
      "Deepak Saini",
      "Deepak@test.com",
      "assets/images/profile.png",
      22,
      "Male",
      "P001",
      '9876543210',
      ['A001'],
      ['P001'],
    ),
  ];
}

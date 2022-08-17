class User {
  String name;
  String image;
  int age;
  String sex;
  String userId;
  String phNum;
  List<String> apptlist;
  List<String> preslist;

  User(
    this.name,
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

class User {
  String name;
  String email;
  String image;
  String age;
  String sex;
  String userId;
  String phNum;
  
  User(
    this.name,
    this.email,
    this.image,
    this.age,
    this.sex,
    this.userId,
    this.phNum,
  );
  static List<User> Userlist = [
    User(
      "Deepak Saini",
      "Deepak@test.com",
      "assets/images/profile.png",
      "22",
      "Male",
      "P001",
      '9876543210',
    ),
  ];
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import '../common/auth_controller.dart';

// final AuthController controller = Get.put(AuthController());

// class LoginScreen extends StatelessWidget {
//   static final routeName = "/login";
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() => controller.isloading.value == true
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SafeArea(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
//                 width: context.width,
//                 height: context.height,
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: controller.loginFormKey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     child: Column(
//                       children: [
//                         DropdownButton<String>(
//                           value: controller.dropdownValue.value,
//                           icon: const Icon(Icons.arrow_downward),
//                           elevation: 16,
//                           style: const TextStyle(color: Colors.deepPurple),
//                           underline: Container(
//                             height: 2,
//                             color: Colors.deepPurpleAccent,
//                           ),
//                           onChanged: (String? newValue) {
//                             controller.dropdownValue.value = newValue!;
//                           },
//                           items: <String>["Admin", "Doctor", "Patient"]
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Login Page",
//                           style: TextStyle(fontSize: 20, color: Colors.black87),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             labelText: "Email",
//                             prefixIcon: Icon(Icons.email),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           controller: controller.emailController,
//                           onSaved: (value) {
//                             controller.email = value!;
//                           },
//                           validator: (value) {
//                             return controller.validateEmail(value!);
//                           },
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             labelText: "Password",
//                             prefixIcon: Icon(Icons.lock),
//                           ),
//                           keyboardType: TextInputType.visiblePassword,
//                           obscureText: true,
//                           controller: controller.passwordController,
//                           onSaved: (value) {
//                             controller.password = value!;
//                           },
//                           validator: (value) {
//                             return controller.validatePassword(value!);
//                           },
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         ConstrainedBox(
//                           constraints:
//                               BoxConstraints.tightFor(width: context.width),
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               backgroundColor: MaterialStateProperty.all(
//                                   Colors.deepPurpleAccent),
//                               padding:
//                                   MaterialStateProperty.all(EdgeInsets.all(14)),
//                             ),
//                             child: const Text(
//                               "Login",
//                               style:
//                                   TextStyle(fontSize: 14, color: Colors.white),
//                             ),
//                             onPressed: () {
//                               controller.checkLogin();
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Get.toNamed("/signup");
//                           },
//                           child: const Text("SignUp"),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )),
//     );
//   }
// }
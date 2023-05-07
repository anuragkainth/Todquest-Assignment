import 'package:todquest_assignment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todquest_assignment/screens/user_list_page.dart';
import 'package:todquest_assignment/screens/user_list_page.dart';
import 'package:todquest_assignment/utilities/auth_button.dart';
import 'package:todquest_assignment/database/user_model.dart';
import 'package:todquest_assignment/database/user_repository.dart';
import 'package:get/get.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  bool isChecked = true;
  bool isDisabled = false;

  bool? valueFirst = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();


  String _selectedItem = 'Facebook';


  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0D2C44),
        ),
        body: SafeArea(
          child: Container(
            color: Color(0xff0D2C44),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 3 / 4,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full name',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.of(context).size.width /
                                            25,
                                      )),
                                ),
                                TextFormField(
                                  controller: userNameController,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white70,
                                      )),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your name',
                                    hintStyle: GoogleFonts.poppins(
                                        textStyle:
                                        TextStyle(color: Colors.white24)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white70),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white70),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.of(context).size.width /
                                            25,
                                      )),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white70,
                                      )),
                                  decoration: InputDecoration(
                                    hintText: 'abc@gmail.com',
                                    hintStyle: GoogleFonts.poppins(
                                        textStyle:
                                        TextStyle(color: Colors.white24)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white70),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white70),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Where are you coming from ?',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        MediaQuery.of(context).size.width /
                                            25,
                                      )),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.width / 7,
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedItem,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedItem = value!;
                                      });
                                    },
                                    items: <String>['Facebook', 'Instagram', 'Organic', 'Friend', 'Google']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white), // Set text color to black
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white70, // Set the underline color to white70
                                          width: 1
                                        ),
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 1 / 8,
                    width: double.infinity,
                    color: kDefaultGreyColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            textColor: kDefaultBlueColor,
                            onPressed: signIn,
                            text: 'Add User',
                            color: Colors.white,
                            overlayColor: kDefaultGreyColor,
                          ),
                        ),
                        Expanded(
                          child: AuthButton(
                            textColor: kDefaultBlueColor,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const UserListPage()),
                              );
                            },
                            text: 'Skip',
                            color: Colors.white,
                            overlayColor: kDefaultGreyColor,
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future signIn() async {


    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ));

    try {

        final user = UserModel(
            fullName: userNameController.text.trim(),
            arival: _selectedItem,
            email: emailController.text.trim()
        );

        final userRepo = Get.put(UserRepository());
        await userRepo.createUser(user);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserListPage()),
        );

    } catch (e) {
      print(e);

      Navigator.pop(context);
    }
  }
}

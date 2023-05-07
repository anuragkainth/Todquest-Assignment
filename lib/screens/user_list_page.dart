import 'package:todquest_assignment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todquest_assignment/utilities/auth_button.dart';
import 'package:todquest_assignment/utilities/list_card.dart';
import 'package:get/get.dart';
import 'package:todquest_assignment/database/user_model.dart';
import 'package:todquest_assignment/database/profile_controller.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {


  final emailNameController = TextEditingController();

  String _selectedItem = 'None';

  final controller = Get.put(ProfileController());

  @override
  void dispose() {
    emailNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users',style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize:
                MediaQuery.of(context).size.width /
                    25,
                fontWeight: FontWeight.w500)), ),
        backgroundColor: kDefaultBlueColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kDefaultBlueColor,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Search User',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        fontWeight: FontWeight.w500)),
                              ),
                              TextFormField(
                                controller: emailNameController,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Colors.white70,
                                )),
                                decoration: InputDecoration(
                                  hintText: 'Enter User name or email',
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Filter here',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        fontWeight: FontWeight.w500)),
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
                                    items: <String>[
                                      'None',
                                      'Facebook',
                                      'Instagram',
                                      'Organic',
                                      'Friend',
                                      'Google'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Colors
                                                  .white), // Set text color to black
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors
                                                .white70, // Set the underline color to white70
                                            width: 1),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'Users:',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25,
                                      fontWeight: FontWeight.w500)),
                            )),
                        FutureBuilder<List<UserModel>>(
                          future: controller.getAllUser(),
                          builder: (context,snapshot){
                            if(snapshot.connectionState == ConnectionState.done){
                              if(snapshot.hasData) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.width * 4/5 + 60,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                      itemBuilder: (c, index){

                                      if(emailNameController.text.trim() == '' && _selectedItem == 'None'){
                                        return
                                          ListCard(
                                            name: snapshot.data![index].fullName,
                                            email: snapshot.data![index].email,
                                            arrival: snapshot.data![index].arival,
                                          );
                                      } else if((emailNameController.text.trim() == snapshot.data![index].fullName || emailNameController.text.trim() == snapshot.data![index].email) && _selectedItem == 'None'){
                                        return
                                          ListCard(
                                            name: snapshot.data![index].fullName,
                                            email: snapshot.data![index].email,
                                            arrival: snapshot.data![index].arival,
                                          );
                                      }else if(emailNameController.text.trim() == '' && _selectedItem == snapshot.data![index].arival){
                                        return
                                          ListCard(
                                            name: snapshot.data![index].fullName,
                                            email: snapshot.data![index].email,
                                            arrival: snapshot.data![index].arival,
                                          );
                                      }
                                      else if((emailNameController.text.trim() == snapshot.data![index].fullName || emailNameController.text.trim() == snapshot.data![index].email) && _selectedItem == snapshot.data![index].arival){
                                        return
                                          ListCard(
                                            name: snapshot.data![index].fullName,
                                            email: snapshot.data![index].email,
                                            arrival: snapshot.data![index].arival,
                                          );
                                      }
                                      return Container();
                                    }
                                  ),
                                );
                              } else if(snapshot.hasError){

                                return Center(child: Text(snapshot.error.toString()));
                              } else {
                                return const Center(child: Text('Something went wrong'));
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        )
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Add User',
                          color: Colors.white,
                          overlayColor: kDefaultGreyColor,
                        ),
                      ),
                      Expanded(
                        child: AuthButton(
                          textColor: kDefaultBlueColor,
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          text: 'Exit',
                          color: Colors.white,
                          overlayColor: kDefaultGreyColor,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
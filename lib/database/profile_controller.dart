import 'package:get/get.dart';
import 'package:todquest_assignment/database/user_model.dart';
import 'package:todquest_assignment/database/user_repository.dart';

class ProfileController extends GetxController{

  static ProfileController get instance => Get.find();


  // Repository

  final _userRepo = Get.put(UserRepository());

  // GET USER EMAIL AND PASSWORD TO  USER REPOSITORY TO FETCH RECORD FROM DATABASE

  // getUserData() {

    // final String? email =  FirebaseAuth.instance.currentUser?.email;

  //   if(email != null){
  //
  //     return _userRepo.getUserDetails(email);
  //
  //   } else {
  //
  //     Get.snackbar("Error", "Login to Continue");
  //   }
  //
  // }

  Future<List<UserModel>> getAllUser() async {

    return await _userRepo.allUsers();
  }


  updateRecord(UserModel user) async {

    await _userRepo.updateUserRecord(user);
  }

}
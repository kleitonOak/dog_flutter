import 'package:dog_source/model/LoginModel.dart';
import 'package:dog_source/repository/LoginRepository.dart';
import 'package:dog_source/util/SharedPreferences.dart';
import 'package:uuid/uuid.dart';

class LoginService{
    Future<LoginModel> getAccess(String user, String password) async{
      var repository = LoginRepository();
      LoginModel loginModel = await repository.getAccess(user, password);
      var uuid = new Uuid();
      SharedPreferences.saveToken(uuid.v4());
      
      return loginModel;
    }
}
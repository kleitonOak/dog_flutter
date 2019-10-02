import 'package:dog_source/model/LoginModel.dart';
import 'package:dog_source/repository/LoginRepository.dart';

class LoginService{
    Future<LoginModel> getAccess(String user, String password) async{
      var repository = LoginRepository();
      LoginModel loginModel = await repository.getAccess(user, password);

      return loginModel;
    }
}
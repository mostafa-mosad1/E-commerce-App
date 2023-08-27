
import 'package:shop_app/pages/auth/model/RegisterModel.dart';

import '../model/LogInModel.dart';

abstract class shopStates{}

class shopInitialStates extends shopStates{}

class shopLoadinglogIn extends shopStates{}
class shopScuesslogIn extends shopStates{
  final LogInModel logInModel;
  shopScuesslogIn(this.logInModel);
}
class shopErroelogIns extends shopStates{
  String error;

  shopErroelogIns(this.error,);
}



class shopLoadingRegister extends shopStates{}
class shopScuessRegister extends shopStates{
  final RegisterModel registerModel;
  shopScuessRegister(this.registerModel);
}
class shopErrorRegister extends shopStates{
  String error;

  shopErrorRegister(this.error,);
}

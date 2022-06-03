import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/data/network/api_exception.dart';

enum AccountLoginStatus { error, loggedIn, notLoggedIn, loading, empty }

class AccountLoginStatusController extends GetxController {
  AccountLoginStatus accountLoginStatus = AccountLoginStatus.loading;

  void getAccountStatus(StatefullData accountResponse) async {
    final status = accountResponse.status;
    AccountLoginStatus updateLoginStatus;
    switch (status) {
      case Status.completed:
        updateLoginStatus = AccountLoginStatus.loggedIn;
        break;
      case Status.loading:
        updateLoginStatus = AccountLoginStatus.loading;
        break;
      case Status.error:
        if (accountResponse.error is UnauthorisedException) {
          updateLoginStatus = AccountLoginStatus.notLoggedIn;
        } else {
          updateLoginStatus = AccountLoginStatus.error;
        }
        break;
      default:
        updateLoginStatus = AccountLoginStatus.empty;
        break;
    }
    if (accountLoginStatus != updateLoginStatus) {
      accountLoginStatus = updateLoginStatus;
    }
    update();
  }
}

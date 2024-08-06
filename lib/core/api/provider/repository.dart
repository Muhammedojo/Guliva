import '../../data/model/login.dart';
import 'api_provider.dart';

class AppRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Login> login(String username, String password) async =>
      _apiProvider.login(username, password);
}

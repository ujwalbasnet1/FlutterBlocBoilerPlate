import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:user_bloc/models/models.dart';

class UserApiClient {
  final String userBaseUrl = 'https://jsonplaceholder.typicode.com/users';
  final http.Client httpClient;

  UserApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<User>> getUserList() async {
    final userListResponse = await this.httpClient.get(userBaseUrl);

    if (userListResponse.statusCode != 200) {
      throw Exception('error getting user list from api');
    }

    return User.fromJson(userListResponse.body);
  }
}

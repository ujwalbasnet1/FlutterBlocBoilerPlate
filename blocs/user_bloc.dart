import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:user_bloc/blocs/bloc.dart';
import 'package:user_bloc/repositories/user_api_client.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient;
  UserApiClient _userApiClient;

  UserBloc({@required this.httpClient}) {
    this._userApiClient = UserApiClient(httpClient: httpClient);
  }

  @override
  UserState get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUsers) {
      yield UserUninitialized();
      try {
        final users = await _userApiClient.getUserList();
        yield UserLoaded(userList: users);
      } catch (_) {
        yield UserError();
      }
    }
  }
}

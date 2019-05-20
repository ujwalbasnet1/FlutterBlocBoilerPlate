export 'user_state.dart';
export 'user_event.dart';
// export 'user_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:user_bloc/blocs/user_bloc.dart';

UserBloc userBloc = UserBloc(httpClient: http.Client());

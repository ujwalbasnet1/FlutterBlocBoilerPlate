import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc/blocs/bloc.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: userBloc,
      builder: (BuildContext context, UserState userState) {
        if (userState is UserError) {
          return Center(child: Text(userState.toString()));
        } else if (userState is UserUninitialized) {
          return Center(child: CircularProgressIndicator());
        } else if (userState is UserLoaded) {
          return Text(userState.userList[0].email.toString());
        }
      },
    );
  }
}

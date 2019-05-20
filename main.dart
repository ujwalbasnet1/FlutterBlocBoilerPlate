import 'package:flutter/material.dart';
import 'package:user_bloc/test.dart';
import 'blocs/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    userBloc.dispatch(FetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => NewPage()));
      },
      child: BlocBuilder(
        bloc: userBloc,
        builder: (BuildContext context, UserState userState) {
          if (userState is UserError) {
            return Center(child: Text(userState.toString()));
          } else if (userState is UserUninitialized) {
            return Center(child: CircularProgressIndicator());
          } else if (userState is UserLoaded) {
            return ListView.builder(
              itemCount: userState.userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(userState.userList[index].email.toString());
              },
            );
          }
        },
      ),
    );
  }
}

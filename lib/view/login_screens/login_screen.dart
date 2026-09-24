import 'package:bloc_demo_app/bloc/login/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginStates>(
                buildWhen: (previous, current) => current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your eamil-id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                    ),
                    focusNode: emailFocusNode,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailButton(email: value));
                    },
                    onFieldSubmitted: (value) {

                    },
                  );
                },
              ),
              const SizedBox(height: 10,),
              BlocBuilder<LoginBloc, LoginStates>(
                buildWhen: (previous, current) => current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                    ),
                    focusNode: passwordFocusNode,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordButton(password: value));
                    },
                    onFieldSubmitted: (value) {

                    },
                  );
                },
              ),
              const SizedBox(height: 20,),
              BlocListener<LoginBloc, LoginStates>(
                listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
                listener: (BuildContext context, LoginStates state) {
                  if(state.loginStatus == LoginStatus.error){
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text(state.message.toString()))
                        );
                  }

                  if(state.loginStatus == LoginStatus.loading){
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString()))
                      );
                  }

                  if(state.loginStatus == LoginStatus.success){
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString()))
                      );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginStates>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return  ElevatedButton(onPressed: () {
                      context.read<LoginBloc>().add(LoginEventApi());
                    }, child: Text('Login',
                      style: TextStyle(
                          color: Colors.cyanAccent
                      ),
                    ),);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

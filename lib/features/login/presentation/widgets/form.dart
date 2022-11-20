import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants.dart';
import '../../../main_page/presentation/pages/main_page.dart';
import '../../domain/entities/login_model.dart';
import '../bloc/login_bloc.dart';
import 'login_button.dart';



class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginData loginData = LoginData();
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth / 1.25;
    final formKey = GlobalKey<FormState>();
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: textFieldWidth,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is ErrorState) {
                      return const Text(
                        'Email or password invalid',
                        style: TextStyle(
                            fontSize: 16, color: Colors.redAccent),
                      );
                    } else if (state is ValidState) {
                      return const Text(
                        '',
                        style: TextStyle(
                            fontSize: 16, color: Colors.redAccent),
                      );
                    } else {
                      return const Text(
                        '',
                        style: TextStyle(
                            fontSize: 16, color: Colors.redAccent),
                      );
                    }
                  },
                )),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {},
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.person),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(errorText: 'Email invalid'),
                ]),
                onChanged: (value) {
                  context.read<LoginBloc>().add(ErrorTextShowoffEvent());
                  loginData.email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {},
                child: TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.key),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(ErrorTextShowoffEvent());
                    loginData.password = value;
                  },
                ),
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginAgentState) {
                  // ignore: unrelated_type_equality_checks
                  if (state.isLogged == true) {
                    Navigator.pushNamed(context, MainPage.id);
                  } else {
                    context.read<LoginBloc>().add(ErrorTextShowEvent());
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: LoginButton(onPressed: () {
                  context.read<LoginBloc>().add(GetAgentData(loginData: loginData));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

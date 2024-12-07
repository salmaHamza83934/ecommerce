import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared_widgets/app_text_form_field.dart';
import '../cubit/login_view_model.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginScreenViewModel>(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            fieldText: 'E-mail',
            hintText: 'Enter Your E-mail',
            controller: BlocProvider.of<LoginScreenViewModel>(context)
                .emailController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your email';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldText: 'Password',
            hintText: 'Enter Your Password',
            isObscure: BlocProvider.of<LoginScreenViewModel>(context)
                .isObscure,
            suffixIcon: InkWell(
              child: BlocProvider.of<LoginScreenViewModel>(context)
                  .isObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onTap: () {
                BlocProvider.of<LoginScreenViewModel>(context)
                    .isObscure =
                !BlocProvider.of<LoginScreenViewModel>(context)
                    .isObscure;
                setState(() {});
              },
            ),
            controller: BlocProvider.of<LoginScreenViewModel>(context)
                .passwordController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

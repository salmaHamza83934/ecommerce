import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared_widgets/app_text_form_field.dart';
import '../cubit/register_view_model.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterScreenViewModel>(context).formKey,
      child: Column(
        children: [
          AppTextFormField(
            fieldText: 'Full Name',
            hintText: 'Enter Your Full Name',
            controller: BlocProvider.of<RegisterScreenViewModel>(context)
                .usernameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldText: 'Mobile Number',
            hintText: 'Enter Your Mobile Number.',
            controller: BlocProvider.of<RegisterScreenViewModel>(context)
                .mobileNumberController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your mobile number';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldText: 'E-mail address',
            hintText: 'Enter Your E-mail Address',
            controller: BlocProvider.of<RegisterScreenViewModel>(context)
                .emailController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your email';
              }
              final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return 'invalid email';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldText: 'Password',
            hintText: 'Enter Your Password',
            isObscure:
                BlocProvider.of<RegisterScreenViewModel>(context).isObscure,
            suffixIcon: InkWell(
              child: BlocProvider.of<RegisterScreenViewModel>(context).isObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onTap: () {
                BlocProvider.of<RegisterScreenViewModel>(context).isObscure =
                    !BlocProvider.of<RegisterScreenViewModel>(context)
                        .isObscure;
                setState(() {});
              },
            ),
            controller: BlocProvider.of<RegisterScreenViewModel>(context)
                .passwordController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your password';
              }
              return null;
            },
          ),
          AppTextFormField(
            fieldText: 'Confirm Password',
            hintText: 'Confirm Your Password',
            isObscure:
                BlocProvider.of<RegisterScreenViewModel>(context).isObscure,
            suffixIcon: InkWell(
              child: BlocProvider.of<RegisterScreenViewModel>(context).isObscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onTap: () {
                BlocProvider.of<RegisterScreenViewModel>(context).isObscure =
                    !BlocProvider.of<RegisterScreenViewModel>(context)
                        .isObscure;
                setState(() {});
              },
            ),
            controller: BlocProvider.of<RegisterScreenViewModel>(context)
                .confirmPasswordController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your confirm password';
              }
              if (BlocProvider.of<RegisterScreenViewModel>(context)
                      .confirmPasswordController
                      .text !=
                  BlocProvider.of<RegisterScreenViewModel>(context)
                      .passwordController
                      .text) {
                return 'Passwords don\'t match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/dialogs/app_dialog.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/utils/validator.dart';
import 'package:ecommerce_elk/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_elk/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        hint: "enter your name",
                        label: "Name",
                        validate: (name) => Validator.validateName(name),
                      ),

                      CustomTextFormField(
                        controller: _emailController,
                        hint: "enter your email",
                        label: "Email",
                        validate: (email) => Validator.validateEmail(email),
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        hint: "enter your password",
                        label: "Password",
                        validate: (password) =>
                            Validator.validatePassword(password),
                      ),

                      CustomTextFormField(
                        controller: _confirmPassController,
                        hint: "enter your password",
                        label: "Confirm Password",
                        validate: (confirmPass) =>
                            Validator.validateConfirmPassword(
                              confirmPass,
                              _passwordController.text,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.registerState is BaseLoadingState) {
                      AppDialogs.showLoadingDialog(context);
                    }
                    if (state.registerState is BaseSuccessState) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                          _emailController.text,
                          _nameController.text,
                        );
                      }
                      return;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Sign up")],
                    ),
                  ),
                ),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () => Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.loginScreen),
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

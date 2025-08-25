import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/dialogs/app_dialog.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
import 'package:ecommerce_elk/core/utils/validator.dart';
import 'package:ecommerce_elk/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_elk/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///! i do this to remove listner from heap memory when screen destriod
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _paswwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
                        controller: _emailController,
                        hint: "enter your email",
                        label: "Email",
                        validate: (email) => Validator.validateEmail(email),
                      ),
                      CustomTextFormField(
                        controller: _paswwordController,
                        hint: "enter your password",
                        label: "Password",
                        validate: (password) =>
                            Validator.validatePassword(password),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.loginState is BaseLoadingState) {
                      AppDialogs.showLoadingDialog(context);
                    } else if (state.loginState is BaseSuccessState) {
                      Navigator.of(context).pop();
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.appSection);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(_emailController.text);
                      }
                      return;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Login")],
                    ),
                  ),
                ),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Dont have an account?"),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed(
                            Routes.registerScreen,
                            arguments: context.read<AuthCubit>(),
                          ),
                      child: Text("SignUp"),
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

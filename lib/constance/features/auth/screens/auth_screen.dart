import 'package:clone/common/widget/custom_button.dart';
import 'package:clone/common/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signUp,
                  activeColor: GlobalVariables.secondaryColor,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(
                      () {
                        _auth = val!;
                      },
                    );
                  },
                ),
              ),
              Form(
                key: _signUpFormKey,
                child: AnimatedContainer(
                  color: GlobalVariables.backgroundColor,
                  height: _auth == Auth.signUp ? 279 : 0,
                  padding: const EdgeInsets.all(8),
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _nameController, hintText: 'Name'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _emailController, hintText: 'Email'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: 'Sign Up', onTap: () {})
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signIn,
                  activeColor: GlobalVariables.secondaryColor,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(
                      () {
                        _auth = val!;
                      },
                    );
                  },
                ),
              ),
                Form(
                  key: _signInFormKey,
                  child: AnimatedContainer(
                    height: _auth == Auth.signIn ? 208 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    color: GlobalVariables.backgroundColor,
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _emailController, hintText: 'Email'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password'),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(text: 'Sign In', onTap: () {})
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

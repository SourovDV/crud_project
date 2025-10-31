import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme_data = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Text("Join With Us", style: theme_data.titleLarge),
                ),
                const SizedBox(height: 24),
                Form(
                  child: Column(
                    key: _formKey,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email"),
                        controller: _emailController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: "First Name"),
                        controller: _firstNameController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Last Name"),
                        controller: _lastNameController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Mobile"),
                        controller: _mobileController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Password"),
                        controller: _passwordController,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don,t have an accound? "),
                    InkWell(
                      onTap: () => context.goNamed(AppRouter.homeScreen),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/utils/app_color.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetPassword extends StatefulWidget {
  SetPassword({super.key});

  @override
  State<SetPassword> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SetPassword> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme_data = Theme.of(context).textTheme;
    return Scaffold(
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 250),
                Center(
                  child: Text("Set Password", style: theme_data.titleLarge),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Confirm Password"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(AppRouter.homePageOne);
                  },
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(height: 70),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don,t have an accound? "),
                    InkWell(
                      onTap: () => context.goNamed(AppRouter.signUpScreen),
                      child: Text(
                        "Sign up",
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
    _passwordController.dispose();
    super.dispose();
  }
}

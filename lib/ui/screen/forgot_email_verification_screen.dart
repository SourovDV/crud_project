import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/utils/app_color.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotEmailVerificationScreen extends StatefulWidget {
  ForgotEmailVerificationScreen({super.key});

  @override
  State<ForgotEmailVerificationScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ForgotEmailVerificationScreen> {

  final TextEditingController _emailController = TextEditingController();
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
                  child: Column(
                    children: [
                      Text("Your Email Address", style: theme_data.titleLarge),
                      Text("A 6 digit verifiaction pin will send your email"),
                    ],
                  )
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an accound? "),
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
    super.dispose();
  }
}

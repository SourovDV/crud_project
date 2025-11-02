import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/weight/app_bar_weight.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<UpdateProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppbarWeight(textThemes: themeData, login: true),
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Text("Update profile", style: themeData.titleLarge),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildContainer(),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _firstNameController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "First Name"),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _lastNameController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Last Name"),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _mobileController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Mobile"),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      const SizedBox(height: 8),
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
                Center(
                  child: InkWell(
                    onTap: () => context.goNamed(AppRouter.forgotScreen),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
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

  Widget _buildContainer() {
    return Container(
      color: Colors.white,
      height: 50,
      child: Row(
        children: [
           Container(
            child: const Center(
              child: Text("Photo", style: TextStyle(color: Colors.white)),
            ),
            decoration:const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            height: 50,
            width: 70,
          ),
          const SizedBox(width: 15),
          Text("No Item Selected"),
        ],
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

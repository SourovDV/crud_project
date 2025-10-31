import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                const SizedBox(height: 100),
                Center(child: Text("Join With Us", style: theme_data.titleLarge)),
                const SizedBox(height: 24),
              Form(child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: "Email")),
                  SizedBox(height: 10,),
                  TextFormField(decoration: InputDecoration(hintText: "First Name")),
                  SizedBox(height: 10,),
                  TextFormField(decoration: InputDecoration(hintText: "Last Name")),
                  SizedBox(height: 10,),
                  TextFormField(decoration: InputDecoration(hintText: "Mobile")),
                  SizedBox(height: 10,),
                  TextFormField(decoration: InputDecoration(hintText: "Password")),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){}, child:Icon(Icons.arrow_circle_right_outlined))
                ],
              )),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don,t have an accound? "),
                    InkWell(
                      onTap: () => context.goNamed(AppRouter.homeScreen),
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
}

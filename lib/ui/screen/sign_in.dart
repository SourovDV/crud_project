import 'package:crud_project/data/models/user_model.dart';
import 'package:crud_project/data/services/network_caller.dart';
import 'package:crud_project/data/utils/url_path.dart';
import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/controller/auth_controller.dart';
import 'package:crud_project/ui/utils/app_color.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:crud_project/ui/weight/snackbar_weight.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loginProgress = false;
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
                  child: Text("Get Started with", style: theme_data.titleLarge),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "Email"),
                        validator: (String ? value){
                          if(value == null || value.isEmpty){
                            return "required email address";
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                        validator: (String ? value){
                          if(value == null || value.isEmpty){
                            return "required Password";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: _loginProgress==false,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                     signInButton();
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
                const SizedBox(height: 70),
                Center(
                  child: InkWell(
                    onTap: ()=>context.goNamed(AppRouter.forgotScreen),
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
                      onTap: (){
                        context.goNamed(AppRouter.signUpScreen);
                      },
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

  void signInButton(){
    if(_formKey.currentState!.validate()){
      _signIn();
    }
  }


  Future<void> _signIn()async{
    _loginProgress = true;
    setState(() {});
    Map<String,dynamic> sendBody ={
      "email":_emailController.text.trim(),
      "password":_passwordController.text,
    };

    NetworkRespons respons =await NetworkCaller.postRespons(url: UrlPath.loginUrl,body: sendBody);
    _loginProgress = false;
    setState(() {});
    if(respons.isSucess){
      String token = respons.responsBody!["token"];
      UserModel userModel = UserModel.formJson(respons.responsBody!["data"]);
      await AuthController.saveData(token, userModel);

      context.goNamed(AppRouter.homePageOne);
    }else{
      showSnackbar(context,respons.errorMessage);
    }

  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

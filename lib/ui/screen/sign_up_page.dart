import 'package:crud_project/data/services/network_caller.dart';
import 'package:crud_project/data/utils/url_path.dart';
import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:crud_project/ui/weight/snackbar_weight.dart';
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
  bool isLoading = false;

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
                    key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "Email"),
                        controller: _emailController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                              return "Email is required";
                          }else if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        decoration: InputDecoration(hintText: "First Name"),
                        controller: _firstNameController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "First name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        decoration: InputDecoration(hintText: "Last Name"),
                        controller: _lastNameController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Last name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        decoration: InputDecoration(hintText: "Mobile"),
                        controller: _mobileController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Mobile number is required";
                          }
                         else if(value.length <8){
                           return "value must provided 8 charcter";
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        decoration: InputDecoration(hintText: "Password"),
                        controller: _passwordController,
                        validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password is required";
                        }
                        return null;
                      },
                      ),
                      SizedBox(height: 30),
                      Visibility(
                        visible: isLoading==false,
                        replacement:Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _regestationButton();
                          },
                          child: Icon(Icons.arrow_circle_right_outlined),
                        ),
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

  void _regestationButton(){

    if (_formKey.currentState!.validate()) {
      _regestationApi();
    }
  }

  Future<void> _regestationApi() async{
    isLoading = true;
    setState(() {});
    final Map<String,dynamic> bodyrespons = {

      "email":_emailController.text.trim(),
      "firstName":_firstNameController.text.trim(),
      "lastName":_lastNameController.text.trim(),
      "mobile":_mobileController.text.trim(),
      "password":_passwordController.text,
      "photo":""

    };
    final NetworkRespons respons = await NetworkCaller.postRespons(url: UrlPath.registerUrl,body: bodyrespons);
    isLoading = false;
    setState(() {});
    if(respons.isSucess){
      _clearTextField();
     showSnackbar(context, "New User Regestation Sucessfull");
    }else{
      showSnackbar(context, respons.errorMessage);
    }
  }


  void _clearTextField(){
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
    _passwordController.clear();
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

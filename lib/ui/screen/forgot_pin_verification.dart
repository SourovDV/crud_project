import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPinVerification extends StatefulWidget {
  ForgotPinVerification({super.key});

  @override
  State<ForgotPinVerification> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ForgotPinVerification> {
  final TextEditingController _pinController = TextEditingController();
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
                      Text("Pin Verification", style: theme_data.titleLarge),
                      Text("A 6 digit verifiaction pin has been send"),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PinCodeTextField(
                        length: 6,
                        appContext: context,
                        keyboardType: TextInputType.number,

                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 55,
                          fieldWidth: 50,

                          activeColor: Colors.green,
                          // Active border
                          selectedColor: Colors.green,
                          // On focus
                          inactiveColor: Colors.red,
                          // Inactive border
                          borderWidth: 2, // Make border visible
                        ),
                        enableActiveFill: false,
                        // Important!
                        onCompleted: (value) {
                          print(value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(AppRouter.setPassword);
                  },
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an accounds? "),
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
    _pinController.dispose();
    super.dispose();
  }
}

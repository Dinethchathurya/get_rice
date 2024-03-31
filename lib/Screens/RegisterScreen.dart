import 'package:flutter/material.dart';
import 'package:get_rice/Screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reenterPasswordController = TextEditingController();

  bool isObscuredTextPassword = true;
  bool isObscuredTextReEnterPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: const Text('Register Screen')),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 130, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your e-mail";
                  }
                  String emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regExp = RegExp(emailRegExp);
                  if (!regExp.hasMatch(value)) {
                    return "Enter a valid e-mail";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                obscureText: isObscuredTextPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(isObscuredTextPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isObscuredTextPassword = !isObscuredTextPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your password";
                  }
                  if (value.length < 8) {
                    return "Password should be a minimum of eight characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: reenterPasswordController,
                obscureText: isObscuredTextReEnterPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Re-Enter Password',
                  hintText: 'Re-Enter password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(isObscuredTextReEnterPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isObscuredTextReEnterPassword =
                            !isObscuredTextReEnterPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onChanged: (String value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Re-Enter your password";
                  }
                  if (passwordController.text !=
                      reenterPasswordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Add the functionality to the 'Register' button.
                  }
                },
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('Register'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minWidth: double.infinity,
                height: 50,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log In",
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
    );
  }
}

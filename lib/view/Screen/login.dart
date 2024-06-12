import 'package:albarka_final/config/get_it_config.dart';
import 'package:albarka_final/res/TextStyle_App.dart';
import 'package:albarka_final/res/colors_App.dart';
import 'package:albarka_final/view/Screen/viewEmailAndPassword.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();

    bool isDone = false;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: scaffoldColor, width: 1),
                  borderRadius: BorderRadius.circular(20000),
                ),
                child: Image.asset('images/1.png'),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: containerColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text("  Email", style: textformStyle),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        fillColor: primaryColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: scaffoldColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: scaffoldColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text("  Password", style: textformStyle),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        fillColor: primaryColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: scaffoldColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: scaffoldColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Checkbox(
                            value: isDone,
                            onChanged: (value) {
                              // isDone = !isDone;
                              // isDone = value!;
                            }),
                        Text("Remember me", style: textformStyle),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: buttonColor),
                child: InkWell(
                  onTap: () {
                    core
                        .get<SharedPreferences>()
                        .setString('email', email.text);

                    core.get<SharedPreferences>().setString('pass', pass.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewEmailAndPassword(),
                        ));
                  },
                  child: const FittedBox(
                      child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30, color: scaffoldColor),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account ? ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(163, 249, 249, 0.75),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

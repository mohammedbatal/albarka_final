import 'package:albarka_final/config/get_it_config.dart';
import 'package:albarka_final/view/Screen/dataScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewEmailAndPassword extends StatelessWidget {
  const ViewEmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Welcome Mr ${core.get<SharedPreferences>().getString('email')}"),
              Text(
                  "Your Password is ${core.get<SharedPreferences>().getString('pass')}"),
              Text("اذا نسيت تدخلهن اتفضل ارجاع بعد اذنك دخلهن"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataScreen(),
                        ));
                  },
                  child: Text('Goo'))
            ],
          ),
        ),
      ),
    );
  }
}

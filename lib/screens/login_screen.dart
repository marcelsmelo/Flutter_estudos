import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_provider_example/formatters/cpf_formatter.dart';
import 'package:login_provider_example/models/login.dart';
import 'package:login_provider_example/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passVisible = false;

  @override
  Widget build(BuildContext context) {
    print('Rebuid Tela');
    return Container(
      color: Colors.purple,
      child: Container(
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: !_passVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: _passVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passVisible = _passVisible ? false : true;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Login data = Login('admin', 'admin');
                        Provider.of<LoginController>(context, listen: false)
                            .login(data);
                      },
                      child: Text("Logar"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

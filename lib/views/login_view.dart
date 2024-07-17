import 'package:flutter/material.dart';
import 'package:scheduler/views/home_view.dart';
import 'package:scheduler/controller/UserController.dart';
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[900],
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _usernameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Usuário',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Senha',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
             var login = await userController.tryLogin(_usernameController.text, _passwordController.text);
             if(login) {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => HomePage(),
                 ),
               );
             }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Text(
              'Entrar',
              style: TextStyle(color: Colors.white),
            ),

          ),
        ],
      ),
    );
  }
}
Future<bool> Login() async{
  return true;
}

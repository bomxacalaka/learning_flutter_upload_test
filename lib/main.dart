import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/second': (context) => SecondScreen(),
        '/red': (context) => RedScreen(),
        '/green': (context) => GreenScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Login Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (input) => _email = input!,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onSaved: (input) => _password = input!,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                )
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Use the saved values to authenticate the user
      Navigator.pushNamed(context, '/second');
    }
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/red');
                },
                child: Text('Red Screen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/green');
              },
              child: Text('Green Screen'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                )
            ),
          ],
        ),
      ),
    );
  }}


class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Red Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            )),
      ),
    );
  }
}


class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Green Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            )),
      ),
    );
  }
}
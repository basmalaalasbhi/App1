import 'package:flutter/material.dart';

void main() {
  runApp(basmala());
}

class basmala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'واجهة تسجيل الدخول',
      home: LoginScreenbasmala(),
    );
  }
}

class LoginScreenbasmala extends StatefulWidget {
  @override
  _LoginScreenStatebasmala createState() => _LoginScreenStatebasmala();
}

class _LoginScreenStatebasmala extends State<LoginScreenbasmala> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول إلى الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: 'أدخل اسم المستخدم',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passController,
              decoration: InputDecoration(
                labelText: 'أدخل كلمة المرور',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة منطق تسجيل الدخول
                print('اسم المستخدم: ${_userController.text}');
                print('كلمة المرور: ${_passController.text}');
              },
              child: Text('تسجيل الدخول الآن'),
            ),
          ],
        ),
      ),
    );
  }
}
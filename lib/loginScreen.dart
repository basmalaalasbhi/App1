import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginScreenbasmala(),
    );
  }
}

class loginScreenbasmala extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreenbasmala> {
  bool isRememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff5ac18e)
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        )
      ],
    );
  }


  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff5ac18e)
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        )
      ],
    );
  }


  Widget buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.number, // فقط أرقام
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xff5ac18e)
                ),
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )
            ),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        child: Text(
          'Forgot Password? ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  isRememberMe = value ?? false;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }


  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

          String email = emailController.text;
          String password = passwordController.text;
          String phone = phoneController.text;


          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayScreen(
                email: email,
                password: password,
                phone: phone,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff5ac18e),
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x665ac18e),
                          Color(0x995ac18e),
                          Color(0xcc5ac18e),
                          Color(0xff5ac18e),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 20),
                      buildPhoneNumber(),
                      buildForgotPassBtn(),
                      buildRememberCb(),
                      buildLoginBtn(),
                      buildSignUpBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class DisplayScreen extends StatelessWidget {
  final String email;
  final String password;
  final String phone;


  DisplayScreen({required this.email, required this.password, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entered Information"),
        backgroundColor: Color(0xff5ac18e),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Password: $password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Phone Number: $phone',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

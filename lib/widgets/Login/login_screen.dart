import 'package:flutter/material.dart';

import '../../pages/homePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/hrm-logo2.png"),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(100, 150, 150, 150),
                      blurRadius: 10,
                      blurStyle: BlurStyle.solid,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(100, 150, 150, 150),
                      blurRadius: 10,
                      blurStyle: BlurStyle.solid,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.lock), // Icon ổ khóa
                      suffixIcon: IconButton(
                        icon: Icon(obscureText
                            ? Icons.visibility
                            : Icons.visibility_off), // Icon con mắt
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  if (usernameController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    setState(() {
                      errorMessage = 'Sai tài khoản hoặc mật khẩu';
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account, ",
                  style: TextStyle(
                    color: Color(0xFF969696),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sign Up ",
                  style: TextStyle(
                    color: Color(0xFF323232),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "now.",
                  style: TextStyle(
                    color: Color(0xFF969696),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Or",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {}, child: Image.asset("assets/images/google.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {}, child: Image.asset("assets/images/apple.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {}, child: Image.asset("assets/images/fb.png")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

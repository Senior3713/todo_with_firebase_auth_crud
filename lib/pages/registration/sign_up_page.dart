import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_with_firebase_auth/pages/registration/sign_in_page.dart';
import 'package:todo_with_firebase_auth/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void signUp() async {
    final name = nameCtrl.text;
    final email = emailCtrl.text;
    final password = passwordCtrl.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) return;

    final isSuccess = await AuthService.signUp(email, password, context);

    if (isSuccess && context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => const SignInPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.gabriela(fontSize: 40),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Firstname",
                      style: GoogleFonts.underdog(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: nameCtrl,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Firstname",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: GoogleFonts.aleo(color: Colors.white60),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lastname",
                      style: GoogleFonts.underdog(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Lastname",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: GoogleFonts.aleo(color: Colors.white60),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: GoogleFonts.underdog(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: GoogleFonts.aleo(color: Colors.white60),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: GoogleFonts.underdog(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: const EdgeInsets.all(15),
                      hintStyle: GoogleFonts.aleo(color: Colors.white60),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      SelectableText(
                        "Sign In",
                        enableInteractiveSelection: false,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.lightBlue,
                        ),
                        onTap: () => Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (builder) => const SignInPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Spacer(flex: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Shimmer.fromColors(
                        enabled: true,
                        period: const Duration(seconds: 2),
                        baseColor: Colors.deepPurple.shade600,
                        highlightColor: Colors.deepPurple.shade400,
                        child: MaterialButton(
                          onPressed: signUp,
                          color: Colors.deepPurple,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: MediaQuery.sizeOf(context).width * .77,
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: GoogleFonts.play(fontSize: 17),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

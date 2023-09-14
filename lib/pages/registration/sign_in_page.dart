// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:todo_with_firebase_auth/pages/todo/home_page.dart';
// import 'package:todo_with_firebase_auth/pages/registration/sign_up_page.dart';
// import 'package:todo_with_firebase_auth/services/auth_service.dart';
//
// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});
//
//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }
//
// class _SignInPageState extends State<SignInPage> {
//   final emailCtrl = TextEditingController();
//   final passwordCtrl = TextEditingController();
//
//   void signIn() async {
//     final email = emailCtrl.text;
//     final password = passwordCtrl.text;
//
//     if (email.isEmpty || password.isEmpty) return;
//
//     final user = await AuthService.signIn(email, password);
//
//     if (user != null && context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (builder) => const HomePage(),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 25),
//           child: Column(
//             children: [
//               Text(
//                 "Sign In",
//                 style: GoogleFonts.gabriela(fontSize: 40),
//               ),
//               const SizedBox(height: 30),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Email",
//                   style: GoogleFonts.underdog(
//                     color: Colors.white54,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               TextField(
//                 onEditingComplete: () {
//                   FocusScope.of(context).nextFocus();
//                 },
//                 controller: emailCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Email",
//                   contentPadding: const EdgeInsets.all(15),
//                   hintStyle: GoogleFonts.aleo(color: Colors.white60),
//                   filled: true,
//                   border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   fillColor: Colors.brown,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Password",
//                   style: GoogleFonts.underdog(
//                     color: Colors.white54,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               TextField(
//                 onEditingComplete: () {
//                   FocusScope.of(context).unfocus();
//                 },
//                 controller: passwordCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   contentPadding: const EdgeInsets.all(15),
//                   hintStyle: GoogleFonts.aleo(color: Colors.white60),
//                   filled: true,
//                   border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   fillColor: Colors.brown,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have any account?  "),
//                   SelectableText(
//                     "Sign Up",
//                     enableInteractiveSelection: false,
//                     style: const TextStyle(
//                       color: Colors.lightBlue,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.lightBlue,
//                     ),
//                     onTap: () => Navigator.of(context).pushReplacement(
//                       CupertinoPageRoute(
//                         builder: (builder) => SignUpPage(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               const Spacer(flex: 10),
//               // Stack(
//               //   alignment: Alignment.center,
//               //   children: [
//               //     ClipRRect(
//               //       borderRadius: BorderRadius.circular(30),
//               //       child: Shimmer.fromColors(
//               //         enabled: true,
//               //         period: const Duration(seconds: 2),
//               //         baseColor: Colors.deepPurple.shade600,
//               //         highlightColor: Colors.deepPurple.shade400,
//               //         child: MaterialButton(
//               //           onPressed: signIn,
//               //           color: Colors.deepPurple,
//               //           height: 50,
//               //           shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.circular(30),
//               //           ),
//               //           minWidth: MediaQuery.sizeOf(context).width * .77,
//               //         ),
//               //       ),
//               //     ),
//               //     Text(
//               //       "Sign In",
//               //       style: GoogleFonts.play(fontSize: 17),
//               //     ),
//               //   ],
//               // ),
//               NeoPopButton(
//                 color: Colors.deepPurple,
//                 onTapUp: signIn,
//                 onTapDown: () => HapticFeedback.vibrate(),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Sign In",
//                         style: GoogleFonts.play(fontSize: 17),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_auth/blocs/auth/auth_bloc.dart';
import 'package:todo_with_firebase_auth/pages/todo/home_page.dart';
import 'package:todo_with_firebase_auth/services/strings.dart';
import 'package:todo_with_firebase_auth/views/custom_text_field_view.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }

          if(state is SignInSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// #text: sing in
                  Text(
                    I18N.signin,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  CustomTextField(
                      controller: emailController, title: I18N.email),
                  CustomTextField(
                      controller: passwordController, title: I18N.password),

                  /// #button: sign up
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(SignInEvent(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                    child: const Text(I18N.signin),
                  ),
                  const SizedBox(height: 30),

                  /// #already have account
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: I18N.dontHaveAccount,
                        ),
                        TextSpan(
                          text: I18N.signup,
                          style: const TextStyle(color: Colors.lightBlueAccent),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// #laoding...
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
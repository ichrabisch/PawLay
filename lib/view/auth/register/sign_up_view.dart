import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

class SignUpView extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpView({super.key, required this.showLoginPage});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //text contollers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  Future signUp() async {
    // authenticate user
    if (passIsConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }

    // add user details
    addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        int.parse(_ageController.text.trim()),
        _emailController.text.trim());
  }

  Future addUserDetails(
      String firstName, String lastName, int age, String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .set({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
    });
  }

  bool passIsConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.Register.tr(),
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontFamily: "Times New Roman",
              fontSize: 36,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 238, 203),
            Color.fromARGB(255, 3, 92, 66),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    // Hello again !
                    Text(
                      LocaleKeys.Welcome.tr(),
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("${LocaleKeys.Register.tr()} 😻",
                        style: const TextStyle(
                          fontSize: 14,
                        )),
                    const SizedBox(height: 30),

                    //first name textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.Firstname.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //last name textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.Lastname.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //age name textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _ageController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.Age.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'e-mail',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //password textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.Password.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //password confirmation
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 238, 203),
                          border: Border.all(
                              color: const Color.fromARGB(255, 247, 238, 203)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.Passwordagain.tr(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //sign in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 92, 66),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              LocaleKeys.Register.tr(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 247, 238, 203),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    //not a member? register now.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${LocaleKeys.Areyouamember.tr()} ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                            "${LocaleKeys.LogIn.tr()} ${LocaleKeys.Meow.tr()}!",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 29, 35, 219),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

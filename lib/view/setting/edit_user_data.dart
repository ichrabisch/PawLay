import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/init/lang/locale_keys.g.dart';

class EditUserDataView extends StatefulWidget {
  const EditUserDataView({super.key});

  @override
  State<EditUserDataView> createState() => _EditUserDataViewState();
}

class _EditUserDataViewState extends State<EditUserDataView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  editUserData() async {
    var firstName = _firstNameController.text;
    var lastName = _lastNameController.text;
    var age = _ageController.text;
    if (FirebaseAuth.instance.currentUser == null) return;
    if (firstName.isEmpty) {
      firstName = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) => value.data()!['first name']);
    }
    if (lastName.isEmpty) {
      lastName = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) => value.data()!['last name']);
    }
    if (age.isEmpty) {
      age = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) => value.data()!['age'].toString());
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'first name': firstName,
      'last name': lastName,
      'age': int.parse(age),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Edit User Data',
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
                    Text("😻",
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
                    //sign in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: editUserData,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 92, 66),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

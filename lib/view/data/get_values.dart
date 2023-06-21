// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw/components/music_animation.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';

// ignore: must_be_immutable
class GetUserData extends StatelessWidget {
  static String? menuName = '';
  // get user uzerinden menuName e ulaşacaksan getuser i
  // singleton yapmalısın bu sayede hafızada tek bir
  // instance ve bu instance ait tek bir özellik olur ve
  // programın her noktasından aynı adreste bu değişkenlere erişebilirsin
  const GetUserData({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String email = '';
    String firstName = '';
    String lastName = '';
    String age = '';

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          email = data['email'];
          firstName = data['first name'];
          lastName = data['last name'];
          age = data['age'].toString();
          firebaseAuth.currentUser!.updateDisplayName(firstName);

          return Text(
            '\n\n' +
                LocaleKeys.SignedIn.tr() +
                ' ' +
                email +
                '\n\n' +
                LocaleKeys.Firstname.tr() +
                ': ' +
                firstName +
                '\n\n' +
                LocaleKeys.Lastname.tr() +
                ': ' +
                lastName +
                ' \n\n' +
                LocaleKeys.Age.tr() +
                ': ' +
                age,
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
              fontSize: 20,
            ),
          );
        }
        return const MusicVisualizer();
      }),
    );
  }
}

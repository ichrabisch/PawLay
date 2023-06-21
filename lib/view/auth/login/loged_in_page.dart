import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw/view/data/get_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class LogedInPage extends StatefulWidget {
  const LogedInPage({super.key});

  @override
  State<LogedInPage> createState() => _LogedInPageState();
}

class _LogedInPageState extends State<LogedInPage> {
  //final user = FirebaseAuth.instance.currentUser!;
  List<String> userData = [];
  List<String> docIDs = [];
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('name', FirebaseAuth.instance.currentUser!.displayName!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.LogIn.tr(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: FutureBuilder(
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          title: GetUserData(),
                        );
                      },
                    );
                  },
                )),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_user_data')
                        .then((value) => setState(() {}));
                  },
                  color: const Color.fromARGB(255, 3, 92, 66),
                  child: const Text(
                    'Edit User Data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 247, 238, 203),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    SharedPreferences.getInstance().then((prefs) {
                      prefs.remove('name');
                    });
                  },
                  color: const Color.fromARGB(255, 3, 92, 66),
                  child: Text(
                    LocaleKeys.SignOut.tr(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 247, 238, 203),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

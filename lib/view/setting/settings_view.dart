import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
import 'package:paw/view/auth/login/login_view.dart';
import 'package:paw/view/setting/setting_viewmodel.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  SettingsViewModel viewModel = SettingsViewModel(); //instance
  final languages = const <DropdownMenuItem<String>>[
    DropdownMenuItem<String>(value: 'en', child: Text('English')),
    DropdownMenuItem<String>(value: 'tr', child: Text('Türkçe')),
    DropdownMenuItem<String>(value: 'es', child: Text('Espanol')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.Settings.tr(),
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 92, 66),
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
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.Language.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 3, 92, 66),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Observer(
                    builder: (_) {
                      return DropdownButton(
                        value: viewModel.language,
                        items: languages,
                        onChanged: (value) {
                          viewModel.setLanguage(value!, context);
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.LogIn.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 3, 92, 66),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 92, 66),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Color.fromARGB(255, 247, 238, 203),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

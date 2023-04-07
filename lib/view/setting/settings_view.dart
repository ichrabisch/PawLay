import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paw/core/init/lang/locale_keys.g.dart';
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
      appBar: AppBar(
        title: Text(LocaleKeys.Settings.tr(),
            style: TextStyle(
              color: Color.fromARGB(255, 247, 238, 203),
            )),
        backgroundColor: Color.fromARGB(255, 3, 92, 66),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 3, 92, 66),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.Language.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 247, 238, 203),
                  ),
                ),
                Spacer(),
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
          ],
        ),
      ),
    );
  }
}

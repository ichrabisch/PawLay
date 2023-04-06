import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  SettingViewModel viewModel = SettingViewModel(); //instance
  final languages = const <DropdownMenuItem<String>>[
    DropdownMenuItem<String>(value: 'en', child: Text('English')),
    DropdownMenuItem<String>(value: 'tr', child: Text('Türkçe')),
    DropdownMenuItem<String>(value: 'en', child: Text('Espanol')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Language',
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Observer(builder: (_) {
                return DropdownButton(
                  value: viewModel.language,
                  items: languages,
                  onChanged: (value) {
                    viewModel.setLanguage(value!, context);
                  },
                );
              }),
            ],
          ),
          Text(LocaleKeys.Welcome),
        ],
      ),
    );
  }
}

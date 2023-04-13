// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$userNameAtom =
      Atom(name: '_LoginViewModelBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginViewModelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$dataAtom =
      Atom(name: '_LoginViewModelBase.data', context: context);

  @override
  List<dynamic> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<dynamic> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$passErrorMessageAtom =
      Atom(name: '_LoginViewModelBase.passErrorMessage', context: context);

  @override
  String get passErrorMessage {
    _$passErrorMessageAtom.reportRead();
    return super.passErrorMessage;
  }

  @override
  set passErrorMessage(String value) {
    _$passErrorMessageAtom.reportWrite(value, super.passErrorMessage, () {
      super.passErrorMessage = value;
    });
  }

  late final _$userErrorMessageAtom =
      Atom(name: '_LoginViewModelBase.userErrorMessage', context: context);

  @override
  String get userErrorMessage {
    _$userErrorMessageAtom.reportRead();
    return super.userErrorMessage;
  }

  @override
  set userErrorMessage(String value) {
    _$userErrorMessageAtom.reportWrite(value, super.userErrorMessage, () {
      super.userErrorMessage = value;
    });
  }

  late final _$invalidErrorMessageAtom =
      Atom(name: '_LoginViewModelBase.invalidErrorMessage', context: context);

  @override
  String get invalidErrorMessage {
    _$invalidErrorMessageAtom.reportRead();
    return super.invalidErrorMessage;
  }

  @override
  set invalidErrorMessage(String value) {
    _$invalidErrorMessageAtom.reportWrite(value, super.invalidErrorMessage, () {
      super.invalidErrorMessage = value;
    });
  }

  late final _$buttonPassiveAtom =
      Atom(name: '_LoginViewModelBase.buttonPassive', context: context);

  @override
  bool get buttonPassive {
    _$buttonPassiveAtom.reportRead();
    return super.buttonPassive;
  }

  @override
  set buttonPassive(bool value) {
    _$buttonPassiveAtom.reportWrite(value, super.buttonPassive, () {
      super.buttonPassive = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void check(BuildContext context, String userName, String password) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.check');
    try {
      return super.check(context, userName, password);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveUserName(String text) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.saveUserName');
    try {
      return super.saveUserName(text);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void savePassword(String text) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.savePassword');
    try {
      return super.savePassword(text);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buttonActive(BuildContext context) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.buttonActive');
    try {
      return super.buttonActive(context);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
password: ${password},
data: ${data},
passErrorMessage: ${passErrorMessage},
userErrorMessage: ${userErrorMessage},
invalidErrorMessage: ${invalidErrorMessage},
buttonPassive: ${buttonPassive}
    ''';
  }
}

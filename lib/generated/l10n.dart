// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Paas Dashboard`
  String get appName {
    return Intl.message(
      'Paas Dashboard',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `ConfirmDelete?`
  String get confirmDeleteQuestion {
    return Intl.message(
      'ConfirmDelete?',
      name: 'confirmDeleteQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Tenant Name`
  String get tenantName {
    return Intl.message(
      'Tenant Name',
      name: 'tenantName',
      desc: '',
      args: [],
    );
  }

  /// `Delete Tenant`
  String get deleteTenant {
    return Intl.message(
      'Delete Tenant',
      name: 'deleteTenant',
      desc: '',
      args: [],
    );
  }

  /// `Namespace Name`
  String get namespaceName {
    return Intl.message(
      'Namespace Name',
      name: 'namespaceName',
      desc: '',
      args: [],
    );
  }

  /// `Delete Namespace`
  String get deleteNamespace {
    return Intl.message(
      'Delete Namespace',
      name: 'deleteNamespace',
      desc: '',
      args: [],
    );
  }

  /// `Topic Name`
  String get topicName {
    return Intl.message(
      'Topic Name',
      name: 'topicName',
      desc: '',
      args: [],
    );
  }

  /// `Delete Topic`
  String get deleteTopic {
    return Intl.message(
      'Delete Topic',
      name: 'deleteTopic',
      desc: '',
      args: [],
    );
  }

  /// `Clear Backlog`
  String get clearBacklog {
    return Intl.message(
      'Clear Backlog',
      name: 'clearBacklog',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

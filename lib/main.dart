import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:idt_messaging/blocs/index.dart';

import 'domain/index.dart';
import 'res/index.dart';
import 'ui/index.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isMacOS) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final cacheService = ChatsHiveService();
  final remoteService = ChatsHttpService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ChatsCubit(
          cacheService: cacheService,
          remoteService: remoteService,
        ),
        child: ChatsScreen(key: Keys.chatScreen),
      ),
    );
  }
}

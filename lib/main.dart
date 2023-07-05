//import 'package:audioplayers/audioplayers.dart';
import 'package:condomine/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//final player = AudioPlayer();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MainMenu(),
      title: 'Condomine',
      debugShowCheckedModeBanner: false));
      //player.play(DeviceFileSource('assets/sons/condominesoudtrack.mp3'));
      //player.setVolume(0.15);
}

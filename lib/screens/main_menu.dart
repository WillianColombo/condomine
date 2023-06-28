import 'package:condomine/screens/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> _options = [];
  List<bool>? _selectedOptions = <bool>[false, true, false];

  List<String> _getOption(BuildContext context){
    _options = [AppLocalizations.of(context)!.msg_easy, AppLocalizations.of(context)!.msg_medium, AppLocalizations.of(context)!.msg_hard ];
    return _options;
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 147, 128),
        body: Center(
          child: Container(
            width: 1920,
            height: 1080,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 109, 54, 35),
             Color.fromARGB(255, 199, 147, 128)],
            )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(50.0),
                  child: Image.asset("assets/images/gif_logo.gif", width: 400, height: 400,)
                ),
                Container(
                  width: 500,
                  height: 50,
                  margin: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Game(
                              nivel: _selectedOptions,
                            ))),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        return const Color.fromARGB(255, 109, 54, 35);
                      }),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.msg_play,
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color:  Color.fromARGB(255, 109, 54, 35)),
                  width: 500,
                  height: 50,
                  margin: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: ToggleButtons(
                    onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedOptions!.length; i++) {
                        _selectedOptions![i] = i == index;
                      }
                    });
                  },
                  isSelected: _selectedOptions!,
                  fillColor: const Color.fromARGB(255, 172, 92, 65),
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    minWidth: 165.0,
                  ),
                  children: _getOption(context).map((option) => Text(option,
                    style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white
                      ),
                    )).toList(),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

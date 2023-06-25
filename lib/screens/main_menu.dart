import 'package:condomine/screens/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> options = [];
  List<bool>? selectedOptions = <bool>[false, true, false];

  List<String> getOption(BuildContext context){
    options = [AppLocalizations.of(context)!.msg_easy, AppLocalizations.of(context)!.msg_medium, AppLocalizations.of(context)!.msg_hard ];
    return options;
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 147, 128),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(50.0),
                child: const Text(
                  "CONDOMINE",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 109, 54, 35),
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 50,
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Game(
                            nivel: selectedOptions,
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
                    for (int i = 0; i < selectedOptions!.length; i++) {
                      selectedOptions![i] = i == index;
                    }
                  });
                },
                isSelected: selectedOptions!,
                fillColor: const Color.fromARGB(255, 172, 92, 65),
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                  minWidth: 165.0,
                ),
                children: getOption(context).map((option) => Text(option,
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
    );
  }
}

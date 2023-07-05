import 'package:condomine/screens/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Classe que implementa a tela inicial do aplicativo

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
  
}

class _MainMenuState extends State<MainMenu> {
  List<String> _options = []; //Lista visual do botão de escolha da dificuldade
  List<bool>? _selectedOptions = <bool>[false, true, false]; //Lista lógica do botão de escolha da dificuldade
  List<String> _getOption(BuildContext context){ //Método que implementa as variáveis internacionalizadas ao botão de dificuldade
    _options = [AppLocalizations.of(context)!.msg_easy, AppLocalizations.of(context)!.msg_medium, AppLocalizations.of(context)!.msg_hard ];
    return _options;
  }
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container( //Adiciona o background gradient 
            width: 1920,
            height: 1080,
          decoration: const BoxDecoration(
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
                Container( //Gif da logo do game
                  margin: const EdgeInsets.all(50.0),
                  child: Image.asset("assets/images/gif_logo.gif", width: 400, height: 400,)
                ),
                Container(
                   //Botão de jogar que navega até a classe game.dart
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
                Container( //Botão com as opções de dificuldade. A opção "Médio" vem por padrão
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

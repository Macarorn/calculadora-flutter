import 'package:appl/screen/mainOption.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    //MaterialApp es para trabajar con widgets de material design y estilos y diseño
    return MaterialApp(
      //quitamos la cinta que indica que estamos en modo debug
      debugShowCheckedModeBanner: false,
      //definimos el widget inicial
      home: Scaffold (
        body: MenuOption(),
        //Para cambiar lo que se muestra en la pantalla inicial en este caso el menu para acceder a las funcionalidades
      ) //Scaffold es para crear la estructura basica de la app
    ); //MaterialApp
  }
}
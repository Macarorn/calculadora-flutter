import 'package:appl/screen/add.dart';
import 'package:appl/screen/calculator.dart';
import 'package:appl/screen/division.dart';
import 'package:appl/screen/register.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatefulWidget {
  const MenuOption({super.key});

  @override
  State<MenuOption> createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    //siempre iniciamos con un scaffold ya que tiene más margen de personalización
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritméticas Login Register'),
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
      ), //AppBar,
      //el body es la propiedad principal donde se colocan los widgets
      //En este caso usaremos un ListView para hacer scroll
      body: ListView(
        //aquí van los widgets hijos
        //usamos children para una lista de widgets
        children: [
          //Espacio arriba
          SizedBox(height: 16),
          Image.network('https://picsum.photos/330/200'),
          SizedBox(height: 16),
          //Hacemos un wrap en padding para dar margen a la card,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            Card(
              child: ListTile(
                title: Text('Suma'),
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Add()),
                  );
                },
              ),
              
            ), //Card,
          ), //Padding,
          Card(
            child: ListTile(
              title: Text('Calculadora'),
              leading: Icon(Icons.calculate),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculator()),
                );
              },
            ), //ListTile,
          ),
          Card(
            child: ListTile(
              title: Text('Registro'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ), //ListTile,
          ), //Card,
          Card(
            child: ListTile(
              title: Text('Login'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ), //ListTile,
          ), //Card,
          Card(
            child: ListTile(
              title: Text('División'),
              leading: Icon(Icons.horizontal_split),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Division()),
                );
              },
            ), //ListTile,
          ), //Card,
        ], //children
      ),
    );
  }
}

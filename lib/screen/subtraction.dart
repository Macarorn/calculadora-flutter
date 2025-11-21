//Creamos un stateful widget para la pantalla de agregar
import 'package:appl/screen/mainOption.dart';
import 'package:flutter/material.dart';

class Subtraction extends StatefulWidget {
  const Subtraction({super.key});

  @override
  State<Subtraction> createState() => _SubtractionState();
}

class _SubtractionState extends State<Subtraction> {
  //Ahora vamos a definir la logica de la suma
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double _resultado = 0.0;
  final _formKey = GlobalKey<FormState>();
  void _calculateSubtraction() {
    if (_formKey.currentState?.validate() ?? false) {
      double number1 = double.tryParse(_number1Controller.text) ?? 0.0;
      double number2 = double.tryParse(_number2Controller.text) ?? 0.0;
      setState(() {
        _resultado = number1 - number2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        foregroundColor: Colors.white,
        //Para regresar al la pantalla anterior,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuOption()),
            ); //Regresa a la pantalla anterior
          },
          icon: Icon(Icons.arrow_back_rounded), //Icono de regresar
        ),
      ), //AppBar  ,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Digite los números",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[400],
                ), //Text style,
              ), //Text
              SizedBox(height: 10),
              TextFormField(
                controller: _number1Controller,
                decoration: InputDecoration(
                  labelText: "Primer número",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El valor ingresado no es válido';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              TextFormField(
                controller: _number2Controller,
                decoration: InputDecoration(
                  labelText: "Segundo número",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El valor ingresado no es válido';
                  }
                  if (double.tryParse(value) == 0) {
                    return 'No se puede dividir por cero';
                  }
                  return null;
                },
              ), //TextFormField
              //Creamos un botón para sumar
              SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  //Lógica para sumar los números
                  _calculateSubtraction();
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text("Calcular", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ), //ElevatedButton
              SizedBox(height: 20),
              Text(
                'Resultado: $_resultado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[400],
                ),
              ),
            ], //children
          ),
        ),
      ),
      //Scaffold
    ); //Scaffold
  }
}

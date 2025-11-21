import 'package:appl/screen/add.dart';
import 'package:appl/screen/division.dart';
import 'package:appl/screen/multiplication.dart';
import 'package:appl/screen/subtraction.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double _resultado = 0.0;
  String? _selectedOperation;

  void _calculate() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0.0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0.0;

    setState(() {
      switch (_selectedOperation) {
        case 'Suma':
          _resultado = number1 + number2;
          break;
        case 'Resta':
          _resultado = number1 - number2;
          break;
        case 'Multiplicación':
          _resultado = number1 * number2;
          break;
        case 'División':
          _resultado = number2 != 0 ? number1 / number2 : 0.0;
          break;
        default:
          _resultado = 0.0;
      }
    });
  }

  void _navigateToOperation() {
    switch (_selectedOperation) {
      case 'Suma':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Add()));
        break;
      case 'Resta':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Subtraction()),
        );
        break;
      case 'Multiplicación':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Multiplication()),
        );
        break;
      case 'División':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Division()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedOperation,
              hint: Text('Selecciona una operación'),
              items: <String>['Suma', 'Resta', 'Multiplicación', 'División']
                  .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue;
                });
              },
            ),
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
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[400],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _navigateToOperation,
              child: Text('Ir a Operación'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[400],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teste_calculadora/pages/calc_adubo1.dart';
import 'package:teste_calculadora/pages/calc_adubo2.dart';

void main() {
  runApp(CalcAduboPage());
}

class CalcAduboPage extends StatefulWidget {
  @override
  _calcAduboPageState createState() => _calcAduboPageState();
  
}

class _calcAduboPageState extends State<CalcAduboPage> {
    bool showAdditionalButtonFinal1 = false;
    bool showAdditionalButtonFinal2 = false;
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 32,
        ),
        elevation: 0,
        title: Text(
          'Adubo',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Escolha o tipo de Adubo:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: showAdditionalButtonFinal1 ? Colors.green : Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAdditionalButtonFinal1 = true;
                    showAdditionalButtonFinal2 = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green.withOpacity(0); // Define a cor quando pressionado
                      }
                      return showAdditionalButtonFinal1 ? Colors.green : Colors.white; // Cor com base no estado de showAdditionalButtonFinal1
                    },
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Gramas a coletar',
                  style: TextStyle(
                    color: showAdditionalButtonFinal1 ? Colors.white : Colors.green,
                    fontSize: 25,
                  ),
                ),
              ), 
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: showAdditionalButtonFinal2 ? Colors.green : Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                   setState(() {
                    showAdditionalButtonFinal1 = false;
                    showAdditionalButtonFinal2 = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green.withOpacity(0); // Define a cor quando pressionado
                      }
                      return showAdditionalButtonFinal2 ? Colors.green : Colors.white; // Cor com base no estado de showAdditionalButtonFinal1
                    },
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Text(
                  'Kg/Ha',
                  style: TextStyle(
                    color: showAdditionalButtonFinal2 ? Colors.white : Colors.green,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          if(showAdditionalButtonFinal1) ...[
            SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => calc_adubo1()),
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Text(
                    'Ir para a calculadora',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          if(showAdditionalButtonFinal2) ...[
            SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.orange),
                ),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => calc_adubo2()),
                        );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Text(
                    'Ir para a calculadora',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
          ],
        ),
      ),
    );
  }
}
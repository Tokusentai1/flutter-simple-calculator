import 'package:flutter/material.dart';

import '../widgets/Custome_text_filed.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _item = '+';
  final List<String> _itens = [
    '+',
    '-',
    '*',
    '/',
  ];
  double _res = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            17,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bg.jpg'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeTextFiled(
                firstNumberController: _firstNumberController,
                hintText: 'Enter the First Number',
                labelText: 'First Number',
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: 95,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  alignment: Alignment.center,
                  value: _item,
                  items: _itens.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      _item = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomeTextFiled(
                firstNumberController: _secondNumberController,
                hintText: "Enter the Second Number",
                labelText: 'Second Number',
              ),
              const SizedBox(
                height: 18,
              ),
              FilledButton(
                onPressed: () {
                  switch (_item) {
                    case '-':
                      setState(() {
                        _res = double.parse(_firstNumberController.text) -
                            double.parse(_secondNumberController.text);
                      });
                      break;
                    case '*':
                      setState(() {
                        _res = double.parse(_firstNumberController.text) *
                            double.parse(_secondNumberController.text);
                      });
                      break;
                    case '/':
                      setState(() {
                        _res = double.parse(_firstNumberController.text) /
                            double.parse(_secondNumberController.text);
                      });
                      break;
                    default:
                      setState(() {
                        _res = double.parse(_firstNumberController.text) +
                            double.parse(_secondNumberController.text);
                      });
                  }
                },
                child: const Text(
                  '=',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(
                _res.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Inter',
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.blue,
              fontFamily: 'Inter',
              fontSize: 26,
            ),
          ),
        ),
      );
}

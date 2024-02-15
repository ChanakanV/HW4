import 'package:flutter/material.dart';

class hw extends StatefulWidget {
  const hw({super.key});

  @override
  State<hw> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<hw> {
  int _tensDigit = 0;
  int _onesDigit = 0;

  void _increment() {
    if (_tensDigit == 9 && _onesDigit == 9) {
      _tensDigit = 0;
      _onesDigit = 0;
    } else if (_onesDigit == 9) {
      _tensDigit++;
      _onesDigit = 0;
    } else {
      _onesDigit++;
    }
    setState(() {});
  }

  void _decrement() {
    if (_tensDigit == 0 && _onesDigit == 0) {
      _tensDigit = 9;
      _onesDigit = 9;
    } else if (_onesDigit == 0) {
      _tensDigit--;
      _onesDigit = 9;
    } else {
      _onesDigit--;
    }
    setState(() {});
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      width: 15.0,
      height: 15.0,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color.fromARGB(255, 9, 137, 113) : Color.fromARGB(255, 196, 190, 190),
      ),
    );
  }

  Widget _buildRow(List<bool> row) {
    List<Widget> dots = [];
    for (bool isActive in row) {
      dots.add(_buildDot(isActive: isActive));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  Widget _buildDigit(int digit) {
    List<List<bool>> digitMatrix = _digitToMatrix(digit);
    List<Widget> rows = [];
    for (List<bool> row in digitMatrix) {
      rows.add(_buildRow(row));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  List<List<bool>> _digitToMatrix(int digit) {
    switch (digit) {
      case 0:
        return [
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 1:
        return [
          [false, false, true, false, false],
          [false, true, true, false, false],
          [true, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [false, false, true, false, false],
          [true, true, true, true, true],
        ];
      case 2:
        return [
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, true, true, true, true],
        ];
      case 3:
        return [
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 4:
        return [
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
        ];
      case 5:
        return [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 6:
        return [
          [true, true, true, true, true],
          [true, false, false, false, false],
          [true, false, false, false, false],
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 7:
        return [
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, true, false],
          [false, false, true, false, false],
          [false, true, false, false, false],
          [false, true, false, false, false],
          [false, true, false, false, false],
        ];
      case 8:
        return [
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
        ];
      case 9:
        return [
          [true, true, true, true, true],
          [true, false, false, false, true],
          [true, false, false, false, true],
          [true, true, true, true, true],
          [false, false, false, false, true],
          [false, false, false, false, true],
          [true, true, true, true, true],
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED Matrix Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _increment,
              icon: Icon(Icons.arrow_drop_up_outlined, size: 30.0,),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigit(_tensDigit),
                SizedBox(width: 30.0,),
                _buildDigit(_onesDigit),
              ], 
            ),
            SizedBox(height: 40.0,),
            IconButton(
              onPressed: _decrement,
              icon: Icon(Icons.arrow_drop_down_outlined, size: 30.0,),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "0";
  String _equation = "";
  double? _firstValue;
  String? _operator;
  bool _shouldResetDisplay = false;

  void _onKeyPress(String value) {
    setState(() {
      if (value == "C") {
        _display = "0";
        _equation = "";
        _firstValue = null;
        _operator = null;
        _shouldResetDisplay = false;
      } else if (value == "⌫") {
        if (_display != "0" && _display.isNotEmpty) {
          _display = _display.substring(0, _display.length - 1);
          if (_display.isEmpty || _display == "-") {
            _display = "0";
          }
        }
      } else if (value == "+/-") {
        if (_display != "0") {
          if (_display.startsWith("-")) {
            _display = _display.substring(1);
          } else {
            _display = "-$_display";
          }
        }
      } else if (value == "%") {
        double val = double.tryParse(_display) ?? 0;
        _display = (val / 100).toString();
        _equation = "$val%";
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        _firstValue = double.tryParse(_display);
        _operator = value;
        _equation = "${_display} ${value}";
        _shouldResetDisplay = true;
      } else if (value == "=") {
        if (_firstValue != null && _operator != null) {
          double secondValue = double.tryParse(_display) ?? 0;
          double result = 0;

          switch (_operator) {
            case "+":
              result = _firstValue! + secondValue;
              break;
            case "-":
              result = _firstValue! - secondValue;
              break;
            case "×":
              result = _firstValue! * secondValue;
              break;
            case "÷":
              if (secondValue == 0) {
                _display = "Erreur";
                _equation = "";
                _firstValue = null;
                _operator = null;
                return;
              }
              result = _firstValue! / secondValue;
              break;
          }

          _equation = "${_firstValue!.toStringAsFixed(_firstValue! == _firstValue!.toInt() ? 0 : 2)} ${_operator} ${secondValue.toStringAsFixed(secondValue == secondValue.toInt() ? 0 : 2)} =";
          
          if (result == result.toInt()) {
            _display = result.toInt().toString();
          } else {
            _display = result.toStringAsFixed(4);
            // Clean trailing zeros
            while (_display.endsWith("0")) {
              _display = _display.substring(0, _display.length - 1);
            }
            if (_display.endsWith(".")) {
              _display = _display.substring(0, _display.length - 1);
            }
          }
          
          _firstValue = null;
          _operator = null;
          _shouldResetDisplay = true;
        }
      } else if (value == ".") {
        if (_shouldResetDisplay) {
          _display = "0.";
          _shouldResetDisplay = false;
        } else if (!_display.contains(".")) {
          _display = "$_display.";
        }
      } else {
        // Digit presses
        if (_display == "0" || _shouldResetDisplay) {
          _display = value;
          _shouldResetDisplay = false;
        } else {
          // Limit length to avoid layout overflow
          if (_display.length < 10) {
            _display = "$_display$value";
          }
        }
      }
    });
  }

  Widget _buildButton(String text, {Color? bg, Color? fg}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onKeyPress(text),
            borderRadius: BorderRadius.circular(50),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 72,
              decoration: BoxDecoration(
                color: bg ?? const Color(0xFF1E293B),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: fg ?? Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("Calculatrice"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display Screen Area
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Equation History Tape
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _equation,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 20,
                          fontFamily: 'Courier',
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Large Main Display
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _display,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Courier',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(color: Color(0xFF1E293B), height: 1, thickness: 1),
            const SizedBox(height: 16),

            // Keyboard Area
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Row 1: clear controls
                  Row(
                    children: [
                      _buildButton("C", bg: const Color(0xFFEF4444), fg: Colors.white),
                      _buildButton("+/-", bg: const Color(0xFF334155)),
                      _buildButton("%", bg: const Color(0xFF334155)),
                      _buildButton("÷", bg: const Color(0xFF6366F1), fg: Colors.white),
                    ],
                  ),
                  // Row 2
                  Row(
                    children: [
                      _buildButton("7"),
                      _buildButton("8"),
                      _buildButton("9"),
                      _buildButton("×", bg: const Color(0xFF6366F1), fg: Colors.white),
                    ],
                  ),
                  // Row 3
                  Row(
                    children: [
                      _buildButton("4"),
                      _buildButton("5"),
                      _buildButton("6"),
                      _buildButton("-", bg: const Color(0xFF6366F1), fg: Colors.white),
                    ],
                  ),
                  // Row 4
                  Row(
                    children: [
                      _buildButton("1"),
                      _buildButton("2"),
                      _buildButton("3"),
                      _buildButton("+", bg: const Color(0xFF6366F1), fg: Colors.white),
                    ],
                  ),
                  // Row 5
                  Row(
                    children: [
                      _buildButton("."),
                      _buildButton("0"),
                      _buildButton("⌫", bg: const Color(0xFF334155)),
                      _buildButton("=", bg: const Color(0xFF10B981), fg: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

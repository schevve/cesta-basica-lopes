import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SaleRegistration extends StatefulWidget {
  const SaleRegistration({super.key});

  @override
  State<SaleRegistration> createState() => _SaleRegistrationState();
}

class _SaleRegistrationState extends State<SaleRegistration> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrar Venda',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome do Cliente *'),
                onSaved: (value) => _formData['nome_cliente'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Produto *'),
                onSaved: (value) => _formData['produto'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Observações (opcional)',
                ),
                onSaved: (value) => _formData['observacoes'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Data da Venda *'),
                keyboardType: TextInputType.datetime,
                inputFormatters: [FormatDate()],
                onSaved: (value) => _formData['data_venda'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Valor Total da Venda *',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FormatMoney()],
                onSaved: (value) => _formData['valor_total'] = value,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aqui você pode enviar os dados para o backend ou realizar outras ações
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  ),
                ),
                child: Text(
                  'Registrar Venda',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormatDate extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length > 8) {
      return oldValue;
    }
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2 || i == 4) {
        formatted += '/';
      }
      formatted += digitsOnly[i];
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class FormatMoney extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final value = double.parse(digitsOnly) / 100;
    final formatted = value.toStringAsFixed(2).replaceAll('.', ',');
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

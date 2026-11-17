import 'package:flutter/material.dart';

import '../models/weight_model.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({super.key});

  @override
  State<AddWeightScreen> createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaContolador = TextEditingController();
  final TextEditingController _pesoContolador = TextEditingController();

  @override
  void dispose() {
    _fechaContolador.dispose();
    _pesoContolador.dispose();
    super.dispose();
  }

  void _guardarPeso() {
    if (_formKey.currentState!.validate()) {
      final WeightModel nuevoRegistro = WeightModel(
        fecha: _fechaContolador.text.trim(),
        pesoKilos: double.parse(_pesoContolador.text.trim()),
      );
      Navigator.pop(context, nuevoRegistro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo registro')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _fechaContolador,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Fecha',
                hintText: '17 de Noviembre',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'La fecha no puede estar vacía';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _pesoContolador,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                hintText: '75.5',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final double? peso = double.tryParse(value?.trim() ?? '');
                if (peso == null || peso <= 0) {
                  return 'Ingresa un peso mayor a 0';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _guardarPeso,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

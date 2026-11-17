import 'package:flutter/material.dart';

import '../models/weight_model.dart';
import 'add_weight_screen.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final List<WeightModel> registros = [];

  Future<void> _abrirFormularioDePseo() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddWeightScreen()),
    );

    if (resultado != null && resultado is WeightModel) {
      _agregarRegisro(resultado);
    }
  }

  void _agregarRegisro(WeightModel nuevoRegistro) {
    setState(() {
      registros.add(nuevoRegistro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Peso')),
      body: registros.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monitor_weight_outlined,
                    size: 48,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No hay registros',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: registros.length,
              itemBuilder: (context, index) {
                final WeightModel registro = registros[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.monitor_weight_outlined),
                    ),
                    title: Text(registro.fecha),
                    trailing: Text(
                      '${registro.pesoKilos.toStringAsFixed(1)} kg',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirFormularioDePseo,
        tooltip: 'Agregar peso',
        child: const Icon(Icons.add),
      ),
    );
  }
}

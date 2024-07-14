import 'package:survey/models/pengawasPemilu.dart';
import 'package:flutter/material.dart';

class PengawasPemiluDetailPage extends StatelessWidget {
  final PengawasPemilu pengawasPemilu;

  const PengawasPemiluDetailPage({Key? key, required this.pengawasPemilu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengawas Pemilu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama: ${pengawasPemilu.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Umur: ${pengawasPemilu.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('No TPS: ${pengawasPemilu.noTps}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Detail Pekerjaan: ${pengawasPemilu.detailJob}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
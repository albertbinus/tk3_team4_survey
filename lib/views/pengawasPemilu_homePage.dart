
// import 'package:flutter/foundation.dart';
import 'package:survey/controllers/pengawasPemilu.dart';
import 'package:survey/models/pengawasPemilu.dart';
import 'package:survey/views/pengawasPemilu_detailPage.dart';
import 'package:survey/views/pengawasPemilu_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Survey Pengawas Pemilu'),
    ),
      body: createListPengawasPemilu(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var pengawasPemilu = await _navigateToFormPengawasPemilu(context, null);
          if (pengawasPemilu != null) {
            _createPengawasPemilu(pengawasPemilu);
          }
        },
      ),
    );
  }

  // Floating Button
  Future<PengawasPemilu?> _navigateToFormPengawasPemilu(
      BuildContext context, PengawasPemilu? pengawasPemilu) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return FormPengawasPemilu(pengawasPemilu: pengawasPemilu);
        },
      ),
    );
  }

  // List Data
  Widget createListPengawasPemilu() {
    return FutureBuilder<List<PengawasPemilu>>(future: dbHelper.getPengawasPemilu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 3.0,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.people),
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].noTps),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.edit),
                        onTap: () async {
                          var pengawasPemilu = await _navigateToFormPengawasPemilu(
                              context, snapshot.data![index]);
                          if (pengawasPemilu != null) {
                            _editPengawasPemilu(pengawasPemilu);
                          }
                        },
                      ),
                      GestureDetector(
                        child: const Icon(Icons.delete),
                        onTap: () {
                          _deletePengawasPemilu(snapshot.data![index]);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PengawasPemiluDetailPage(
                        pengawasPemilu: snapshot.data![index],
                      ),
                      ),
                    );
                  },
                  // onTap: () async {
                  //   var pengawasPemilu = await _navigateToFormPengawasPemilu(
                  //       context, snapshot.data![index]);
                  //   if (pengawasPemilu != null) {
                  //     _editPengawasPemilu(pengawasPemilu);
                  //   }
                  // },
                ),
              );
            },
          );
        }
      },
    );
  }

  void _createPengawasPemilu(PengawasPemilu object) async {
    int result = await dbHelper.create(object);
    if (result > 0) {
      setState(() {}); // Memperbarui UI setelah membuat
    }
  }

  void _editPengawasPemilu(PengawasPemilu object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      setState(() {}); // Memperbarui UI setelah mengedit
    }
  }

  void _deletePengawasPemilu(PengawasPemilu object) async {
    int result =await dbHelper.delete(object.id);
    if (result > 0) {
      setState(() {}); // Memperbarui UI setelah menghapus
    }
  }
}
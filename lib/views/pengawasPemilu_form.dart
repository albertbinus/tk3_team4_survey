// import 'package:flutter/foundation.dart';
import 'package:survey/models/pengawasPemilu.dart';
import 'package:flutter/material.dart';

class FormPengawasPemilu extends StatefulWidget {

  final PengawasPemilu? pengawasPemilu;
  const FormPengawasPemilu({super.key, this.pengawasPemilu});

  @override
  State<FormPengawasPemilu> createState() => _FormPengawasPemiluState(this.pengawasPemilu);
}

class _FormPengawasPemiluState extends State<FormPengawasPemilu> {

  PengawasPemilu? pengawasPemilu;
  _FormPengawasPemiluState(this.pengawasPemilu);

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController noTpsController = TextEditingController();
  TextEditingController detailJob = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(pengawasPemilu !=null){
      nameController.text = pengawasPemilu!.name;
      ageController.text = pengawasPemilu!.age;
      noTpsController.text = pengawasPemilu!.noTps;
      detailJob.text = pengawasPemilu!.detailJob;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey Pengawas Pemilu'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // nama
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'NAME',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            // age
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: ageController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'AGE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            // noTps
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: noTpsController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'TPS NO',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            // detailJob
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: detailJob,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'DETAIL JOB',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            // tombol
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        'Save',
                      ),
                      onPressed: () {
                        if (pengawasPemilu == null) {
                          // tambah data
                          pengawasPemilu = PengawasPemilu(nameController.text, ageController.text, noTpsController.text, detailJob.text);
                        } else {
                          // ubah data
                          pengawasPemilu!.name = nameController.text;
                          pengawasPemilu!.age = ageController.text;
                          pengawasPemilu!.noTps = noTpsController.text;
                          pengawasPemilu!.detailJob = detailJob.text;
                        }

                        Navigator.pop(context, pengawasPemilu);
                      }
                    )
                  ),
                  Container(width: 10.0,),
                  Expanded(
                    child: ElevatedButton(
                        child: const Text("Back"),
                        onPressed: () {
                          Navigator.pop(context, null);
                        }
                      )
                  )
                ],
              ),
            ),

          ]
        ),
        )
    );
  }
}
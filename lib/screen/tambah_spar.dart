import 'package:flutter/material.dart';
import 'package:flutter_boring/service/sparing.dart';
import 'package:flutter_boring/model/sparing.dart';
import 'package:intl/intl.dart';

class TambahSpar extends StatefulWidget {
  const TambahSpar({super.key});

  @override
  State<TambahSpar> createState() => _TambahSparState();
}

class _TambahSparState extends State<TambahSpar> {
  final TextEditingController hostNameController = TextEditingController();
  final TextEditingController olahragaController = TextEditingController();
  final TextEditingController dateInputController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final SparingService _sparingService = SparingService();

  Future<void> _kirimDataKeFirestore() async {
    final String hostName = hostNameController.text;
    final String olahraga = olahragaController.text;
    final String dateTime = dateInputController.text;
    final String location = locationController.text;
    final String harga = hargaController.text;

    Sparing newSparing = Sparing(
      hostName: hostName,
      olahraga: olahraga,
      playingTime: dateTime,
      location: location,
      harga: harga,
      guestName: null,
    );

    try {
      await _sparingService.addSparing(newSparing);
      Navigator.pop(context, true);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>[
      'Futsal',
      'Badminton',
      'Volley',
      'Tennis'
    ];

    // ignore: unused_local_variable
    String dropDownValue = list.first;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        title: Text('Tambah Sparring', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
        child: Center(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Data Anda"),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownMenu<String>(
                      controller: olahragaController,
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      }).toList(),
                      inputDecorationTheme: InputDecorationTheme(
                        fillColor: const Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: hostNameController,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Nama Club/Komunitas *',
                        hintText: "Cth. Jaya Esport"),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Tanggal & Jam Sparring *',
                        icon: Icon(Icons.date_range),
                      ),
                      controller: dateInputController,
                      readOnly: true,
                      onTap: () async {
                        DateTime now = DateTime.now();
                        DateTime initialDate =
                            DateTime(now.year, now.month, now.day);

                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050),
                        );

                        if (pickedDate != null) {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null) {
                            DateTime selectedDateTime = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );

                            String formattedDate =
                                DateFormat('dd MMM yyyy HH:mm')
                                    .format(selectedDateTime);
                            dateInputController.text = formattedDate;
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Lokasi *',
                        hintText: "GOR Jayapura, Bekasi, Jawa Barat"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: hargaController,
                    decoration: InputDecoration(
                        fillColor: Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Harga *',
                        hintText: "70.000"),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _kirimDataKeFirestore,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 14, 52, 84),
                      ),
                      child:
                          Text('KIRIM', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
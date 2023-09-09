import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boring/screen/pick_maps.dart';
import 'package:flutter_boring/service/sparing.dart';
import 'package:flutter_boring/model/sparing.dart';
import 'package:intl/intl.dart';

class TambahSpar extends StatefulWidget {
  const TambahSpar({Key? key}) : super(key: key);

  @override
  State<TambahSpar> createState() => _TambahSparState();
}

class _TambahSparState extends State<TambahSpar> {
  final TextEditingController hostNameController = TextEditingController();
  final TextEditingController olahragaController = TextEditingController();
  final TextEditingController dateInputController = TextEditingController();
  final TextEditingController locationLatController = TextEditingController();
  final TextEditingController locationLngController = TextEditingController();
  final TextEditingController locationAddressController =
      TextEditingController();

  final MoneyMaskedTextController hargaController = MoneyMaskedTextController(
    initialValue: '0',
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  final SparingService _sparingService = SparingService();

  Future<void> _kirimDataKeFirestore() async {
    final String hostName = hostNameController.text;
    final String olahraga = olahragaController.text;
    final String dateTime = dateInputController.text;
    final String locationLat = locationLatController.text;
    final String locationLng = locationLngController.text;
    final String locationAddress = locationAddressController.text;
    final String harga = currencyFormat.format(
      double.parse(
          hargaController.text.replaceAll('.', '').replaceAll(',', '')),
    );

    Sparing newSparing = Sparing(
      hostName: hostName,
      olahraga: olahraga,
      playingTime: dateTime,
      locationLat: locationLat,
      locationLng: locationLng,
      locationAddress: locationAddress,
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

  bool _validator = false;
  void _validateData() {
    if (hostNameController.text.isNotEmpty &&
        olahragaController.text.isNotEmpty &&
        dateInputController.text.isNotEmpty &&
        locationLatController.text.isNotEmpty &&
        locationLngController.text.isNotEmpty &&
        locationAddressController.text.isNotEmpty &&
        hargaController.text.isNotEmpty) {
      setState(() {
        _validator = true;
      });
    } else {
      setState(() {
        _validator = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>[
      '-Pilih Olahraga-',
      'Badminton',
      'Baseball',
      'Basket',
      'Balap',
      'Casino',
      'Duel',
      'e-Sport',
      'Futsal',
      'Football',
      'Golf',
      'Hiking',
      'MiniSoccer',
      'Renang',
      'Tennis',
      'Volley',
    ];

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Data Anda"),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField<String>(
                      value: dropDownValue,
                      onChanged: (String? value) {
                        setState(() {
                          _validateData();
                          dropDownValue = value!;
                          olahragaController.text = dropDownValue;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: hostNameController,
                    onChanged: (value) {
                      _validateData();
                    },
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
                      hintText: "Cth. Jaya Esport",
                    ),
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
                            _validateData();
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: locationAddressController,
                    onChanged: (value) {
                      _validateData();
                    },
                    onTap: () async {
                      final List<dynamic> pickedMaps = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PickMaps()),
                      );
                      if (pickedMaps.length == 3) {
                        setState(() {
                          locationLatController.text = pickedMaps[0];
                          locationLngController.text = pickedMaps[1];
                          locationAddressController.text = pickedMaps[2];
                          print("Received Data: $pickedMaps");
                        });
                      }
                      _validateData();
                    },
                    readOnly: true,
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
                      icon: Icon(Icons.location_on),
                      labelText: "Lokasi",
                      hintText: locationAddressController.text,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: hargaController,
                    onChanged: (value) {
                      _validateData();
                    },
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
                      hintText: "70.000",
                    ),
                    keyboardType: TextInputType.number, // Hanya angka.
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Filter hanya angka.
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _validator ? _kirimDataKeFirestore : null,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 14, 52, 84),
                      ),
                      child:
                          Text('KIRIM', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoneyMaskedTextController extends TextEditingController {
  MoneyMaskedTextController({
    String initialValue = '0',
    this.decimalSeparator = ',',
    this.thousandSeparator = '.',
  }) {
    this.text = initialValue;
    this.addListener(() {
      final value = this.text;
      final sanitizedValue = value
          .replaceAll(thousandSeparator, '')
          .replaceAll(decimalSeparator, '.');

      if (sanitizedValue == '.' || sanitizedValue.isEmpty) {
        this.value = TextEditingValue(
          text: '0',
          selection: TextSelection.collapsed(offset: 1),
        );
      } else {
        final number = double.tryParse(sanitizedValue);
        if (number != null) {
          final formattedValue = NumberFormat.currency(
            locale: 'id_ID',
            symbol: 'Rp',
            decimalDigits: 0,
          ).format(number);
          final newText = formattedValue
              .replaceAll(thousandSeparator, '')
              .replaceAll('.', thousandSeparator)
              .replaceAll('Rp', '')
              .trim();
          this.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      }
    });
  }

  final String decimalSeparator;
  final String thousandSeparator;
}

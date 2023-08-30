import 'package:flutter/material.dart';
import 'package:web_date_picker/web_date_picker.dart';

class TambahSpar extends StatefulWidget {
  const TambahSpar({super.key});

  @override
  State<TambahSpar> createState() => _TambahSparState();
}


class _TambahSparState extends State<TambahSpar> {
  TextEditingController dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 52, 84),
        title: Text('Tambah Sparring' , style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
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
                
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Masukkan Data Anda"),
                  
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    TextFormField(
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
                        hintText: "Cth. Jaya Esport"
                      ),
                    ),

                    SizedBox(height: 20),
                      Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2050));

                                if (pickedDate != null) {
                                  dateInputController.text =pickedDate.toString();
                                }
                              },
                            ),
                          ),

                    

                    SizedBox(height: 20),
                    TextFormField(
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
                        hintText: "GOR Jayapura, Bekasi, Jawa Barat"
                      ),
                    ),

                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton( 
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 14, 52, 84),
                        ),
                        child: Text('KIRIM', style: TextStyle(color: Colors.white)),
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
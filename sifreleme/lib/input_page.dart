import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sifreleme/sifreleme_algoritmasi.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String metin = "";
  String seciliButon = ""; // Değişkeni String olarak güncelledik

  bool isSelected(String buton) {
    return seciliButon == buton;
  }

  void sifreleVeGoster() {
    if (seciliButon == "Buton 1") {
      String sifreliMetin = sifrele(metin,); // Özgün bir şifreleme algoritması
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Şifrelenmiş Metin"),
            content: Text(sifreliMetin),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Kapat"),
              ),
            ],
          );
        },
      );
    } else if (seciliButon == "Buton 2") {
      String cozulmusMetin = coz(metin,); // Şifreyi çözme
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Çözülmüş Metin"),
            content: Text(cozulmusMetin),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Kapat"),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifreleme Algoritması"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  metin = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Metin giriniz",
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      seciliButon = "Buton 1";
                    });
                  },
                  icon: Icon(Icons.lock),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(
                      color: isSelected("Buton 1") ? Colors.blue : Colors.transparent, // Seçiliyse kenar rengi mavi, değilse şeffaf
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      seciliButon = "Buton 2";
                    });
                  },
                  icon: Icon(Icons.lock_open),
                  label: SizedBox.shrink(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(
                      color: isSelected("Buton 2") ? Colors.blue : Colors.transparent, // Seçiliyse kenar rengi mavi, değilse şeffaf
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (metin.isNotEmpty && seciliButon.isNotEmpty) {
                  sifreleVeGoster();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Hata"),
                        content: Text("Lütfen metin girişi yapın ve bir buton seçin."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Kapat"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Çevir"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
















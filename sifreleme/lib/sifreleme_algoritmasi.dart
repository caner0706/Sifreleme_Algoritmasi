String sifrele(String metin) {
  String sifreliMetin = "";
  for (int i = 0; i < metin.length; i++) {
    int unicode = metin.codeUnitAt(i);

    if (unicode >= 65 && unicode <= 90) {
      unicode += 1500; // Büyük harfler
    } else if (unicode >= 97 && unicode <= 122) {
      unicode += 800; // Küçük harfler
    } else if (!(unicode >= 48 && unicode <= 57)) {
      unicode += 100; // Diğer karakterler ve semboller
    }

    sifreliMetin += unicode.toString() + "-";
  }
  return sifreliMetin.substring(0, sifreliMetin.length - 1);
}

String coz(String sifreliMetin) {
  List<String> yillar = sifreliMetin.split("-");
  String cozulmusMetin = "";
  for (String yilStr in yillar) {
    int yil = int.parse(yilStr);

    if (yil >= 1500) {
      yil -= 1500; // Büyük harf kontrolü
    } else if (yil >= 800) {
      yil -= 800; // Küçük harf kontrolü
    } else if (yil >= 100) {
      yil -= 100; // Diğer karakterler
    }

    cozulmusMetin += String.fromCharCode(yil);
  }
  return cozulmusMetin;
}


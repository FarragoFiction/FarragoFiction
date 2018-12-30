import 'dart:async';
import 'dart:html';

import 'package:CommonLib/src/navbar/navbar.dart';

//bare minimum for a page.
Future<Null> main() async {
  await loadNavbar();
  //TODO hide all wranglers but the one passed in the command line. if none past, display error.
  window.onLoad.listen((Event e) {
    displayBio();
  });
}

void displayBio() {
  String staff = getParameterByName("staff",null);
  DateTime now = new DateTime.now();

  if(now.month == 4 && now.day == 1) {
    changeAvatar(staff);
  }
  Element div = querySelector("#$staff");
  print("got div of $div from looking for element with id $staff");
  if(div != null) div.classes.remove("void");
}


void changeAvatar(String staff) {
  ImageElement img = querySelector("#${staff}Avatar");
  img.src = img.src.replaceAll(".png", "_sauce.png");
}






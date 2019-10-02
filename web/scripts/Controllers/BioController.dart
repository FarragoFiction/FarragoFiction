import 'dart:async';
import 'dart:html';

import 'package:CommonLib/src/navbar/navbar.dart';

import 'Newsposts/ChangeLogMemo.dart';
import 'Newsposts/Wrangler.dart';

//bare minimum for a page.
bool bioDisplayed = false;
Future<Null> main() async {
  await loadNavbar();
  print("navbar");
  //TODO hide all wranglers but the one passed in the command line. if none past, display error.

    window.onLoad.listen((Event e) {
      print("window loaded");
      displayBio();
    });


}

void displayBio() {
  String staff = getParameterByName("staff",null);
  staff = staff.replaceAll("/","");
  print("staff is $staff");
  DateTime now = new DateTime.now();

  if(now.month == 4 && now.day == 1) {
    changeAvatar(staff);
  }
  Element div = querySelector("#$staff");
  print("got div of $div from looking for element with id $staff");
  if(div != null) div.classes.remove("void");
  displayNewsposts(staff);
}

void displayNewsposts(String staff) async {
  ChangeLogMemo memo =  ChangeLogMemo.instance;
  ChangeLogMemo.init();
  if(Wrangler.allWithKey.containsKey(staff)) {
    Wrangler wrangler = Wrangler.allWithKey[staff];
    await wrangler.slurpNewsposts();
    memo.render(querySelector("#newspostsMain"));
  }
}


void changeAvatar(String staff) {
  ImageElement img = querySelector("#${staff}Avatar");
  img.src = img.src.replaceAll(".png", "_sauce.png");
}






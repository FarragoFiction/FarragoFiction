import 'Newsposts/ChangeLogMemo.dart';
import 'Newsposts/Wrangler.dart';
import 'dart:async';
import 'dart:html';

import 'package:CommonLib/src/navbar/navbar.dart';

Future<Null> main() async{
  await loadNavbar();
  Element output = querySelector('#output');


  ChangeLogMemo.init();
  for(Wrangler w in Wrangler.all) {
    await w.slurpNewsposts();
  }
  ChangeLogMemo.instance.renderNewest(output);
}

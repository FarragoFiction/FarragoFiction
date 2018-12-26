//this is in charge of the main page newsposts, and the Author/ABJ newsposts.
//for now, just get main page working. (so no simulator madness)
import 'Wrangler.dart';
import 'dart:html';
import 'dart:async';
import "ChangeLogMemo.dart";
import 'package:CommonLib/NavBar.dart';

ChangeLogMemo memo =  ChangeLogMemo.instance;

Future<Null> main()async {
   await loadNavbar();
   ChangeLogMemo.init();
  createNews();
}

Future<Null> createNews() async{
  await renderHeadshots();
  for(Wrangler w in Wrangler.all) {
    await w.slurpNewsposts();
  }
  renderNews();

}

Future<Null> renderHeadshots() async {
  Element div = querySelector("#newspostsMain");
  DivElement container = new DivElement();
  container.classes.add("HeadshotContainer");

  for(Wrangler w in Wrangler.all) {
    w.renderHeadshot(container);
  }
  div.append(container);
}

void renderNews() {
  Element div = querySelector("#newspostsMain");
  memo.render(div);
}

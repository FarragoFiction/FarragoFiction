import 'dart:html';
import 'package:CommonLib/Utility.dart';

void main() {
  Element output = querySelector('#output');
  AnchorElement anchor = new AnchorElement(href: "newsposts.html")..text = "Newsposts";
  output.append(anchor);
}

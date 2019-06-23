/*
    A changeLog Memo has a list of Newsposts sorted by date.

    it knows how to draw itself (by calling each newspost in order of date).

 */
import "Wrangler.dart";
import 'dart:html';
import 'package:CommonLib/Colours.dart';


class ChangeLogMemo {
    static Wrangler jadedResearcher;// = new Wrangler("jadedResearcher", "images/Credits/jadedResearcher_icon.png", new Colour.fromStyleString("#3da35a"));
    static Wrangler karmicRetribution;//= new Wrangler("karmicRetribution", "images/Credits/Smith_of_Dreams_Icon.png", new Colour.fromStyleString("#9630BF"));
    static Wrangler aspiringWatcher;
    static Wrangler paradoxLands;
    static Wrangler manicInsomniac;
    static Wrangler tableGuardian;
    static Wrangler shogun;
    static Wrangler insufferableOracle;
    static Wrangler yearnfulNode;
    static Wrangler nebulousHarmony;
    static Wrangler cactus;
    static ChangeLogMemo _instance;

    static void init() {
        String end  = ".png";
        DateTime now = new DateTime.now();
        //gosh what could this even mean???

        if(now.month == 4 && now.day == 1) {
            end = "_sauce.png";
        }

        jadedResearcher = new Wrangler("jadedResearcher", "images/Credits/jadedResearcher_icon$end", new Colour.fromStyleString("#3da35a"));
        karmicRetribution = new Wrangler("karmicRetribution", "images/Credits/Smith_of_Dreams_icon$end", new Colour.fromStyleString("#9630BF"));
        paradoxLands = new Wrangler("paradoxLands", "images/Credits/pl_icon$end", new Colour.fromStyleString("#000066"));

        aspiringWatcher = new Wrangler("aspiringWatcher", "images/Credits/aw_icon$end", new Colour.fromStyleString("#494132"));
        manicInsomniac = new Wrangler("manicInsomniac", "images/Credits/mi_icon$end", new Colour.fromStyleString("#003300"));

        insufferableOracle = new Wrangler("insufferableOracle", "images/Credits/io_icon$end", new Colour.fromStyleString("#00ff00"));


        shogun = new Wrangler("shogun", "images/Credits/shogun_icon$end", new Colour.fromStyleString("#00ff00"));
        tableGuardian = new Wrangler("tableGuardian", "images/Credits/tg_icon$end", new Colour.fromStyleString("#ff3399"));
        yearnfulNode = new Wrangler("yearnfulNode", "images/Credits/yn_icon$end", new Colour.fromStyleString("#ffc40d"));
        nebulousHarmony = new Wrangler("nebulousHarmony", "images/Credits/nh_icon$end", new Colour.fromStyleString("#003300"));

        cactus = new Wrangler("cactus", "images/Credits/cactus_icon$end", new Colour.fromStyleString("#ffbdfc"));

    }

    List<MemoNewspost> newsposts = new List<MemoNewspost>();

    static ChangeLogMemo get instance {
        if( _instance == null) _instance = new ChangeLogMemo();
        return _instance;
    }

    ChangeLogMemo() {
    }

    void render(Element div) {
        newsposts.sort();
        for(MemoNewspost m in newsposts) {
            m.render(div);
        }
    }

    void renderNewest(Element div) {
        newsposts.sort();
        newsposts.first.renderTeaser(div);
    }
}


class MemoNewspost implements Comparable<MemoNewspost> {
    Wrangler poster;
    String text;
    DateTime date;
    MemoNewspost(this.poster, this.date, this.text) {
        //automatically add to the uber memo
        ChangeLogMemo.instance.newsposts.add(this);
    }

    MemoNewspost.from(String t, this.poster){
        //2018-02-02: I can fucking believe it's fucking Ground Hogs Day because I have spent the day murdering the fuck out of bugs that should be long fucking dead. Combo sessions once again work, and MAYBE players will stop spawning dead or near dead?<br><br>Also Shogun finally fucking works right. Also, YES I know you're fucking out of character but that is just going to hafta be a thing till the Big Bad update.
        //print("Parsing line: $t");
        List<String> parts = t.split(":");
       // print(parts);
        if(parts.length <2) return;
        date = DateTime.parse(parts[0].trim());
        parts.remove(parts[0]);
        text = "${parts.join(':')}";
        ChangeLogMemo.instance.newsposts.add(this);
    }

    void renderTeaser(Element div) {
        poster.renderSingleLine(div,date,text);
    }
    void render(Element div) {
        poster.renderLine(div, date, text);
    }

  @override
  int compareTo(MemoNewspost other) {
      Duration difference = other.date.difference(date);
      //will it be positive or negative?
      if (difference.inSeconds == 0) {
            //if all things are equal, post JRs first because everybody else will be reacting to it
            int ret = 1;
            if(other.poster.chatHandle.startsWith("j")) ret = -1;
            return ret;
      }
      return difference.inSeconds;
  }
}
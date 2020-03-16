class RepeaterModel{
  int id;
  String name;
  int rxFreq;
  int shift;
  int tone;
  int cc;
  int slot;
  String type;
  String grid;
  String country;
  String heading;

  RepeaterModel();


  static final columns = ["id", "name", "rxFreq", "shift", "tone", "cc", "slot" "type", "grid", "country", "heading"];

  Map toMap() {
    Map map = {
      "id": id,
      "name" : name,
      "rxFreq" : rxFreq,
      "shift" : shift,
      "tone" : tone,
      "cc" : cc,
      "slot" : slot,
      "type" : type,
      "grid" : grid,
      "country" : country,
      "heading" : heading
    };

    return map;

  }

  static fromMap(Map map) {
    RepeaterModel repeater = new RepeaterModel();
    repeater.id = map["id"];
    repeater.name = map["name"];
    repeater.rxFreq = map["rxFreq"];
    repeater.shift = map["shift"];
    repeater.tone = map["tone"];
    repeater.cc = map["CC"];
    repeater.slot = map["slot"];
    repeater.type = map["type"];
    repeater.grid = map["grid"];
    repeater.country = map["country"];
    repeater.heading = map["heading"];

    return repeater;
  }


}
class Calculator {
  String? fv = "";
  String? sv = "";
  bool check = false;
  String? result = "";
  String? oprator = "";

  getValue(String dg) {
    if (check == false) {
      fv = fv! + dg;
      print(fv);
    } else {
      sv = sv! + dg;
      print(sv);
    }
  }

  equalClick() {
    if (fv != "" && sv != "") {
      print("andar");
      if (oprator == "+") {
        result = (double.parse(fv!) + double.parse(sv!)).toString();
      } else if (oprator == "-") {
        result = (double.parse(fv!) - double.parse(sv!)).toString();
      } else if (oprator == "*") {
        result = (double.parse(fv!) * double.parse(sv!)).toString();
      } else if (oprator == "/") {
        result = (double.parse(fv!) / double.parse(sv!)).toString();
      }
    }
  }

  deleteClick(String charcter) {
    if (fv!.contains(charcter) == true) {
      print("char= ${charcter}");
      var lf = fv!.length;
      fv = fv!.substring(0, lf - 1);
      oprator = "";
      check = false;
      print(fv);
    } else if (sv!.contains(charcter) == true) {
      var ls = sv!.length;
      sv = sv!.substring(0, ls - 1);
    } else if (oprator!.contains(charcter)) {
      oprator = "";
      check = false;
    }
  }

  deleteLongClick() {
    fv = "";
    sv = "";
    oprator = "";
    result = "";
    check = false;
  }
}

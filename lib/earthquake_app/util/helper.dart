class TypesHelper {
  // ignore: missing_return
  static int toInt(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is int) {
        return val;
      } else {
        return val.toInt();
      }
    } catch (error) {
      print(error);
    }
  }

  // ignore: missing_return
  static double toDouble(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is double) {
        return val;
      } else {
        return val.toDouble();
      }
    } catch (error) {
      print(error);
    }
  }
}

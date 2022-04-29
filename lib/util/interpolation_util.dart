class InterpolationUtil {
  
  InterpolationUtil._();

  static const needleRegex = r'{#}';
  static const needle = '{#}';
  static final RegExp exp = RegExp(needleRegex);

  static String interpolate(String string, List l) {
    Iterable<RegExpMatch> matches = exp.allMatches(string);

    assert(l.length == matches.length);

    var i = -1;
    return string.replaceAllMapped(exp, (match) {
      i = i + 1;
      return '${l[i]}';
    });
  }
}

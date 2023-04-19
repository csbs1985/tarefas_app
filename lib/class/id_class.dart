import 'dart:math';

class IdClass {
  int generateUniqueId() {
    var nowInMillis = DateTime.now().millisecondsSinceEpoch;
    var random = Random.secure().nextInt(999999).toString().padLeft(6, '0');
    var uniqueValue = '$nowInMillis-$random';
    var hash = uniqueValue.hashCode & 0xFFFFFFFF;
    return hash;
  }
}

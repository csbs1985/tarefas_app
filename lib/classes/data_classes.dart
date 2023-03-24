import 'package:intl/intl.dart';

class DataClass {
  DateTime formatDateTime(String data) {
    DateTime dataTime = DateFormat('dd/MM/yyyy').parse(data);
    print(dataTime);

    return dataTime;
  }
}

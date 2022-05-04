import 'dart:io';
import 'package:rsue_schedule_api/get_all_schedules.dart';

void main(List<String> args) async {
  var asch = await getAllSchedules();
  if (asch != null) {
    for (var entrie in asch.entries) {
      if (entrie.value != null) {
        await File('dist/' + entrie.key + '.json')
            .writeAsString(entrie.value!.toJson());
      }
    }
  } else {
    throw Exception('getAllSchedules is null');
  }
}

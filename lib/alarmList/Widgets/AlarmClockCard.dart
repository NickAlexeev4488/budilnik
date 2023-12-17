import 'package:budilnik/MainImports.dart';
// import 'package:intl/intl.dart';

import 'package:budilnik/alarmList/Widgets/BrLine.dart';
import 'package:budilnik/alarmList/Widgets/MySwitch.dart';

class AlarmClockCard extends StatefulWidget {
  TimeOfDay alarmClockTime;
  var alarmClockTask; // TODO изменить vat на название класса или энума

  AlarmClockCard({super.key, required this.alarmClockTime, required this.alarmClockTask});

  // вызывает окно с выбором времени. Не забудь про setStatus()
  Future<bool> setAlarmClockTimeFromTimePicker(BuildContext context) async {
    TimeOfDay? selectedAlarmClockTime = await showTimePicker(
      context: context,
      initialTime: alarmClockTime,
    );
    if (selectedAlarmClockTime != null && selectedAlarmClockTime != alarmClockTime) {
      alarmClockTime = selectedAlarmClockTime;
      return true;
    }
    return false;
  }

  // вызывает окно с выбором задачи. Не забудь про setStatus()
  Future<bool> setAlarmClockTaskFromTaskPicker(BuildContext context) async {
    var selectedAlarmClockTask = alarmClockTask;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Выбирите задачу',
              style: TextStyle(
                color: ColorFont,
                fontSize: 30,
              )
            ),
            content: TextField(
              onChanged: (String value) {
                //print(value);
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    selectedAlarmClockTask = alarmClockTask;  // отменить изменения
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Отмена',
                    style: TextStyle(
                      color: ColorFont,
                      fontSize: 20,
                    )
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Выбрать',
                    style: TextStyle(
                      color: ColorFont,
                      fontSize: 20,
                    )
                  )),
            ],
          );
        });
    if (selectedAlarmClockTask != alarmClockTime) {
      alarmClockTime = selectedAlarmClockTask;
      return true;
    }
    return false;
  }

  @override
  State<AlarmClockCard> createState() => _AlarmClockCardState();
}

class _AlarmClockCardState extends State<AlarmClockCard> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Text(
                  widget.alarmClockTime.format(context),
                  style: const TextStyle(
                    color: ColorFont,
                    fontSize: 60,
                  ),
                ),
                onTap: () {
                  widget.setAlarmClockTimeFromTimePicker(context).then((flagUpdate) {
                    if (flagUpdate) setState(() {});
                  });
                },
              ),
              GestureDetector(
                child: const Icon(
                  // TODO подставить иконку задачи
                  Icons.question_mark,
                  size: 60,
                  color: ColorFont,
                ),
                onTap: () {
                  widget.setAlarmClockTaskFromTaskPicker(context).then((flagUpdate) {
                    if (flagUpdate) setState(() {});
                  });
                },
              ),
              MySwitch(),
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          width: double.infinity,
          child: CustomPaint(
            painter: BrLine(strokeWidth: 4),
          )),
    ]);
  }
}

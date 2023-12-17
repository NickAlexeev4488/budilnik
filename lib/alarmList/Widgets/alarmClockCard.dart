import 'package:budilnik/MainImports.dart';

import 'package:budilnik/alarmList/Widgets/br.dart';
import 'package:budilnik/alarmList/Widgets/mySwitch.dart';

class alarmClockCard extends StatefulWidget {
  int hour = 0;
  int min = 0;

  alarmClockCard({required this.hour, required this.min});

  @override
  State<alarmClockCard> createState() => _alarmClockCardState();
}

class _alarmClockCardState extends State<alarmClockCard> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.hour}:${widget.min}",
            style: TextStyle(
              color: ColorFont,
              fontSize: 60,
            ),
          ),
          Icon(
            Icons.question_mark,
            size: 60,
            color: ColorFont,
          ),
          mySwitch(),
        ],
      ),
      Container(
        width: double.infinity,
        child: CustomPaint(
          painter: br(),
        )
      ),
    ]);
  }
}

/*Card(
      //color: Color(0xFF00FF00),
      child: ListTile(
        title: Text(
          "${widget.hour}:${widget.min}",
          style: TextStyle(
            color: ColorFont,
            fontSize: 60,
          ),
        ),
        trailing: mySwitch()
      ),
    );*/

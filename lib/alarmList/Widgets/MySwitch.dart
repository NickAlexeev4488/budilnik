import 'package:budilnik/MainImports.dart';

class MySwitch extends StatefulWidget {
  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool status=true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      //splashRadius: 500.0,
      activeColor: ColorActiveSwitchThumb,
      activeTrackColor: ColorActiveSwitchTrack,
      inactiveThumbColor: ColorInactiveSwitchThumb,
      inactiveTrackColor: ColorInactiveSwitchTrack,
      value: status,
      onChanged: (value) => setState(() => status = value),
    );
  }
}

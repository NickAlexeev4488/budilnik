import 'package:budilnik/MainImports.dart';

class mySwitch extends StatefulWidget {
  @override
  State<mySwitch> createState() => _mySwitchState();
}

class _mySwitchState extends State<mySwitch> {
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

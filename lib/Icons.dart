// все Иконки объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Icon' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';
import 'package:budilnik/Colors.dart';

Icon IconAddAlarmClock = Icon(
  Icons.add,
  color: ColorBackground,
);

List allTaskIcons = [
  // поменяйте названия если там у задач другие названия, и возможно нужно их в 1 массив запихнуть
  Icon(
    Icons.star_border,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
  Icon(
    Icons.star_half,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
  Icon(
    Icons.star,
    color: ColorMain1,      // TODO заменить или убрать цвет
    size: 50,
  ),
];

// все Иконки объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Icon' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';
import 'package:budilnik/Colors.dart';

const Icon IconAddAlarmClock = const Icon(
  Icons.add,
  color: ColorBackground,
);

// поменяйте названия если там у задач другие названия, и возможно нужно их в 1 массив запихнуть
const Icon IconTaskLVL1 = const Icon(
  Icons.one_x_mobiledata,
  color: ColorMain1,      // TODO заменить или убрать цвет
);
const Icon IconTaskLVL2 = const Icon(
  Icons.looks_two_rounded,
  color: ColorMain1,      // TODO заменить или убрать цвет
);
const Icon IconTaskLVL3 = const Icon(
  Icons.three_g_mobiledata,
  color: ColorMain1,      // TODO заменить или убрать цвет
);
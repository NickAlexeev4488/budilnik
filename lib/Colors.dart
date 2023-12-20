// все цвета объявляем сдесь, они ведь общие
// все названия начинаем со слова 'Color' и пишем за что он отвечает, чтобы не запутаться
import 'package:flutter/material.dart';

// Палитра основных цветов используются только внутри этого файла
// Создаём их копию с более понятным названием и использовать уже ёё
Color ColorMain1 = Color.fromARGB(255, 47, 27, 126);
Color ColorMain2 = Color.fromARGB(255, 236, 234, 255);
// все это надо когда начнём переделывать дизайн.

Color ColorBackground = ColorMain2; // задний фон приложения
Color ColorFont = ColorMain1; // шрифта

Color ColorActiveSwitchThumb = ColorMain2; // кружочка на активном switch-е
Color ColorActiveSwitchTrack =
    ColorMain1; // трека(который под кружочком) на активном switch-е
Color ColorInactiveSwitchThumb = ColorMain1; // кружочка на неактивном switch-е
Color ColorInactiveSwitchTrack =
    ColorMain2; // трека(который под кружочком) на неактивном switch-е

Color ColorButton = ColorMain1; // ненажатой кнопки
Color ColorPressedButton = ColorMain2; // кнопки при нажатии   TODO

Color ColorBrLine = ColorMain1;                 // горизонтальной черты
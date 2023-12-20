import 'package:budilnik/MainImports.dart';
import 'package:workmanager/workmanager.dart';    // для создания фонового процесса

void handlerWorkmanager(){
  Workmanager().executeTask((task, inputData) async {

    int idTask = inputData!["idTask"];    // в inputData записан id задачи (уровень или чё там)
    while (true){
      switch(idTask){ // получил уровень задачи и дальше обрабытывай как надо
        case 0: // первый уровень
        case 1: // второй уровень
        case 2: // третий уровень
          // здесь обрабатываем задачу пока не решится павильно
          // когда надо выключать будильник, то выходим из цикла while
          break;
      }
      break;
    }
    print("$task=========== $inputData=================");

    return Future.value(true);
  });
}



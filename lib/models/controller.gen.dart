import 'package:filamentor_app/data/network/models/resp_config.dart';
import 'package:filamentor_app/models/channel.gen.dart';
import 'package:mobx/mobx.dart';

part 'controller.gen.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String id = '';

  @observable
  String alias = '';

  @observable
  String type = '';

  @observable
  String des = '';

  @observable
  ObservableList<Channel> channels = ObservableList();

  ControllerBase({
    required this.id,
    required this.alias,
    required this.type,
    required this.des,
  });
}

ObservableList<Controller> controllerfromConfig(RespConfig config) {
  final ret = ObservableList<Controller>();

  ret.addAll(
    config.controllerList.map((a) {
      var des = '';
      if (a.type == 'yba_ams' || a.type == 'yba_ams_py' || a.type == 'yba_ams_servo') {
        des = a.info.ip;
      }

      ObservableList<Channel> channels = ObservableList();

      for (int i = 0; i < a.info.channelTotal; i++) {
        var bindPrinter = '';
        String? filaType;
        String? filaColor;

        for (var cr in config.channelRelations) {
          if (cr.channel == i) {
            bindPrinter = cr.printerId;
            filaType = cr.filamentType;
            filaColor = cr.filamentColor;
            break;
          }
        }

        channels.add(
          Channel(
            channel: i,
            bindPrinter: bindPrinter,
            controllerId: a.id,
            controllerName: a.alias,
            filamentType: filaType,
            filamentColor: filaColor,
          ),
        );
      }

      return Controller(
        id: a.id,
        type: a.type,
        alias: a.alias,
        des: des,
      )..channels = channels;
    }),
  );

  return ret;
}

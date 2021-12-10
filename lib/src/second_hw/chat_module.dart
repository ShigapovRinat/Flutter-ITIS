import 'package:flutter_modular/flutter_modular.dart';

import 'chat_store.dart';

class ChatModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ChatStore())];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: ChatModule())];
} 
import 'package:fc_path_util/fc_path_util.dart';

void main() {
  print(FCPathUtil.trimExtension('a.b.c.d', '.c.d'));
  // Prints 'a.b'
}

import 'package:fc_path_util/fc_path_util.dart';

void main() {
  print(PathUtil.trimExtension('a.b.c.d', '.c.d'));
  // Prints 'a.b'
}

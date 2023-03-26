import 'package:fc_path_util/fc_path_util.dart';
import 'package:test/test.dart';

void main() {
  test('isHiddenFile', () async {
    expect(PathUtil.isHiddenFile('.DS_Store', false), true);
    expect(PathUtil.isHiddenFile('.a.b', false, dotFiles: true), true);
    expect(PathUtil.isHiddenFile('.DS_Store', true), false);
  });

  test('trimExt', () async {
    expect(PathUtil.trimExtension('aab', '.ke'), 'aab');
    expect(PathUtil.trimExtension('aa.b', '.ke'), 'aa.b');
    expect(PathUtil.trimExtension('aa.b.c', '.ke'), 'aa.b.c');
    expect(PathUtil.trimExtension('.aa.b', '.ke'), '.aa.b');
    expect(PathUtil.trimExtension('a.ke', '.ke'), 'a');
    expect(PathUtil.trimExtension('a.b.ke', '.ke'), 'a.b');
    expect(PathUtil.trimExtension('.a.ke', '.ke'), '.a');
    expect(PathUtil.trimExtension('ke', '.ke'), 'ke');
  });

  test('basenameAndExtensions', () async {
    expect(PathUtil.basenameAndExtensions('a').toString(), 'a');
    expect(PathUtil.basenameAndExtensions('a.b').toString(), 'a[.b]');
    expect(PathUtil.basenameAndExtensions('a.b.c').toString(), 'a[.b.c]');
    expect(PathUtil.basenameAndExtensions('.a').toString(), '[.a]');
    expect(PathUtil.basenameAndExtensions('.a.b').toString(), '[.a.b]');
  });
}

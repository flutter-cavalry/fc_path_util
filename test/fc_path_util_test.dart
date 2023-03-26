import 'package:fc_path_util/fc_path_util.dart';
import 'package:test/test.dart';

void main() {
  test('isHiddenFile', () async {
    expect(FCPathUtil.isHiddenFile('.DS_Store', false), true);
    expect(FCPathUtil.isHiddenFile('.a.b', false, dotFiles: true), true);
    expect(FCPathUtil.isHiddenFile('.DS_Store', true), false);
  });

  test('trimExt', () async {
    expect(FCPathUtil.trimExtension('aab', '.ke'), 'aab');
    expect(FCPathUtil.trimExtension('aa.b', '.ke'), 'aa.b');
    expect(FCPathUtil.trimExtension('aa.b.c', '.ke'), 'aa.b.c');
    expect(FCPathUtil.trimExtension('.aa.b', '.ke'), '.aa.b');
    expect(FCPathUtil.trimExtension('a.ke', '.ke'), 'a');
    expect(FCPathUtil.trimExtension('a.b.ke', '.ke'), 'a.b');
    expect(FCPathUtil.trimExtension('.a.ke', '.ke'), '.a');
    expect(FCPathUtil.trimExtension('ke', '.ke'), 'ke');
  });

  test('basenameAndExtensions', () async {
    expect(FCPathUtil.basenameAndExtensions('a').toString(), 'a');
    expect(FCPathUtil.basenameAndExtensions('a.b').toString(), 'a[.b]');
    expect(FCPathUtil.basenameAndExtensions('a.b.c').toString(), 'a[.b.c]');
    expect(FCPathUtil.basenameAndExtensions('.a').toString(), '[.a]');
    expect(FCPathUtil.basenameAndExtensions('.a.b').toString(), '[.a.b]');
  });
}

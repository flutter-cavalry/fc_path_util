import 'package:path/path.dart' as p;

Set<String> _ignoredFiles = {'.DS_Store', 'Thumbs.db'};
Set<String> _ignoredFolders = {'\$RECYCLE.BIN', 'System Volume Information'};

class PathNameAndExtensions {
  final String name;
  final String extensions;

  PathNameAndExtensions(this.name, this.extensions);

  @override
  String toString() {
    var s = name;
    if (extensions.isNotEmpty) {
      s += '[$extensions]';
    }
    return s;
  }
}

class PathUtil {
  /// Checks if the given file name is considered a hidden file.
  /// If [dotFiles] is true, file names starting with a dot(.) are considered hidden.
  static bool isHiddenFile(String fileName, bool isDir, {bool? dotFiles}) {
    if ((dotFiles ?? false) && fileName.startsWith('.')) {
      return true;
    }
    if (isDir) {
      return _ignoredFolders.contains(fileName);
    }
    return _ignoredFiles.contains(fileName);
  }

  /// Removes the given extension from the [path].
  static String trimExtension(String path, String ext) {
    if (path.endsWith(ext)) {
      return path.substring(0, path.length - ext.length);
    }
    return path;
  }

  /// Returns the basename and extensions of a given [path].
  static PathNameAndExtensions basenameAndExtensions(String path) {
    var bn = p.basename(path);
    var idx = bn.indexOf('.');
    if (idx < 0) {
      return PathNameAndExtensions(bn, '');
    }
    return PathNameAndExtensions(
        idx == 0 ? '' : bn.substring(0, idx), bn.substring(idx));
  }
}

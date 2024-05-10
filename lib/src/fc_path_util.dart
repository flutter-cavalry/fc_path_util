Set<String> _ignoredFiles = {'.DS_Store', 'Thumbs.db'};
Set<String> _ignoredFolders = {'\$RECYCLE.BIN', 'System Volume Information'};

class FCPathUtil {
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
}

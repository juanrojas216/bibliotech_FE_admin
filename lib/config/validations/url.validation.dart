bool isUrl(String url) {
  RegExp exp = RegExp(
    r'^(https?|ftp)://[^\s/$.?#].[^\s]*$',
    caseSensitive: false,
    multiLine: false,
  );
  if (exp.hasMatch(url)) {
    return true;
  }
  return false;
}

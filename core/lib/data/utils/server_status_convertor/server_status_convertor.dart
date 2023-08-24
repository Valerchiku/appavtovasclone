abstract final class ServerStatusConvertor {
  static bool statusConvertor({required int statusCode}) {
    if (statusCode == 200) {
      return true;
    }
    return false;
  }
}

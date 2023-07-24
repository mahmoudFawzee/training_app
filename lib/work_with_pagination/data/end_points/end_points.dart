class EndPoint {
  static String getUrl(int pageIndex) =>
      "https://api.instantwebtools.net/v1/passenger?page=$pageIndex&size=10";
}

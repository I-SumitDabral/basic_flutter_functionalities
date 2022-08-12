enum AppErrorType {
  network("no internet connection found"),
  noData("no data found"),
  database("something went wrong");

  final String message;
  const AppErrorType(this.message);
}

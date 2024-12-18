class ResultState<T> {
  final T? data;
  final String? error;
  final bool isLoading;

  const ResultState._({this.data, this.error, required this.isLoading});

  factory ResultState.loading() => ResultState._(isLoading: true);

  factory ResultState.success(T data) =>
      ResultState._(data: data, isLoading: false);

  factory ResultState.error(String error) =>
      ResultState._(error: error, isLoading: false);

  bool get hasData => data != null && !isLoading && error == null;
}

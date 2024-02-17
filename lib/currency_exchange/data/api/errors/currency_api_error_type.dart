enum CurrencyApiErrorType {
  // wrong access key
  badAccessKey,

  // The maximum allowed API amount of monthly API requests has been reached.
  quotaExceeded,

  // default error
  defaultError,
}

extension CurrencyApiErrorMessage on CurrencyApiErrorType {
  String get errorMessage {
    switch (this) {
      case CurrencyApiErrorType.badAccessKey:
        return "bad access key";
      case CurrencyApiErrorType.quotaExceeded:
        return "API requests has been reached";
      case CurrencyApiErrorType.defaultError:
        return "Something went wrong";
    }
  }
}


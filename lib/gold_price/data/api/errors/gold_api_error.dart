enum GoldApiError {
  // missing api key
  noApiProvided,

  // default
  defaultError,
}

extension GoldApiErrorMessage on GoldApiError {
  String get errorMessage {
    switch (this) {
      case GoldApiError.noApiProvided:
        return "Check the API key";
      case GoldApiError.defaultError:
        return "Something went wrong";
    }
  }
}


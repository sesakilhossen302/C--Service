class GenerelError {
  static String handleErrorMessage(dynamic error) {
    return error?.toString() ?? 'An unexpected error occurred';
  }
}

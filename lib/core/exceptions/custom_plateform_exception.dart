class CustomPlatformException implements Exception {
  final String code;
  // final String message;
  // final String details;

  CustomPlatformException(this.code);

  /// Returns a user-friendly error message based on the PlatformException code.
  String getMessage() {
    switch (code) {
      case "network_error":
        return "Une erreur réseau s'est produite. Veuillez vérifier votre connexion Internet.";
      case "permission_denied":
        return "Vous n'avez pas la permission requise pour effectuer cette action.";
      case "unavailable":
        return "Le service demandé est actuellement indisponible. Veuillez réessayer plus tard.";
      case "not_found":
        return "L'élément demandé n'a pas été trouvé. Veuillez vérifier et réessayer.";
      case "timeout":
        return "Veuillez réessayer plus tard.";
      case "invalid_argument":
        return "Un argument invalide a été fourni. Veuillez vérifier vos entrées.";
      case "unauthorized":
        return "Vous n'êtes pas autorisé à effectuer cette opération.";
      case "already_exists":
        return "L'élément existe déjà.";
      case "cancelled":
        return "L'opération a été annulée.";
      case "internal":
        return "Une erreur interne s'est produite. Veuillez réessayer plus tard.";
      default:
        return "Plateform: Une erreur inconnue est survenue. Veuillez réessayer plus tard.";
    }
  }

  @override
  String toString() => "CustomPlatformException: ${getMessage()}";
}

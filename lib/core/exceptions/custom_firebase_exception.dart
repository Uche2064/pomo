class CustomFirebaseException implements Exception {
  final String code;
  // final String message;

  CustomFirebaseException(
    this.code,
  );

  /// Returns a user-friendly error message based on the FirebaseException code.
  String getMessage() {
    switch (code) {
      case "permission-denied":
        return "Vous n'avez pas la permission nécessaire pour effectuer cette action.";
      case "unavailable":
        return "Le service est actuellement indisponible. Veuillez réessayer plus tard.";
      case "not-found":
        return "La ressource demandée est introuvable. Veuillez vérifier et réessayer.";
      case "already-exists":
        return "La ressource que vous tentez de créer existe déjà.";
      case "cancelled":
        return "L'opération a été annulée.";
      case "data-loss":
        return "Une perte de données s'est produite. Veuillez réessayer plus tard.";
      case "deadline-exceeded":
        return "Veuillez réessayer plus tard.";
      case "failed-precondition":
        return "Les conditions préalables requises pour l'opération n'ont pas été satisfaites.";
      case "internal":
        return "Une erreur interne s'est produite. Veuillez réessayer plus tard.";
      case "invalid-argument":
        return "Un argument invalide a été fourni. Veuillez vérifier vos entrées.";
      case "resource-exhausted":
        return "Les ressources ont été épuisées. Veuillez réessayer plus tard.";
      case "unauthenticated":
        return "Vous devez être authentifié pour effectuer cette opération.";
      case "unknown":
        return "Une erreur inconnue est survenue. Veuillez réessayer plus tard.";
      default:
        return "Une erreur inconnue est survenue. Veuillez réessayer plus tard.";
    }
  }

  @override
  String toString() => "CustomFirebaseException: ${getMessage()}";
}

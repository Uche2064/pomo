class FirebaseAuthExceptionsMessages implements Exception {
  final String code;

  FirebaseAuthExceptionsMessages(this.code);

  /// Returns a user-friendly error message based on the FirebaseAuthException code.
  String getMessage() {
    switch (code) {
      case "invalid-email":
        return "L'adresse e-mail est invalide. Veuillez vérifier et réessayer.";
      case "invalid-credential":
        return "Invalid credentials.";
      case "user-disabled":
        return "Ce compte utilisateur a été désactivé. Veuillez contacter le support.";
      case "user-not-found":
        return "Aucun utilisateur trouvé pour cet identifiant. Veuillez vérifier et réessayer.";
      case "wrong-password":
        return "Le mot de passe est incorrect. Veuillez vérifier et réessayer.";
      case "email-already-in-use":
        return "L'adresse e-mail est déjà utilisée par un autre compte.";
      case "operation-not-allowed":
        return "Cette opération n'est pas autorisée. Veuillez contacter le support.";
      case "weak-password":
        return "Le mot de passe est trop faible. Veuillez choisir un mot de passe plus sécurisé.";
      case "too-many-requests":
        return "Trop de tentatives de connexion infructueuses. Veuillez réessayer plus tard.";
      case "network-request-failed":
        return "Veuillez vérifier votre connexion Internet.";
      default:
        return "FirebaseAuth: Une erreur inconnue est survenue. Veuillez réessayer plus tard.";
    }
  }

  @override
  String toString() => "FirebaseAuthExceptionsMessages: ${getMessage()}";
}

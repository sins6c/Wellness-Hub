class AuthService {
  // Hardcoded credentials
  static const String defaultEmail = 'sins6c@gmail.com';
  static const String defaultPassword = 'Susa1234#\$';

  bool _isAuthenticated = false;

  // Get current authentication status
  bool get isAuthenticated => _isAuthenticated;

  // Stream to simulate auth state changes
  Stream<bool> get authStateChanges => Stream.value(_isAuthenticated);

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (email == defaultEmail && password == defaultPassword) {
      _isAuthenticated = true;
      return true;
    } else {
      throw Exception('Invalid email or password');
    }
  }

  // Register with email and password (temporarily just check against default credentials)
  Future<bool> registerWithEmailAndPassword(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    throw Exception('Registration is currently disabled. Please use the default account.');
  }

  // Sign out
  Future<void> signOut() async {
    _isAuthenticated = false;
  }

  // Reset password (temporarily disabled)
  Future<void> resetPassword(String email) async {
    throw Exception('Password reset is currently disabled.');
  }

  // Update user profile
  Future<void> updateProfile({String? displayName, String? photoURL}) async {
    // Implementation needed
  }
} 
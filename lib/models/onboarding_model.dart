class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  static List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: "Welcome to Wellness Hub",
        description: "Your personal wellness companion for a healthier lifestyle",
        imagePath: "assets/images/onboarding1.png",
      ),
      OnboardingModel(
        title: "Track Your Wellness",
        description: "Monitor your mood, energy, and overall well-being",
        imagePath: "assets/images/onboarding2.png",
      ),
      OnboardingModel(
        title: "Discover Services",
        description: "Explore a wide range of wellness services tailored for you",
        imagePath: "assets/images/onboarding3.png",
      ),
    ];
  }
} 
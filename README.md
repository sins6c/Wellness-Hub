# Wellness Hub

A comprehensive mobile application focused on wellness services and personal health tracking.

## 📋 Overview

Wellness Hub is a Flutter-based mobile application that connects users with various wellness services and provides personal health tracking capabilities. The application features a clean, intuitive UI with smooth animations and transitions, delivering a pleasant user experience across all screens.

## ✨ Features

### Onboarding Experience
- 3-screen onboarding flow with motivational quotes and illustrations
- Smooth page transitions using PageRouteBuilder and animations package
- Clean UI with Poppins font family

### Home Screen
- Promotional banner featuring daily deals and offers
- Grid/list view of available wellness services:
  - Spa Services
  - Home Help
  - Medicines
  - Diet Plans
  - Mental Wellness
  - Pet Therapy Services
- Floating AI Assistant button that opens a chat interface

### Service Details
- Detailed information for each service
- Service title, description, and pricing
- Add to Cart functionality

### Shopping Experience
- Cart management with ability to add/remove services
- Order placement simulation
- Order confirmation screen
- Order history in "Order Again" tab

### Wellness Tracker
- Calendar view for tracking daily wellness metrics
- Log and monitor:
  - Mood
  - Energy level
  - Pain
  - Food cravings
- Local data storage for personal metrics

### User Profile
- Personal information display
- Wellness goals tracking
- Profile editing capability

## 📱 Screenshots
## Onboarding Screen
![Screenshot 2025-04-15 190818](https://github.com/user-attachments/assets/210a7c4c-d0c5-4c32-8e69-84e56120e124)

## Home 
![Screenshot 2025-04-15 190452](https://github.com/user-attachments/assets/417837b3-fc2a-4430-b6a7-fe158267b8d2)

## Tracker
![Screenshot 2025-04-15 190527](https://github.com/user-attachments/assets/7464a0aa-bbfb-499c-ab0c-385484a0f40b)

## Profile
![Screenshot 2025-04-15 190538](https://github.com/user-attachments/assets/31079a9b-7d2d-466c-bc2a-593e4069b8b4)

## Order 

![Screenshot 2025-04-15 190505](https://github.com/user-attachments/assets/a0aa3723-bba7-47d0-a8af-5eb9495c0425)

![Screenshot 2025-04-15 190554](https://github.com/user-attachments/assets/eb1d046a-1ba4-46a1-b860-7c9889f0cd8f)

## ChatBot

![Screenshot 2025-04-15 190831](https://github.com/user-attachments/assets/ac6b0eb2-cf60-432d-ac2e-143e89df1be6)


## 🧩 Project Structure

```
wellness_hub/
├── android/            # Android-specific files
├── ios/                # iOS-specific files
├── lib/
│   ├── main.dart       # Application entry point
│   ├── screens/        # UI screens
│   │   ├── onboarding_screen.dart
│   │   ├── main_screen.dart
│   │   ├── login_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── service_detail_screen.dart
│   │   ├── cart_screen.dart
│   │   ├── orders_screen.dart
│   │   ├── tracker_screen.dart
│   │   ├── chat_bot_screen.dart
│   │   └── wellness_tracker_screen.dart
│   ├── models/         # Data models
│   ├── services/       # Backend services
│   ├── theme/          # UI theme configuration
│   └── widgets/        # Reusable UI components
├── assets/
│   ├── images/         # Image assets
│   │   ├── onboarding1.png
│   │   ├── onboarding2.png
│   │   ├── onboarding3.png
│   │   ├── home_help.jpg
│   │   ├── medicines.jpg
│   │   ├── mental_wellness.jpg
│   │   ├── pet_therapy.jpg
│   │   ├── profile.jpg
│   │   ├── spa.jpg
│   │   └── deals_banner.png
│   └── fonts/          # Font assets
└── test/               # Test files
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/wellness_hub.git
   ```

2. Navigate to the project directory:
   ```
   cd wellness_hub
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

## 📱 Navigation

The app uses a Bottom Navigation Bar with four tabs:
1. Home - Browse available wellness services
2. Wellness Tracker - Track personal health metrics
3. Profile - View and edit user profile information
4. Order Again - View order history

## 🔧 Technologies Used

- Flutter Framework
- Dart Programming Language
- Shared Preferences / Hive for local data storage
- Flutter animations package for transitions
- Calendar packages for wellness tracking

## 📝 Development Notes

### UI/UX Guidelines
- Use Poppins font family
- Implement responsive design for various screen sizes
- Maintain a clean, soft color palette
- Use animations for enhanced user experience

### Data Storage
- User preferences and wellness tracking data are stored locally
- Service and product information is stored in application models

## 🔄 Future Enhancements

- Backend integration with real service providers
- User authentication and account management
- Push notifications for wellness reminders
- Social sharing features
- In-app payment processing




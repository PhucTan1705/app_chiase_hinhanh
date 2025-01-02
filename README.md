# Photo Sharing App

## Overview:

An image-sharing app modeled after Instagram, where users can log in using either Facebook or Google accounts. The app allows users to post images and videos, share their moments with others, 
The app also allows users to search and interact with other users' posts. You can view, like, and comment on the images and videos other share...

<div align="center">
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1B2yGyXxyDd1YS1UHJEEEPIofsQYxZeBi" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1ELoOhPHze191HvMVm6ziPqEeN7uGu6yh" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1lE12h7puuSCO9pnbmhcgSKrqxCQ18Iaq" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1SkDUOsahXitxWHjO-2jH9sB8esklynhQ" width="300" height="530"  hspace="10"></kbd></span>
</div>

## Installation:

### 1. Riverpod 2.x:

```
# Installing the package
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```
Alternatively, you can manually add the dependency to your app from within your pubspec.yaml::
```
pubspec.yaml
name: my_app_name
environment:
  sdk: ">=3.0.0 <4.0.0"
  flutter: ">=3.0.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1

dev_dependencies:
  build_runner:
  custom_lint:
  riverpod_generator: ^2.6.3
  riverpod_lint: ^2.6.3
```

[Learn More](https://riverpod.dev/docs/introduction/why_riverpod)

### 2. Getting started with Firebase

Firebase Extensions help you reduce time spent on development, maintenance, and growth of your app.

When you find a Firebase Extension that solves a need for your app or project, all you do is install and configure the extension. If you need multiple configurations of the extension, you can install the extension multiple times, with a different configuration for each instance you install.

[Learn more](https://firebase.google.com/docs/extensions/overview-use-extensions)

If you're new to using Firebase in Flutter we recommend starting with:

- [Get to know Firebase for Flutter](https://firebase.google.com/codelabs/firebase-get-to-know-flutter#0)

### 3. Set up Firebase

- Before any Firebase services can be used, you must first install the firebase_core plugin, which is responsible for connecting your application to Firebase.

```
# Install the plugin by running the following command from the project root:
flutter pub add firebase_core
```

- Using the FlutterFire CLI

```
# Install the CLI if not already done so
dart pub global activate flutterfire_cli

# Run the `configure` command, select a Firebase project and platforms
flutterfire configure
```

[Learn More](https://firebase.flutter.dev/docs/overview/)

- With Dart-only initialization now supported, manually configuring and installing platforms is no longer required

[Manual Installation](https://firebase.flutter.dev/docs/manual-installation)

### 4. Set up project:

- Clone the repo
```
git clone https://github.com/PhucTan1705/app_chiase_hinhanh.git
```
- Install packages:
```
flutter pub get
```
- Run app:
```
flutter run lib/main.dart
```
- Run test
```
flutter test
```


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

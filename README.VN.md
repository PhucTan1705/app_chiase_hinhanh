# Language
[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/PhucTan1705/app_chiase_hinhanh/blob/master/README.md)
[![vn](https://img.shields.io/badge/lang-vn-red.svg)](https://github.com/PhucTan1705/app_chiase_hinhanh/blob/master/README.VN.md)

---

# Photo Sharing App

## Tổng quan:

Một ứng dụng chia sẻ hình ảnh được mô phỏng theo Instagram, nơi người dùng có thể đăng nhập bằng tài khoản Facebook hoặc Google. Ứng dụng cho phép người dùng đăng hình ảnh và video, chia sẻ những khoảnh khắc của mình với người khác.
Ứng dụng cũng cho phép bạn tìm kiếm và tương tác với các bài đăng của những người dùng khác. Bạn có thể xem, thích và bình luận trên các hình ảnh và video mà người dùng khác chia sẻ...

<div align="center">
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1B2yGyXxyDd1YS1UHJEEEPIofsQYxZeBi" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1ELoOhPHze191HvMVm6ziPqEeN7uGu6yh" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1lE12h7puuSCO9pnbmhcgSKrqxCQ18Iaq" width="300" height="530"  hspace="10"></kbd></span>
  <span><kbd><img src="https://drive.google.com/uc?export=view&id=1SkDUOsahXitxWHjO-2jH9sB8esklynhQ" width="300" height="530"  hspace="10"></kbd></span>
</div>

## Cài đặt:

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

Ngoài ra, bạn có thể thêm thủ công dependency vào ứng dụng của mình trong tệp pubspec.yaml:

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

[Tìm Hiểu Thêm](https://riverpod.dev/docs/introduction/why_riverpod)

### 2. Làm quen với Firebase


Firebase Extensions giúp bạn tiết kiệm thời gian trong việc phát triển, bảo trì và mở rộng ứng dụng của mình. Khi bạn tìm thấy một Firebase Extension phù hợp với nhu cầu của ứng dụng hoặc dự án, 
bạn chỉ cần cài đặt và cấu hình extension đó. Nếu cần nhiều cấu hình khác nhau cho cùng một extension, bạn có thể cài đặt extension nhiều lần với cấu hình riêng biệt cho từng phiên bản.

[Tìm Hiểu Thêm](https://firebase.google.com/docs/extensions/overview-use-extensions)


Nếu bạn mới bắt đầu sử dụng Firebase trong Flutter, chúng tôi khuyên bạn nên bắt đầu với:

[Tìm hiểu về Firebase dành cho Flutter](https://firebase.google.com/codelabs/firebase-get-to-know-flutter#0)

### 3. Cài đặt Firebase

- Trước khi có thể sử dụng bất kỳ dịch vụ nào của Firebase, bạn cần cài đặt plugin firebase_core, plugin này chịu trách nhiệm kết nối ứng dụng của bạn với Firebase.

```
# Cài đặt plugin bằng cách chạy lệnh sau từ thư mục gốc của dự án:
flutter pub add firebase_core
```

- Sử dụng FlutterFire CLI

```
# Cài đặt CLI nếu bạn chưa cài đặt.
dart pub global activate flutterfire_cli

# Chạy lệnh configure, chọn một dự án Firebase và các nền tảng.
flutterfire configure
```

[Tìm Hiểu Thêm](https://firebase.flutter.dev/docs/overview/)

- Với việc khởi tạo chỉ bằng Dart đã được hỗ trợ, việc cấu hình và cài đặt nền tảng thủ công không còn cần thiết nữa. Nếu bạn muốn xem tài liệu về khởi tạo thủ công, bạn có thể tìm hiểu thêm tại đây:

[Cài đặt thủ công](https://firebase.flutter.dev/docs/manual-installation)

### 4. Cài đặt dự án:

- Sao chép (clone) repo:
```
git clone https://github.com/PhucTan1705/app_chiase_hinhanh.git
```
- Cài các gói (packages):
```
flutter pub get
```
- Chạy ứng dụng:
```
flutter run lib/main.dart
```
- Chạy test:
```
flutter test
```



SHELL=/bin/bash

.PHONY: $(shell egrep -oh ^[a-zA-Z0-9][a-zA-Z0-9_-]+: $(MAKEFILE_LIST) | sed 's/://')

# プロジェクトのクリーンを行う
.PHONY: clean
clean:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs

# freezed関連のファイルを修正したら、以下の自動生成コマンドを実行してください
.PHONY: run-gen
run-gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

# format + 静的解析の実行結果を確認する
.PHONY: check 
check:
	fvm dart format --output=none . > format_result.txt
	fvm flutter analyze > analyze_result.txt
	fvm flutter test > test_result.txt

# formatを適用する
.PHONY: format
format:
	fvm flutter pub run import_sorter:main
	fvm dart format .

# pubspec.yamlに記載の全てのpackageのUpdateを行う
.PHONY: pub-upgrade
pub-upgrade:
	fvm flutter pub upgrade

# https://docs.flutter.dev/deployment/android
.PHONY: build-android-dev
build-android-dev:
	fvm flutter build apk --release --dart-define-from-file=dart_define/development.json

.PHONY: build-android-stg
build-android-stg:
	fvm flutter build apk --release --dart-define-from-file=dart_define/staging.json

.PHONY: build-android-prod
build-android-prod:
	fvm flutter build apk --release --dart-define-from-file=dart_define/production.json

.PHONY: build-android-bundle
build-android-bundle:
	fvm flutter build appbundle --release --dart-define-from-file=dart_define/production.json

# https://docs.flutter.dev/deployment/ios
.PHONY: build-ios
build-ios:
	fvm flutter build ios --release --dart-define-from-file=dart_define/production.json

.PHONY: build-ipa
build-ipa:
	fvm flutter build ipa --release --dart-define-from-file=dart_define/production.json

# https://docs.flutter.dev/deployment/macos
.PHONY: build-macos
build-macos:
	fvm flutter build macos --release --dart-define-from-file=dart_define/production.json

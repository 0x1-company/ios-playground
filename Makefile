PLATFORM_IOS = iOS Simulator,name=iPhone 16 Pro,OS=18.4

bootstrap: secrets

open:
	open Playground.xcodeproj

build:
	@xcodebuild build \
		-project Playground.xcodeproj \
		-scheme "Playground" \
		-destination platform="$(PLATFORM_IOS)"

format:
	@swift build -c release --package-path ./SwiftScripts/SwiftFormatTool --product swiftformat
	./SwiftScripts/SwiftFormatTool/.build/release/swiftformat ./

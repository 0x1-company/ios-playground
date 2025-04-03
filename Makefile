PLATFORM_IOS = iOS Simulator,id=$(call udid_for,iPhone)

bootstrap: secrets

open:
	open Playground.xcodeproj

build:
	@xcodebuild build \
		-project Playground.xcodeproj \
		-scheme "Playground" \
		-destination platform="$(PLATFORM_IOS)"

format:
	find . \
		-name '*.swift' \
		-not -path '*/.*' -print0 \
		| xargs -0 xcrun swift-format --ignore-unparsable-files --in-place

define udid_for
$(shell xcrun simctl list --json devices available '$(1)' | jq -r '[.devices|to_entries|sort_by(.key)|reverse|.[].value|select(length > 0)|.[0]][0].udid')
endef
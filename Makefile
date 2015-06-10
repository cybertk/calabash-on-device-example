bootstrap:
	npm install -g ios-deploy
	bundle install
	bundle exec calabash-ios run

build:
	xcodebuild build -xcconfig "Calabash/cal.xcconfig" -configuration "Debug" -sdk "iphoneos" DSTROOT="Calabash/build" WRAPPER_NAME="Calabash.app"
	#ipa build  --xcconfig Calabash/cal.xcconfig -c "Debug" 

install:
	ios-deploy -b Calabash/build/Calabash.app

test: build install
	BUNDLE_ID=com.cybertk.CalabashOnDeviceExample DEVICE_ENDPOINT=http://10.0.1.199:37265 cucumber

.PHONY: all bootstrap clean install build test uninstall

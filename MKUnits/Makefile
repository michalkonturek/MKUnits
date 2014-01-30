PROJECT_NAME=MKUnits
WORKSPACE=$(PROJECT_NAME).xcworkspace
SCHEME=$(PROJECT_NAME)
FLAGS=-sdk iphonesimulator
TESTING_TOOL=xcodebuild

TASK=$(TESTING_TOOL) -workspace $(WORKSPACE) -scheme $(SCHEME) $(FLAGS)

all:	clean build test
		
clean:
		$(TASK) clean | xcpretty -c

build:
		$(TASK) build | xcpretty -c

test:
		$(TASK) clean build test | xcpretty -tc

ci:
		$(TASK) clean build test | xcpretty -c
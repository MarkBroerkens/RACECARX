all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build            - build all images"
	@echo "   2. make pull             - pull all images"
	@echo "   3. make clean            - remove all images"
	@echo ""

build:
	(cd ros/melodic/ubuntu/bionic; make build)
	(cd racecarx; make build)

pull:
	(cd ros/melodic/ubuntu/bionic; make pull)
	(cd racecarx; make pull)

clean:
	(cd ros/melodic/ubuntu/bionic; make clean)
	(cd racecarx; make clean)


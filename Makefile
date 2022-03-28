# Usage
# make clean 	# deletes generated README.md file
# make all # Run specified tasks


# Note: Makefiles require that you use 'tabs' not 'spaces'
all: clean png jpeg gif template
setup:
	rm -f photos/foo.jpg
	rm -f photos/bar.jpg
	rm -f CAD/cube.gif
	rm -f CAD/cube.stl
	rm -f CAD/cube.png
	rm -f CAD/sphere.gif
	rm -f CAD/sphere.stl
	rm -f CAD/sphere.png
clean:
	./CAD-scripts/clean.sh
png:
	./CAD-scripts/stl2png.sh
jpeg:
	./CAD-scripts/heic2jpeg.sh
gif:
	./CAD-scripts/stl2gif.sh
template:
	./CAD-scripts/yaml2md.rb
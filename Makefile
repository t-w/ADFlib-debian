
BUILD_DIR = build

all: assemble quilt3 deb


deb:
	cd $(BUILD_DIR)/ADFlib ; debuild -us -uc

quilt3:
	util/deb_create_quilt3_archive.sh

assemble: ADFlib/configure.ac $(BUILD_DIR)/ADFlib
	util/assemble_project.sh

$(BUILD_DIR)/ADFlib:
	mkdir -pv $@

ADFlib/configure.ac:
	git submodule init
	git submodule update

clean:
	rm -rfv $(BUILD_DIR)

.PHONY: all deb quilt3 assemble clean

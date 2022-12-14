# list all available commands
default:
  just --list

# store various dirs and filepaths
FILE_URI := justfile_directory() + "/index.ipynb"
BUILD_DIR := justfile_directory() + "/_build/"

# remove build files
clean:
    rm -fr {{BUILD_DIR}}
    rm -fr {{justfile_directory()}}/.quarto

# create conda env and install all deps
setup name="mining-ack":
    conda env create -n {{name}} --file {{justfile_directory()}}/environment.yml

# watch file, build, and serve
watch:
    quarto preview {{FILE_URI}} --to html

# build page
build:
    quarto render {{FILE_URI}} --to html --execute
    touch {{BUILD_DIR}}.nojekyll
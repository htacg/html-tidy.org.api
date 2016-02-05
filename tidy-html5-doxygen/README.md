Build Documentation
===================

In addition to hosting the http://api.html-tidy.org website, this repository
also includes our tool for generating the appropriate `quickref.html` file and
the Doxygen project for generating the full API reference. These can be used
independently of this website.

Prerequisites
-------------

### tidy-html5 Submodule
This repository references our tidy-html5 repository as git submodule. Before
the build tool will work, you will also have to ensure that the submodule is
updated. You might do with is `git submodule update --init --recursive` if you
have cloned this repository non-recursively.

You will know you failed to pull the submodule if the `tidy-html5` directory is
empty.

### `xsltproc`
Our build tools require [`xsltproc`](http://xmlsoft.org/XSLT/xsltproc.html) to 
transform Tidy's XML output into something that can be used in our 
documentation. Please ensure it is in your `$PATH`.

### `doxygen`
Our build tools require [`doxygen`](http://www.stack.nl/~dimitri/doxygen/) to
generate the API Reference website from Tidy's headers. Please ensure it is in
your `$PATH`.

### `tidy`
Our build tool requires HTML Tidy, of course. When you use `build_docs.sh` you
can specify a complete path to the Tidy that you wish to use. If you don't
specify a path, then the tool will automatically try to check this project's
`tidy-html5/build/cmake` directory (the default CMake build directory), and
failing that use your default Tidy (as revealed with `which tidy`).


Build
-----

From the `tidy-html5-doxygen/` directory, simply execute:

`./build_docs.sh <tidypath>`

The `<tidypath>` is optional as described in the prerequisites.

Output will be put into `tidy-html5-doxygen/output/`.


Update the Website
------------------

If you want to update the website with the new documentation, that will have
to be performed manually. This is not automated in the build process because
we don't want to accidentally overwrite our existing files.


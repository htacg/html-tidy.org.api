Build Documentation
===================

In addition to hosting the http://api.html-tidy.org website, this repository
also includes our tool for generating the appropriate `quickref.html` file and
the Doxygen project for generating the full API reference. These can be used
independently of this website.

Prerequisites
-------------

### tidy-html5
This repository requires a `tidy-html5` source repository from which to gather
information. In order for the build tool will work, you will have to ensure that
it is referencing a correct version of the repository.

The `tidy-html5` directory must be install in parallel (at the same directory
level) is this repository.

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
specify a path, then the tool will automatically try to check the required
`tidy-html5/build/cmake` directory (the default CMake build directory).


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

### Places the files

First move or copy `output/quickref_x.x.x.html` and `output/tidylib_api_x.x.x/`
into this repository's root-level `tidy/` directory.

### Update the data source

The website will be updated automatically from versions that are present in
`_data/api_versions.yml`. Simply update this file with a new version.

Versions will be displayed on the page in the same order as they are in this 
file, so it is suggested that you maintain the newest versions on top.

Also keep in mind that links are generated automatically from the version
number. Please keep them simple instead of being creative and fancy!

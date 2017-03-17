#!/usr/bin/env bash

################################################################################
# This script will generate the API documentation and quick reference for our
# http://api.html-tidy.org website.
#
# Requires tidy-html5/ source project directory as per PATH_TIDY_HTML5.
#
# This script will attempt to find Tidy in the following locations:
#  - command line argument
#  - ${PATH_TIDY_HTML5}/build/cmake/
#
################################################################################


###########################################################
# Setup
###########################################################
SCRIPT=$(basename $0)

PATH_TIDY_HTML5="../../tidy-html5"

TIDY_PATH="$PATH_TIDY_HTML5/build/cmake/tidy"
OUTP_DIR="./output"

DOXY_CFG="./doxygen.cfg"

PATH_SRC="$PATH_TIDY_HTML5/src"
PATH_INC="$PATH_TIDY_HTML5/include"


###########################################################
# Usage
###########################################################
usage()
{
    cat << HEREDOC

Usage: $SCRIPT [tidy_path]

    This script builds the API documentation for http://api.html-tidy.org,
    and requires a version of Tidy and its source code in order to run.
    
    This source code MUST exist in the "../../tidy-html5" directory, i.e.,
    in parallel to this project directory.
    
    This script expects tidy to already have been built in
    "../../tidy-html5/build/cmake/tidy"; however you can optionally
    specify [tidy_path] as an argument, indicating the path to Tidy
    in case you have built it in a differnet location or have moved it.

HEREDOC
}


###########################################################
# Accept command line argument
###########################################################
if [ ! -z "$1" ]; then
    TIDY_PATH="$1"
fi


###########################################################
# Ensure that Tidy is executable.
###########################################################
if ! "$TIDY_PATH" -v >/dev/null 2>&1; then
    usage
    echo "    $TIDY_PATH is not executable!"
    echo
    exit 1
fi


###########################################################
# Ensure that tidy-html5 is where it's supposed to be.
###########################################################
if [ ! -d "$PATH_TIDY_HTML5" ]; then
    usage
    echo "    $PATH_TIDY_HTML5 does not exist!"
    echo
    exit 1
fi


###########################################################
# Ensure the xsltproc requirement is met.
###########################################################
if [[ ! -x "$(command -v xsltproc)" ]]; then
	echo "Aborting: 'xsltproc' not found, but is required to use this script."
	exit 1
fi


###########################################################
# Ensure the doxygen requirements are met.
###########################################################
if [[ ! -x "$(command -v doxygen)" ]]; then
	echo "Aborting: 'doxygen' not found, but is required to use this script."
	exit 1
fi

if [ ! -f "$DOXY_CFG" ]; then
	echo "Aborting: '$DOXY_CFG' not found. It is required to configure doxygen."
	exit 1
fi

if [ ! -d "$PATH_SRC" ]; then
	echo "Aborting: Directory '$PATH_SRC' not found. It is required to run doxygen."
	echo "          Are you sure the tidy-html5 submodule has been included?"
	exit 1
fi

if [ ! -d "$PATH_INC" ]; then
	echo "Aborting: Directory '$PATH_INC' not found. It is required to run doxygen."
	echo "          Are you sure the tidy-html5 submodule has been included?"
	exit 1
fi


###########################################################
# Let's get a version number from Tidy.
###########################################################
TIDY_VERSION_STRING="$($TIDY_PATH -v)"
TIDY_VERSION="$(echo $TIDY_VERSION_STRING | sed 's/.*\([[:digit:]]\.[[:digit:]]\.[[:digit:]]\)/\1/')"


###########################################################
# Additional variables needed by the configuration:
###########################################################
PATH_QUICKREF="quickref_$TIDY_VERSION.html"
PATH_WEBSITE="tidylib_api_$TIDY_VERSION"
PATH_QUICKREF_INCLUDE="$OUTP_DIR/quickref_include.html"


###########################################################
# All systems go, so let's tell the user what's going on.
###########################################################
cat << HEREDOC

  The script is generating the versioned 'quickref.html' file and the Tidy API
  reference website for Tidy $TIDY_VERSION_STRING,
  which is located at $TIDY_PATH.
  
  The following files/directories will be placed into $OUTP_DIR/:

  '$PATH_QUICKREF' is the quick reference card.
  '$PATH_WEBSITE/' is the Doxygen-generated website.
  
  If you are running this script to add newer documentation to our website,
  then you should manually move these files into './tidy', and then update
  '_data/api_versions.yml' with a new version.

HEREDOC


###########################################################
# Ensure the output dir exists.
###########################################################
if [ ! -d "$OUTP_DIR" ]; then
	echo "$SCRIPT is creating $OUTP_DIR..."
	mkdir "$OUTP_DIR"
fi


###########################################################
# Build 'quickref_xxx.html' and 'quickref_include.html'
###########################################################

# Use the designated tidy to get its configuration.
$TIDY_PATH -xml-config > "$OUTP_DIR/tidy-config.xml"

# 'quickref.html'
# 'quickref_include.html' for the Doxygen build
xsltproc "./quickref.xsl" "$OUTP_DIR/tidy-config.xml" > "$OUTP_DIR/$PATH_QUICKREF"
xsltproc "./quickref.include.xsl" "$OUTP_DIR/tidy-config.xml" > "$PATH_QUICKREF_INCLUDE"

# Tidy quickref.html
$TIDY_PATH -quiet -config "./tidy-quickref.cfg" -modify "$OUTP_DIR/$PATH_QUICKREF" >& /dev/null

# Cleanup
rm "$OUTP_DIR/tidy-config.xml"

echo "** $SCRIPT: '$PATH_QUICKREF' and '$PATH_QUICKREF_INCLUDE' have been built."
echo


###########################################################
# Build the Doxygen project.
###########################################################
echo "  The following block contains doxygen's stderr output and does not"
echo "  indicate errors with this $SCRIPT script:"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

## this lot 
# - echoes and catches output of the doxygen config
# - overwrites some vars but appending some to config at end
# - which are then passed to doxygen as stdin (instead of the path to a config.file)
( cat "$DOXY_CFG"; \
  echo "INPUT=\"$PATH_INC\" \"$PATH_SRC\" \"./\" \"./pages/\" \"./pages/general\" \"./pages/libtidy\" \"./pages/programming\""
  echo "INCLUDE_PATH=\"$PATH_SRC\""
  echo "OUTPUT_DIRECTORY=\"$OUTP_DIR\""
  echo "EXAMPLE_PATH=\"$OUTP_DIR\""
  echo "PROJECT_NUMBER=$TIDY_VERSION"
  echo "HTML_OUTPUT=\"$PATH_WEBSITE\""
  echo "HTML_EXTRA_FILES= sun_blast.svg"; ) \
| doxygen - > /dev/null

# cleanup
rm "$PATH_QUICKREF_INCLUDE"

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo
echo "** $SCRIPT: TidyLib API documentation has been built."
echo
echo "Done."
echo


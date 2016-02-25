#!/bin/sh

################################################################################
# This script will generate the API documentation and quick reference for our
# http://api.html-tidy.org website.
#
# This repository includes the tidy-html5 repository as a git submodule for
# convenience, and this script depends on files in this submodule!
#
# This script will attempt to find Tidy in the following locations:
#  - command line argument
#  - tidy-html5/build/cmake/
#  - the currently installed tidy
#
################################################################################


###########################################################
# Setup
###########################################################
SCRIPT=$(basename $0)

PATH_TIDY_HTML5="../tidy-html5"

TIDY_PATH="$PATH_TIDY_HTML5/build/cmake/tidy"
OUTP_DIR="./output"

DOXY_CFG="./doxygen.cfg"
PATH_EXAMPLES="./examples"

NAME_LICENSE="LICENSE.md"
PATH_LICENSE="$PATH_TIDY_HTML5/README/$NAME_LICENSE"
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
    
    This source code MUST exist in the "html-tidy.org.api/tidy-html5"
    directory.
    
    This script expects tidy to already have been built in
    "html-tidy.org.api/tidy-html5/build/cmake/tidy"; however you can
    optionally you can specify [tidy_path] as an argument, indicating the
    path to Tidy in case you have built it in a differnet location or have
    moved it.

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
    echo "    $TIDY_PATH is not executable!\n"
    exit 1
fi


###########################################################
# Ensure that tidy-html5 is where it's supposed to be.
###########################################################
if [ ! -d "$PATH_TIDY_HTML5" ]; then
    usage
    echo "    $PATH_TIDY_HTML5 does not exist!\n"
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

if [ ! -d "$PATH_EXAMPLES" ]; then
	echo "Aborting: Directory '$PATH_EXAMPLES' not found. It is required to run doxygen."
	exit 1
fi

if [ ! -f "$PATH_LICENSE" ]; then
	echo "Aborting: '$PATH_LICENSE' not found. It is required to run doxygen."
	echo "          Are you sure the tidy-html5 submodule has been included?"
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
PATH_QUICKREF_INCLUDE="$PATH_EXAMPLES/quickref_include.html"


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
  then you should manually move these files into './tidy', and then update the
  './index/_posts/*' files to ensure they are included.

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
$TIDY_PATH -quiet -config "./tidy.cfg" -modify "$OUTP_DIR/$PATH_QUICKREF" >& /dev/null

# Cleanup
rm "$OUTP_DIR/tidy-config.xml"

echo "** $SCRIPT: '$PATH_QUICKREF' and '$PATH_QUICKREF_INCLUDE' have been built.\n"


###########################################################
# Build the Doxygen project.
###########################################################
echo "  The following block contains doxygen's stderr output and does not"
echo "  indicate errors with this $SCRIPT script:"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

# echo the output of `tidy --help` so we can include
$TIDY_PATH -h > "$PATH_EXAMPLES/tidy.help.txt"
$TIDY_PATH -help-config > "$PATH_EXAMPLES/tidy.config.txt"

# copy license file to examples for including
cp "$PATH_LICENSE" "$PATH_EXAMPLES"

## this lot 
# - echoes and catches output of the doxygen config
# - overwrites some vars but appending some to config at end
# - which are then passed to doxygen as stdin (instead of the path to a config.file)
( cat "$DOXY_CFG"; \
  echo "INPUT=\"$PATH_INC\" \"./\" \"./pages\""
  echo "INCLUDE_PATH=\"$PATH_SRC\""; \
  echo "EXCLUDE=\"$PATH_INC/tidyplatform.h\""
  echo "OUTPUT_DIRECTORY=\"$OUTP_DIR\""
  echo "PROJECT_NUMBER=$TIDY_VERSION"; \
  echo "HTML_OUTPUT=\"$PATH_WEBSITE\""
  echo "GENERATE_TAGFILE=\"$OUTP_DIR/$PATH_WEBSITE/tidy.tags\""; \
  echo "HTML_EXTRA_FILES= $PATH_EXAMPLES/tidy.help.txt $PATH_EXAMPLES/tidy.config.txt"; ) \
| doxygen - > /dev/null

# cleanup
rm "$PATH_EXAMPLES/tidy.help.txt"
rm "$PATH_EXAMPLES/tidy.config.txt"
rm "$PATH_EXAMPLES/$NAME_LICENSE"

echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "\n** $SCRIPT: TidyLib API documentation has been built."

echo "\nDone.\n"

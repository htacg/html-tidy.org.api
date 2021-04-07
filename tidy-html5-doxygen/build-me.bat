@setlocal
@REM #!/usr/bin/env bash

@REM ################################################################################
@REM # This script will generate the API documentation and quick reference for our
@REM # http://api.html-tidy.org website.
@REM #
@REM # Requires tidy-html5/ source project directory as per PATH_TIDY_HTML5.
@REM #
@REM # This script will attempt to find Tidy in the following locations:
@REM #  - command line argument
@REM #  - ${PATH_TIDY_HTML5}/build/cmake/
@REM #
@REM ################################################################################


@REM ###########################################################
@REM # Setup
@REM ###########################################################
@set SCRIPT=build-me.bat
@set TMPLOG=bldlog-1.txt

@set PATH_TIDY_HTML5=..\..\tidy-html5

@set TIDY_PATH=%PATH_TIDY_HTML5%\build\win64\release\tidy.exe
@set OUTP_DIR=output

@set DOXY_CFG=doxygen.cfg

@set PATH_SRC=%PATH_TIDY_HTML5%\src
@set PATH_INC=%PATH_TIDY_HTML5%\include
@set PATH_CONSOLE=%PATH_TIDY_HTML5%\console\tidy.c


@REM ###########################################################
@REM # Accept command line argument
@REM ###########################################################
@REM if NOT "$~1x" == "x" (
@REM     @set TIDY_PATH=%1
@REM )

@REM ###########################################################
@REM # Ensure that Tidy is executable.
@REM ###########################################################
%TIDY_PATH% -v >nul 2>&1
@if ERRORLEVEL 1 (
    @echo     %TIDY_PATH% is not executable!
    @echo.
    @exit /b 1
)

@REM ###########################################################
@REM # Ensure that tidy-html5 is where it's supposed to be.
@REM ###########################################################
@if NOT EXIST %PATH_TIDY_HTML5%\nul (
    @REM usage
    @echo     %PATH_TIDY_HTML5% does not exist!
    @echo.
    @exit /b 1
)


@REM ###########################################################
@REM # Ensure the xsltproc requirement is met.
@REM ###########################################################
@xsltproc --version >nul
@if ERRORLEVEL 1 (
	@echo Aborting: 'xsltproc' not found, but is required to use this script.
	@exit /b 1
)


@REM ###########################################################
@REM # Ensure the doxygen requirements are met.
@REM ###########################################################
@doxygen --version >nul
@if ERRORLEVEL 1 (
	@echo Aborting: 'doxygen' not found, but is required to use this script.
	@exit /b 1
)

@if NOT EXIST %DOXY_CFG% (
	@echo Aborting: %DOXY_CFG% not found. It is required to configure doxygen.
	@exit /b 1
)

@if NOT EXIST %PATH_SRC%\nul (
	@echo Aborting: Directory '%PATH_SRC%' not found. It is required to run doxygen.
	@echo         Are you sure the tidy-html5 submodule has been included?
	@exit /b 1
)

if NOT EXIST %PATH_INC%\nul (
	@echo Aborting: Directory '%PATH_INC%' not found. It is required to run doxygen.
	@echo          Are you sure the tidy-html5 submodule has been included?
	@exit /b 1
)


@REM ###########################################################
@REM # Let's get a version number from Tidy.
@REM ###########################################################
@REM @set TIDY_VERSION_STRING="$($TIDY_PATH -v)"
@REM TIDY_VERSION="$(echo $TIDY_VERSION_STRING | sed 's/.*\([[:digit:]]\.[[:digit:]]\.[[:digit:]]\)/\1/')"
@set TMPOUT=%TEMP%\tv.txt
@tidy5 -v > %TMPOUT% 2>&1
@type %TMPOUT%
@set /p TMPVER=<%TMPOUT%
@echo Version: %TMPVER%
@set TMPV=%TMPVER%

:LOOP
@for /F "tokens=1*" %%a in ("%TMPV%") do @(
   @REM echo %%a
   @set TMPV=%%b
   @set TIDY_VERSION=%%a
)
@if defined TMPV goto :LOOP
@echo TIDY_VERSION=%TIDY_VERSION%

@REM ###########################################################
@REM # Additional variables needed by the configuration:
@REM ###########################################################
@set PATH_QUICKREF=quickref_%TIDY_VERSION%.html
@set PATH_WEBSITE=tidylib_api_%TIDY_VERSION%
@set PATH_QUICKREF_INCLUDE=%OUTP_DIR%\quickref_include.html


@REM ###########################################################
@REM # All systems go, so let's tell the user what's going on.
@REM ###########################################################
@echo.
@echo  The script is generating the versioned 'quickref.html' file and the Tidy API
@echo   reference website for Tidy %TMPVER%,
@echo   which is located at %TIDY_PATH%.
@echo.  
@echo  The following files/directories will be placed into '%OUTP_DIR%'
@if EXIST %OUTP_DIR%\nul (
@echo  The previous will be DELETED!
)
@echo.
@echo  File: '%PATH_QUICKREF%' is the quick reference card.
@echo  Directory: '%PATH_WEBSITE%' is the Doxygen-generated website.
@echo.  
@echo  If you are running this script to add newer documentation to our website,
@echo  then you should manually move these files into './tidy', and then update
@echo  '_data/api_versions.yml' with a new version.
@echo.
@echo  Most of the output will be written to the '%TMPLOG%' file...
@echo.
@pause

@REM Create a build log...
@echo Build doxygen API docs %DATE% %TIME% > %TMPLOG%

@REM ###########################################################
@REM # Ensure a NEW blank output dir exists.
@REM ###########################################################
@if EXIST %OUTP_DIR%\nul (
@rd /S /Q %OUTP_DIR%
)
@if NOT EXIST %OUTP_DIR% (
	@echo %SCRIPT% is creating %OUTP_DIR%... >> %TMPLOG%
	@md %OUTP_DIR%
) else (
    @echo Removing OLD directory FAILED!
    @exit /b 1
)

@REM ###########################################################
@REM # Build 'quickref_xxx.html' and 'quickref_include.html'
@REM ###########################################################

@REM # Use the designated tidy to get its configuration.
%TIDY_PATH% -xml-config > %OUTP_DIR%\tidy-config.xml

@REM # 'quickref.html'
@REM # 'quickref_include.html' for the Doxygen build
@xsltproc quickref.xsl %OUTP_DIR%\tidy-config.xml > %OUTP_DIR%\%PATH_QUICKREF%
@xsltproc quickref.include.xsl %OUTP_DIR%\tidy-config.xml > %PATH_QUICKREF_INCLUDE%

@REM # Tidy quickref.html
@%TIDY_PATH% -quiet -config tidy-quickref.cfg -modify %OUTP_DIR%\%PATH_QUICKREF% >nul

@REM # Cleanup
@REM del %OUTP_DIR%\tidy-config.xml

@echo ** %SCRIPT% '%PATH_QUICKREF%' and '%PATH_QUICKREF_INCLUDE%' have been built.
@echo ** %SCRIPT% '%PATH_QUICKREF%' and '%PATH_QUICKREF_INCLUDE%' have been built. >> %TMPLOG%
@echo.


@REM ###########################################################
@REM # Build the Doxygen project.
@REM ###########################################################
@echo  The following block contains doxygen's stderr output and does not >> %TMPLOG%
@echo   indicate errors with this %SCRIPT% script: >> %TMPLOG%
@echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- >> %TMPLOG%

@REM ## this lot 
@REM # - echoes and catches output of the doxygen config
@REM # - overwrites some vars but appending some to config at end
@REM # - which are then passed to doxygen as stdin (instead of the path to a config.file)
@REM ( cat "$DOXY_CFG"; \
@REM   echo "INPUT=\"$PATH_INC\" \"$PATH_SRC\" \"$PATH_CONSOLE\" \"./\" \"./pages/\" \"./pages/general\" \"./pages/libtidy\" \"./pages/programming\""
@REM   echo "INCLUDE_PATH=\"$PATH_SRC\""
@REM   echo "OUTPUT_DIRECTORY=\"$OUTP_DIR\""
@REM   echo "EXAMPLE_PATH=\"$OUTP_DIR\""
@REM   echo "PROJECT_NUMBER=$TIDY_VERSION"
@REM   echo "HTML_OUTPUT=\"$PATH_WEBSITE\""
@REM   echo "HTML_EXTRA_FILES= sun_blast.svg"; ) \
@REM  doxygen -  /dev/null
@set TMPCFG=temp.cfg
@echo Creating %TMPCFG% config, for doxygen... >> %TMPLOG%
@copy %DOXY_CFG% %TMPCFG% >nul
@echo INPUT=%PATH_INC% %PATH_SRC% %PATH_CONSOLE% . pages pages\general pages\libtidy pages\programming >> %TMPCFG%
@echo INCLUDE_PATH=%PATH_SRC% >> %TMPCFG%
@echo OUTPUT_DIRECTORY=%OUTP_DIR% >> %TMPCFG%
@echo EXAMPLE_PATH=%OUTP_DIR% >> %TMPCFG%
@echo PROJECT_NUMBER=%TIDY_VERSION% >> %TMPCFG%
@echo HTML_OUTPUT=%PATH_WEBSITE% >> %TMPCFG%
@echo HTML_EXTRA_FILES=sun_blast.svg >> %TMPCFG%
@echo Running 'doxygen %TMPCFG%` ...
@echo Running 'doxygen %TMPCFG%` ... >> %TMPLOG%
doxygen %TMPCFG% >> %TMPLOG% 2>&1

@REM # cleanup
@REM del %PATH_QUICKREF_INCLUDE%

@echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- >> %TMPLOG%
@echo.
@echo ** %SCRIPT%: See '%TMPLOG%' for details...
@echo ** %SCRIPT%: TidyLib API documentation has been built in '%OUTP_DIR%\%PATH_WEBSITE%'.
@echo.
@echo Done %TIME%.
@echo Done %TIME%. >> %TMPLOG%
@echo.


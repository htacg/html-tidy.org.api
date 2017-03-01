# About HTML Tidy {#mainpage}

# Purpose

**HTML Tidy** and **LibTidy** correct and clean up HTML content by fixing markup
errors such as mismatched, mis-nested, and missing tags; missing end "/" tags; 
missing quotations; and many, many more discrepant conditions, and serves as an
HTML pretty printer.

For example…


\code{.html}
<h1><hr>heading</h1>
<h2>sub<hr>heading</h2>
<a href="#refs">References<a>
\endcode
…can be converted to
\code{.html}
<hr>
<h1>heading</h1>
<h2>sub</h2>
<hr>
<h2>heading</h2>
<a href="#refs">References</a>
\endcode

# About this Documentation

This documentation is intended to serve as reference materials for 
both **developers** and **LibTidy implementers** so that they can have a
reference for troubleshooting code, fixing issues with Tidy, and for 
implementing their own programs with LibTidy’s API.

Consumer documentation can be referenced from `tidy -help` on all platforms, and
via `man tidy` on Unix platforms.

In addition to the automatically generated documentation from Tidy’s source
code, these three major sections provide practical information about using Tidy,
how to contribute, and how LibTidy works:

- \ref general
  - These articles show how HTML Tidy works from a user perspective. Although
    the console program is described, keep in mind that all of these articles
    apply to LibTidy, too, as the console is simply one type of clients to the
    library.
  
- \ref libtidy_01
  - High level information about LibTidy is discussed in this series of
    articles, including a sample implementation of the library.
  
- \ref programming
  - These articles detail how to work with the HTML Tidy source code. If you
    plan to work with HTACG and donate your own contributions, please have a
    look at these articles so that you have an easy transition to our team!

# Components

HTML Tidy is composed of two major components:

## Tidy Console
Tidy’s console program is the piece that most people interact with in their
console or terminal application. It implements LibTidy on macOS, Linux and other
Unixes, Windows, and more, and is a relatively simple program that can serve as
a good reference model for programs wishing to implement LibTidy.

General information about the console application is available in \ref general.

## LibTidy 
The critical mass of Tidy consists of LibTidy, a C static or dynamic library
(your choice) that developers can integrate into their own program in order to
bring all of Tidy’s power to your favorite tools.

An introduction to LibTidy is available in \ref libtidy_01, and some helpful
guides are present in the \ref programming section, too.

/*
 @licstart  The following is the entire license notice for the JavaScript code in this file.

 The MIT License (MIT)

 Copyright (C) 1997-2020 by Dimitri van Heesch

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 and associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute,
 sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or
 substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
 BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @licend  The above is the entire license notice for the JavaScript code in this file
*/
var NAVTREE =
[
  [ "HTML Tidy", "index.html", [
    [ "About HTML Tidy", "index.html", [
      [ "Purpose", "index.html#autotoc_md9", null ],
      [ "About this Documentation", "index.html#autotoc_md10", null ],
      [ "Components", "index.html#autotoc_md11", [
        [ "Tidy Console", "index.html#autotoc_md12", null ],
        [ "LibTidy", "index.html#autotoc_md13", null ]
      ] ]
    ] ],
    [ "README", "md_README.html", null ],
    [ "Building HTML Tidy", "md_pages_BUILD.html", [
      [ "Prerequisites", "md_pages_BUILD.html#autotoc_md2", null ],
      [ "Build the tidy library and command line tool", "md_pages_BUILD.html#autotoc_md3", null ],
      [ "Build PHP with the tidy-html5 library", "md_pages_BUILD.html#autotoc_md4", null ]
    ] ],
    [ "License", "md_pages_LICENSE.html", [
      [ "HTML parser and pretty printer", "md_pages_LICENSE.html#autotoc_md6", [
        [ "Contributing Author(s):", "md_pages_LICENSE.html#autotoc_md7", null ]
      ] ],
      [ "COPYRIGHT NOTICE:", "md_pages_LICENSE.html#autotoc_md8", null ]
    ] ],
    [ "General", "general.html", "general" ],
    [ "LibTidy", "libtidy_01.html", "libtidy_01" ],
    [ "Programming", "programming.html", "programming" ],
    [ "Deprecated List", "deprecated.html", null ],
    [ "Todo List", "todo.html", null ],
    [ "Modules", "modules.html", "modules" ],
    [ "Anchor", "attrs_8h.html#struct__Anchor", "attrs_8h_struct__Anchor" ],
    [ "AttrHash", "attrs_8h.html#struct__AttrHash", "attrs_8h_struct__AttrHash" ],
    [ "Attribute", "attrs_8h.html#struct__Attribute", "attrs_8h_struct__Attribute" ],
    [ "AttVal", "lexer_8h.html#struct__AttVal", "lexer_8h_struct__AttVal" ],
    [ "Dict", "group__tags__h.html#struct__Dict", "group__tags__h_struct__Dict" ],
    [ "IStack", "lexer_8h.html#struct__IStack", "lexer_8h_struct__IStack" ],
    [ "Lexer", "lexer_8h.html#struct__Lexer", "lexer_8h_struct__Lexer" ],
    [ "Node", "lexer_8h.html#struct__Node", "lexer_8h_struct__Node" ],
    [ "StreamIn", "streamio_8h.html#struct__StreamIn", "streamio_8h_struct__StreamIn" ],
    [ "StreamOut", "streamio_8h.html#struct__StreamOut", "streamio_8h_struct__StreamOut" ],
    [ "TagStyle", "lexer_8h.html#struct__Style", "lexer_8h_struct__Style" ],
    [ "StyleProp", "lexer_8h.html#struct__StyleProp", "lexer_8h_struct__StyleProp" ],
    [ "TidyOptionImpl", "group__configuration__options.html#struct__tidy__option", "group__configuration__options_struct__tidy__option" ],
    [ "TidyAccessImpl", "access_8h.html#struct__TidyAccessImpl", "access_8h_struct__TidyAccessImpl" ],
    [ "TidyAllocator", "group__Memory.html#struct__TidyAllocator", "group__Memory_struct__TidyAllocator" ],
    [ "TidyAllocatorVtbl", "group__Memory.html#struct__TidyAllocatorVtbl", "group__Memory_struct__TidyAllocatorVtbl" ],
    [ "TidyAttribImpl", "attrs_8h.html#struct__TidyAttribImpl", "attrs_8h_struct__TidyAttribImpl" ],
    [ "TidyBuffer", "group__IO.html#struct__TidyBuffer", "group__IO_struct__TidyBuffer" ],
    [ "TidyDocImpl", "tidy-int_8h.html#struct__TidyDocImpl", "tidy-int_8h_struct__TidyDocImpl" ],
    [ "TidyMessageImpl", "tidy-int_8h.html#struct__TidyMessageImpl", "tidy-int_8h_struct__TidyMessageImpl" ],
    [ "AllOption_t", "group__utilities__cli__options.html#structAllOption__t", "group__utilities__cli__options_structAllOption__t" ],
    [ "AttrVersion", "attrdict_8h.html#structAttrVersion", "attrdict_8h_structAttrVersion" ],
    [ "CmdOptDesc", "group__options__cli.html#structCmdOptDesc", "group__options__cli_structCmdOptDesc" ],
    [ "DictHash", "group__tags__h.html#structDictHash", "group__tags__h_structDictHash" ],
    [ "languageDefinition", "structlanguageDefinition.html", "structlanguageDefinition" ],
    [ "languageDictionaryEntry", "language_8h.html#structlanguageDictionaryEntry", "language_8h_structlanguageDictionaryEntry" ],
    [ "OptionDesc", "group__utilities__cli__options.html#structOptionDesc", "group__utilities__cli__options_structOptionDesc" ],
    [ "PickListItem", "group__configuration__options.html#structPickListItem", "group__configuration__options_structPickListItem" ],
    [ "PriorityAttribs", "attrs_8h.html#structPriorityAttribs", "attrs_8h_structPriorityAttribs" ],
    [ "TidyAttr", "group__Opaque.html#structTidyAttr", null ],
    [ "TidyConfigImpl", "group__configuration__options.html#structTidyConfigImpl", "group__configuration__options_structTidyConfigImpl" ],
    [ "TidyDoc", "group__Opaque.html#structTidyDoc", null ],
    [ "TidyIndent", "pprint_8h.html#structTidyIndent", "pprint_8h_structTidyIndent" ],
    [ "TidyInputSource", "group__IO.html#structTidyInputSource", "group__IO_structTidyInputSource" ],
    [ "tidyLocaleMapItem", "group__Localization.html#structtidyLocaleMapItem", null ],
    [ "tidyLocaleMapItemImpl", "language_8h.html#structtidyLocaleMapItemImpl", "language_8h_structtidyLocaleMapItemImpl" ],
    [ "TidyMessage", "group__Opaque.html#structTidyMessage", null ],
    [ "TidyMessageArgument", "group__Opaque.html#structTidyMessageArgument", null ],
    [ "TidyMutedMessages", "group__message__mutinging.html#structTidyMutedMessages", "group__message__mutinging_structTidyMutedMessages" ],
    [ "TidyNode", "group__Opaque.html#structTidyNode", null ],
    [ "TidyOption", "group__Opaque.html#structTidyOption", null ],
    [ "TidyOptionDoc", "group__configuration__options.html#structTidyOptionDoc", "group__configuration__options_structTidyOptionDoc" ],
    [ "TidyOptionValue", "group__configuration__options.html#unionTidyOptionValue", "group__configuration__options_unionTidyOptionValue" ],
    [ "TidyOutputSink", "group__IO.html#structTidyOutputSink", "group__IO_structTidyOutputSink" ],
    [ "TidyPrintImpl", "pprint_8h.html#structTidyPrintImpl", "pprint_8h_structTidyPrintImpl" ],
    [ "TidyTagImpl", "group__tags__h.html#structTidyTagImpl", "group__tags__h_structTidyTagImpl" ]
  ] ]
];

var NAVTREEINDEX =
[
"api_namespace.html",
"group__Tree.html#gaeb8f272e8135e744b9b3f006517f1073",
"group__public__enumerations.html#gga1686318b9a8c2aa6e60e341af7145c00a24cf99d3a9ab68e5f59de15d6db041ed",
"group__public__enumerations.html#gga1686318b9a8c2aa6e60e341af7145c00ae0341c206bc4ff3db48b35675ca04946",
"group__public__enumerations.html#gga4cbfcbf234421459e736d62cfdd4c3e1a21478fb6d9c535e75a74277234f91d2b",
"group__public__enumerations.html#gga4cbfcbf234421459e736d62cfdd4c3e1adc19eb91d2b50321feecab74daf4e929",
"group__service__help.html",
"index.html#autotoc_md9"
];

var SYNCONMSG = 'click to disable panel synchronisation';
var SYNCOFFMSG = 'click to enable panel synchronisation';
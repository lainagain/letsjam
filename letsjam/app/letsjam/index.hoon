|=  =bowl:gall
|^  ^-  manx
;html
  ;head
    ;title: LET US JAM
    ;meta(charset "utf-8");
    ;style
      ;+  ;/  style
    ==
    ;script
      ;+  ;/  script
    ==
  ==
  ;body
    ;h1: Welcome!
    ;form#export
      =method  "post"
      =action  "/letsjam/export"      
      ;fieldset
        ;legend: EXPORT
        ;*  =/  desklist
        `(list @t)`~(tap in .^((set desk) %cd /(scot %p our.bowl)/letsjam/(scot %da now.bowl)))
        (turn desklist listdesk)
        ;button(type "submit"): Export
      ==
    ==
    ;form#import
      =method  "post"
      =action  "/letsjam/import"
      =enctype  "multipart/form-data"
      ;fieldset
        ;legend: IMPORT
        ;label(onclick "toggleInputType('file')")
          ; import a jamfile:
          ;input(type "file", id "fileInput", name "myjam", accept ".jamfile,application/octet-stream");
        ==
        ;br;
        ;label(onclick "toggleInputType('url')")
          ; fetch url:
          ;input(type "url", id "urlInput", name "jamfromsomewhere");
        ==
::        ;label
::          ;select(id "merge-strategy", name "merge-option")
::            ;option(value "init"): init
::            ;option(value "ineit"): ineit
::            ;option(value "iniwt"): iniwt
::            ;option(value "initff"): initff
::            ;option(value "initd"): initd
::          ==
::        ==
        ;button(type "submit"): Import
      ==
    ==
  ==
==
++  listdesk
  |=  adesk=@t
  =/  currentcase=[@ud @da]
  .^(cass:clay %cw /(scot %p our.bowl)/(wood adesk)/(scot %da now.bowl))
  =/  thedesk=tape  (trip adesk)
  ;label(onclick "disableNumberInputs(this)")
    ;input(type "radio", name "adesk", value "{thedesk}");
    ; {thedesk}{`tape`(reap (sub 40 (lent thedesk)) '.')}{<currentcase>}
    ;input(type "number", name "{thedesk}", min "1", max "{<(head currentcase)>}", value "{<(head currentcase)>}");
    ;br;
  ==
::
:: add some style
::
++  style
  ^~  %-  trip
    '''
    body {
      background-color: lightblue;
      font-family: monospace, Monaco, "Courier New";
    }
    h1 {
      color: pink;
    }
    '''
::
++  script
  ^~  %-  trip
    '''
    function toggleInputType(inputType) {
      var fileInput = document.getElementById("fileInput");
      var urlInput = document.getElementById("urlInput");

      if (inputType === "file") {
        fileInput.disabled = false;
        urlInput.disabled = true;
      } else if (inputType === "url") {
        fileInput.disabled = true;
        urlInput.disabled = false;
      }
    }

    function disableNumberInputs(label) {
      var numberInputs = document.querySelectorAll("input[type='number']");
      for (var i = 0; i < numberInputs.length; i++) {
        if (numberInputs[i].parentNode !== label) {
          numberInputs[i].disabled = true;
        } else {
          numberInputs[i].disabled = false;
        }
      }
    }
    '''
--

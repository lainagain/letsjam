|=  [=bowl:gall mydesk=@t myrev=@t]
|^  ^-  manx
;html
  ;head
    ;title: JAM EXPORT
    ;meta(charset "utf-8");
    ;style
      ;+  ;/  style
    ==
    ;script
      ;+  ;/  script
    ==
  ==
  ;body
    ;h1: come!
    ;button(onclick "checkAll()"): Select All
    ;button(onclick "uncheckAll()"): Deselect All
    ;form
      =method  "post"
      =action  "/letsjam/export2"
      Is this a full desk or just a set of files? :
      ;label
        ; full desk
        ;input(type "radio", name "is-desk", value "true", required "");
      ==
      ;br;
      ;label
        ; just files
        ;input(type "radio", name "is-desk", value "false");
      ==
      ;br;
      ;textarea(name "comment", rows "4", cols "40"): any last words?
      ;br;
      ;*  =/  drawer
      .^((list path) %ct /(scot %p our.bowl)/(wood mydesk)/(wood myrev))
      (turn drawer listfiles)
      ;button(type "submit"): EXPORT
    ==
  ==
==
++  listfiles
  |=  afile=path
  =/  myfile=tape  (spud afile)
  =/  lobe=@uvI
  ->:.^(arch %cy (weld /(scot %p our.bowl)/(wood mydesk)/(wood myrev) afile))
  ;label
    ;input(type "checkbox", name "{myfile}", value "{<lobe>}", checked "");
    ; {myfile}
    ;br;
  ==
::
:: add some style
::
++  style
  ^~  %-  trip
    '''
    body {
      background-color: yellow;
    }
    h1 {
      color: blue;
    }
    p {
      color: red;
    }
    '''
::
++  script
  ^~  %-  trip
    '''
    function checkAll() {
      var checkboxes = document.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = true;
      });
    }

    function uncheckAll() {
      var checkboxes = document.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = false;
      });
    }
    '''
--

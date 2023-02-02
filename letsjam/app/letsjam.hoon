/+  dbug, default-agent, schooner, server, verb
/=  index  /app/letsjam/index
/=  export  /app/letsjam/export
!:
::
|%
+$  versioned-state  $%(state-0)
+$  state-0  [%0 mydesk=@t myrev=@t]
+$  card  card:agent:gall
--
::
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
::
=<
  |_  =bowl:gall
  +*  this  .
      def  ~(. (default-agent this %|) bowl)
      eng   ~(. +> [bowl ~])
      prip
        |=  [topath=@t topage=@t]
        ^-  [path page:clay]
        :-  (stab topath)
        .^(page:clay %cs /(scot %p our.bowl)/(wood mydesk)/(wood myrev)/blob/(@t topage))
  ++  on-init
    ^-  (quip card _this)
    :_  this
    [%pass /bind %arvo %e %connect `/'letsjam' %letsjam]~
  ::
  ++  on-save
    ^-  vase
    ~>  %bout.[0 '%letsjam +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    ~>  %bout.[0 '%letsjam +on-load']
    ^-  (quip card _this)
    =^  cards  state
      abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  [=mark =vase]
    ~>  %bout.[0 '%letsjam +on-poke']
    |^  ^-  (quip card _this)
    ?>  =(our.bowl src.bowl)
    =^  cards  state
      ?+  mark  (on-poke:def mark vase)
        %handle-http-request  (handle-http !<([@ta inbound-request:eyre] vase))
      ==
    [cards this]
    ++  handle-http
      |=  [rid=@ta req=inbound-request:eyre]
      ^-  (quip card _state)
      =+  send=(cury response:schooner rid)
      ?.  authenticated.req
        :_  state
        (send [307 ~ [%login-redirect './letsjam']])
      ?+  method.request.req
        :_  state
        (send [405 ~ [%stock ~]])
      ::
          %'GET'
        :_  state
        (send [200 ~ [%manx (index bowl)]])
        ::
          %'POST'
        ?~  body.request.req
          :_  state
          (send [302 ~ [%redirect 'https://duckduckgo.com']])
        =/  action=path
        ->:(parse-request-line:server url.request.req)
        ?+  action  
          :_  state
          (send [302 ~ [%redirect 'https://urbit.org']])
            [%letsjam %export ~]
          =/  adesk=@t  +<+:(rush q.u.body.request.req yquy:de-purl:html)
          =/  rev=@t  +>->:(rush q.u.body.request.req yquy:de-purl:html)
          :_  state(mydesk adesk, myrev rev)
          (send [200 ~ [%manx (export bowl adesk rev)]])
          ::
            [%letsjam %export2 ~]
          =/  is-desk=@t  +<+:(rush q.u.body.request.req yquy:de-purl:html)
          =/  comment=@t  +>->:(rush q.u.body.request.req yquy:de-purl:html)
          =/  namespace=(list [@t @t])  +>+:(rush q.u.body.request.req yquy:de-purl:html)
          =/  filelist=(list [path page:clay])  `(list (pair path page:clay))`(turn namespace prip)
          =/  jamfile=@  (jam [mydesk is-desk comment filelist])
          ~&  (cue jamfile)
          :_  state
          %+  give-simple-payload:app:server
            rid
          ^-  simple-payload:http
          :-  :-  200
            :~  ['content-type'^'application/octet-stream']
                ['content-disposition'^'attachment; filename="test.jamfile"']
            ==
          `(as-octs:mimes:html jamfile)
          ::
            [%letsjam %import ~]
          :: this is pretty inefficient... figure out a way to send the
          :: form-data without extra info being directly attached to the
          :: jamfile so we dont have to keep converting. Ideally there
          :: is little to parse. jamfile should be immediately cued...
          =/  jammed=tape  (trip q.u.body.request.req)
          =/  perforation=(list @ud)  (fand "\0d\0a" jammed)
          =/  tipp=@ud  (add 2 +30:perforation)
          =/  butt=@ud  +62:perforation
          =/  jamfile=@  `@`(crip (swag [tipp (sub butt tipp)] jammed))
          ~&  (cue jamfile)
          :: hmm cueing almost works. the first item in (list [path
          :: page]) has a path but page shows up as "v::::". The rest is null.
          :: looks like some kinda escape key problem?.. that or maybe data is lost somewhere
          :: between posting the file and editing out the boundries
          ::
          ::
          :: if you figure out how to cue the whole jamfile then just
          :: cast atoms to their correct type and create a map out of
          :: the (malt `(list [path page:clay])`thefilelist)
          :: then use new-desk:cloy to make it a desk.
          `state
        ==
      ==
    --
  ::
  ++  on-peek
    |=  =path
    ~>  %bout.[0 '%letsjam +on-peek']
    ^-  (unit (unit cage))
    [~ ~]
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    ~>  %bout.[0 '%letsjam +on-agent']
    ^-  (quip card _this)
    `this
  ::
  ++  on-arvo
    |=  [=wire =sign-arvo]
    ^-  (quip card _this)
    ?.  ?=([%bind ~] wire)
      ~&(%umm-default (on-arvo:def [wire sign-arvo]))
    ?>  ?=([%eyre %bound *] sign-arvo)
    ?.  accepted.sign-arvo
      ~&(%eyre-rejected-binding `this)
    ~&(%eyre-accepted-binding `this)
  ::
  ++  on-watch
    |=  =path
    ~>  %bout.[0 '%letsjam +on-watch']
    ^-  (quip card _this)
    ~&  [%onwatchpath path]
    `this
  ::
  ++  on-fail
    ~>  %bout.[0 '%letsjam +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ~>  %bout.[0 '%letsjam +on-init']
    on-leave:def
  --
|_  [bol=bowl:gall dek=(list card)]
+*  dat  .
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp lac dek)))
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::
++  init
  ^+  dat
  dat
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  dat(state !<(state-0 vaz))
--

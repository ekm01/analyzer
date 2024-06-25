  $ goblint --set ana.activated[+] abortUnless --enable exp.arg.enabled --set exp.arg.dot.path arg.dot --set exp.arg.dot.node-label empty 54-witness-lifter-abortUnless.c
  [Info][Deadcode] Logical lines of code (LLoC) summary:
    live: 8
    dead: 0
    total lines: 8

  $ graph-easy --as=boxart arg.dot
                                 ┌───────────────────────────┐
                                 │             _             │
                                 └───────────────────────────┘
                                   │
                                   │ Entry main
                                   ▼
                                 ┌───────────────────────────┐
                                 │             _             │ ·┐
                                 └───────────────────────────┘  :
                                   │                            :
                                   │ InlineEntry '(0)'          :
                                   ▼                            :
                                 ┌───────────────────────────┐  :
                                 │             _             │  :
                                 └───────────────────────────┘  :
                                   │                            :
                                   │ Entry goodB2G1Sink         :
                                   ▼                            :
                                 ┌───────────────────────────┐  :
    ┌··························· │             _             │  :
    :                            └───────────────────────────┘  :
    :                              │                            :
    :                              │ InlineEntry '()'           :
    :                              ▼                            :
    :                            ┌───────────────────────────┐  :
    :                            │             _             │  :
    :                            └───────────────────────────┘  :
    :                              │                            :
    :                              │ Entry printLine            :
    :                              ▼                            :
    :                            ┌───────────────────────────┐  :
    : Inlined Proc 'printLine()' │             _             │  : Inlined Proc 'goodB2G1Sink(0)'
    :                            └───────────────────────────┘  :
    :                              │                            :
    :                              │ Ret (None, printLine)      :
    :                              ▼                            :
    :                            ┌───────────────────────────┐  :
    :                            │             _             │  :
    :                            └───────────────────────────┘  :
    :                              │                            :
    :                              │ InlineReturn               :
    :                              ▼                            :
    :                            ┌───────────────────────────┐  :
    └··························▶ │             _             │  :
                                 └───────────────────────────┘  :
                                   │                            :
                                   │ Ret (None, goodB2G1Sink)   :
                                   ▼                            :
                                 ┌───────────────────────────┐  :
                                 │             _             │  :
                                 └───────────────────────────┘  :
                                   │                            :
                                   │ InlineReturn               :
                                   ▼                            :
                                 ┌───────────────────────────┐  :
                                 │             _             │ ◀┘
                                 └───────────────────────────┘
                                   │
                                   │ Ret (Some 0, main)
                                   ▼
                                 ┌───────────────────────────┐
                                 │             _             │
                                 └───────────────────────────┘
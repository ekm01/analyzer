  $ cfgDot 21-empty-loops.c

  $ graph-easy --as=boxart f_empty_goto_loop.dot
  ┌───────────────────────────────┐
  │      f_empty_goto_loop()      │
  └───────────────────────────────┘
    │
    │ (body)
    ▼
  ┌───────────────────────────────┐   skip
  │  21-empty-loops.c:57:3-57:31  │ ───────┐
  │      (synthetic: false)       │        │
  │                               │ ◀──────┘
  └───────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌───────────────────────────────┐
  │  21-empty-loops.c:58:1-58:1   │
  │      (synthetic: false)       │
  └───────────────────────────────┘
    │
    │ return
    ▼
  ┌───────────────────────────────┐
  │ return of f_empty_goto_loop() │
  └───────────────────────────────┘

  $ graph-easy --as=boxart f_empty_while_loop.dot
  ┌────────────────────────────────┐
  │      f_empty_while_loop()      │
  └────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌────────────────────────────────┐   Pos(1)
  │  21-empty-loops.c:62:10-62:11  │ ─────────┐
  │       (synthetic: true)        │          │
  │                                │ ◀────────┘
  └────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌────────────────────────────────┐
  │   21-empty-loops.c:63:1-63:1   │
  │       (synthetic: false)       │
  └────────────────────────────────┘
    │
    │ return
    ▼
  ┌────────────────────────────────┐
  │ return of f_empty_while_loop() │
  └────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_suffix.dot
             ┌──────────────────────────────────────┐
             │     21-empty-loops.c:75:3-75:11      │
             │          (synthetic: false)          │
             └──────────────────────────────────────┘
               │
               │ suffix()
               ▼
             ┌──────────────────────────────────────┐
             │      21-empty-loops.c:76:1-76:1      │
             │          (synthetic: false)          │ ◀┐
             └──────────────────────────────────────┘  │
               │                                       │
               │ return                                │
               ▼                                       │
             ┌──────────────────────────────────────┐  │
             │ return of f_empty_goto_loop_suffix() │  │
             └──────────────────────────────────────┘  │
             ┌──────────────────────────────────────┐  │ Neg(1)
             │      f_empty_goto_loop_suffix()      │  │
             └──────────────────────────────────────┘  │
               │                                       │
               │ (body)                                │
               ▼                                       │
      skip   ┌──────────────────────────────────────┐  │
    ┌─────── │     21-empty-loops.c:73:3-73:38      │  │
    │        │          (synthetic: false)          │  │
    └──────▶ │                                      │ ─┘
             └──────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_while_loop_suffix.dot
  ┌───────────────────────────────────────┐
  │      f_empty_while_loop_suffix()      │
  └───────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌───────────────────────────────────────┐   Pos(1)
  │     21-empty-loops.c:80:10-80:11      │ ─────────┐
  │           (synthetic: true)           │          │
  │                                       │ ◀────────┘
  └───────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌───────────────────────────────────────┐
  │      21-empty-loops.c:82:3-82:11      │
  │          (synthetic: false)           │
  └───────────────────────────────────────┘
    │
    │ suffix()
    ▼
  ┌───────────────────────────────────────┐
  │      21-empty-loops.c:83:1-83:1       │
  │          (synthetic: false)           │
  └───────────────────────────────────────┘
    │
    │ return
    ▼
  ┌───────────────────────────────────────┐
  │ return of f_empty_while_loop_suffix() │
  └───────────────────────────────────────┘

  $ graph-easy --as=boxart f_nonempty_goto_loop.dot
  ┌──────────────────────────────────┐
  │      f_nonempty_goto_loop()      │
  └──────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌──────────────────────────────────┐   body()
  │    21-empty-loops.c:93:3-93:9    │ ─────────┐
  │        (synthetic: false)        │          │
  │                                  │ ◀────────┘
  └──────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌──────────────────────────────────┐
  │    21-empty-loops.c:95:1-95:1    │
  │        (synthetic: false)        │
  └──────────────────────────────────┘
    │
    │ return
    ▼
  ┌──────────────────────────────────┐
  │ return of f_nonempty_goto_loop() │
  └──────────────────────────────────┘

  $ graph-easy --as=boxart f_nonempty_while_loop.dot
  
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                │
    │                                         ┌───────────────────────────────────┐  │
    │                                         │      f_nonempty_while_loop()      │  │
    │                                         └───────────────────────────────────┘  │
    │                                           │                                    │ body()
    │                                           │ (body)                             │
    │                                           ▼                                    │
  ┌───────────────────────────────┐           ┌───────────────────────────────────┐  │
  │ 21-empty-loops.c:101:5-101:11 │  Pos(1)   │   21-empty-loops.c:99:10-99:11    │  │
  │      (synthetic: false)       │ ◀──────── │         (synthetic: true)         │ ◀┘
  └───────────────────────────────┘           └───────────────────────────────────┘
                                                │
                                                │ Neg(1)
                                                ▼
                                              ┌───────────────────────────────────┐
                                              │   21-empty-loops.c:103:1-103:1    │
                                              │        (synthetic: false)         │
                                              └───────────────────────────────────┘
                                                │
                                                │ return
                                                ▼
                                              ┌───────────────────────────────────┐
                                              │ return of f_nonempty_while_loop() │
                                              └───────────────────────────────────┘


  $ graph-easy --as=boxart f_empty_goto_loop_prefix.dot
  ┌──────────────────────────────────────┐
  │      f_empty_goto_loop_prefix()      │
  └──────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌──────────────────────────────────────┐
  │    21-empty-loops.c:112:3-112:11     │
  │          (synthetic: false)          │
  └──────────────────────────────────────┘
    │
    │ prefix()
    ▼
  ┌──────────────────────────────────────┐   skip
  │    21-empty-loops.c:115:3-115:38     │ ───────┐
  │          (synthetic: false)          │        │
  │                                      │ ◀──────┘
  └──────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌──────────────────────────────────────┐
  │     21-empty-loops.c:116:1-116:1     │
  │          (synthetic: false)          │
  └──────────────────────────────────────┘
    │
    │ return
    ▼
  ┌──────────────────────────────────────┐
  │ return of f_empty_goto_loop_prefix() │
  └──────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_while_loop_prefix.dot
  ┌───────────────────────────────────────┐
  │      f_empty_while_loop_prefix()      │
  └───────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌───────────────────────────────────────┐
  │     21-empty-loops.c:120:3-120:11     │
  │          (synthetic: false)           │
  └───────────────────────────────────────┘
    │
    │ prefix()
    ▼
  ┌───────────────────────────────────────┐   Pos(1)
  │    21-empty-loops.c:122:10-122:11     │ ─────────┐
  │           (synthetic: true)           │          │
  │                                       │ ◀────────┘
  └───────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌───────────────────────────────────────┐
  │     21-empty-loops.c:123:1-123:1      │
  │          (synthetic: false)           │
  └───────────────────────────────────────┘
    │
    │ return
    ▼
  ┌───────────────────────────────────────┐
  │ return of f_empty_while_loop_prefix() │
  └───────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_semicolon.dot
  ┌─────────────────────────────────────────┐
  │      f_empty_goto_loop_semicolon()      │
  └─────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌─────────────────────────────────────────┐   skip
  │      21-empty-loops.c:127:1-128:3       │ ───────┐
  │           (synthetic: false)            │        │
  │                                         │ ◀──────┘
  └─────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌─────────────────────────────────────────┐
  │      21-empty-loops.c:131:1-131:1       │
  │           (synthetic: false)            │
  └─────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌─────────────────────────────────────────┐
  │ return of f_empty_goto_loop_semicolon() │
  └─────────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_while_loop_semicolon.dot
  ┌──────────────────────────────────────────┐
  │      f_empty_while_loop_semicolon()      │
  └──────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌──────────────────────────────────────────┐   Pos(1)
  │      21-empty-loops.c:135:10-135:11      │ ─────────┐
  │            (synthetic: true)             │          │
  │                                          │ ◀────────┘
  └──────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌──────────────────────────────────────────┐
  │       21-empty-loops.c:138:1-138:1       │
  │            (synthetic: false)            │
  └──────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌──────────────────────────────────────────┐
  │ return of f_empty_while_loop_semicolon() │
  └──────────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_multiple.dot
  ┌────────────────────────────────────────┐
  │      f_empty_goto_loop_multiple()      │
  └────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌────────────────────────────────────────┐   skip
  │     21-empty-loops.c:143:3-143:42      │ ───────┐
  │           (synthetic: false)           │        │
  │                                        │ ◀──────┘
  └────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌────────────────────────────────────────┐
  │      21-empty-loops.c:146:1-146:1      │
  │           (synthetic: false)           │
  └────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌────────────────────────────────────────┐
  │ return of f_empty_goto_loop_multiple() │
  └────────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_multiple_semicolon_first.dot
  ┌────────────────────────────────────────────────────────┐
  │      f_empty_goto_loop_multiple_semicolon_first()      │
  └────────────────────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌────────────────────────────────────────────────────────┐   skip
  │              21-empty-loops.c:150:1-151:3              │ ───────┐
  │                   (synthetic: false)                   │        │
  │                                                        │ ◀──────┘
  └────────────────────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌────────────────────────────────────────────────────────┐
  │              21-empty-loops.c:155:1-155:1              │
  │                   (synthetic: false)                   │
  └────────────────────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌────────────────────────────────────────────────────────┐
  │ return of f_empty_goto_loop_multiple_semicolon_first() │
  └────────────────────────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_multiple_semicolon_second.dot
  ┌─────────────────────────────────────────────────────────┐
  │      f_empty_goto_loop_multiple_semicolon_second()      │
  └─────────────────────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌─────────────────────────────────────────────────────────┐   skip
  │              21-empty-loops.c:160:3-160:59              │ ───────┐
  │                   (synthetic: false)                    │        │
  │                                                         │ ◀──────┘
  └─────────────────────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌─────────────────────────────────────────────────────────┐
  │              21-empty-loops.c:164:1-164:1               │
  │                   (synthetic: false)                    │
  └─────────────────────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌─────────────────────────────────────────────────────────┐
  │ return of f_empty_goto_loop_multiple_semicolon_second() │
  └─────────────────────────────────────────────────────────┘

  $ graph-easy --as=boxart f_empty_goto_loop_multiple_semicolon_both.dot
  ┌───────────────────────────────────────────────────────┐
  │      f_empty_goto_loop_multiple_semicolon_both()      │
  └───────────────────────────────────────────────────────┘
    │
    │ (body)
    ▼
  ┌───────────────────────────────────────────────────────┐   skip
  │             21-empty-loops.c:168:1-169:3              │ ───────┐
  │                  (synthetic: false)                   │        │
  │                                                       │ ◀──────┘
  └───────────────────────────────────────────────────────┘
    │
    │ Neg(1)
    ▼
  ┌───────────────────────────────────────────────────────┐
  │             21-empty-loops.c:174:1-174:1              │
  │                  (synthetic: false)                   │
  └───────────────────────────────────────────────────────┘
    │
    │ return
    ▼
  ┌───────────────────────────────────────────────────────┐
  │ return of f_empty_goto_loop_multiple_semicolon_both() │
  └───────────────────────────────────────────────────────┘

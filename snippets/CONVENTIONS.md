# Snippet trigger conventions

One trigger = one concept, identical across every language file that has it.
Triggers are lowercase, terse, no separators. `p` prefix = private / unexported.

When adding a snippet for a concept below, reuse its trigger. When adding a new
shared concept, add a row here first.

| trigger | concept                          |
|---------|----------------------------------|
| `fn`    | function / method                |
| `pfn`   | private / unexported function    |
| `afn`   | anonymous / arrow / lambda       |
| `ctor`  | constructor                      |
| `cls`   | class / module (defmodule)       |
| `iface` | interface                        |
| `struct`| struct / record                  |
| `enum`  | enum                             |
| `var`   | mutable variable                 |
| `pvar`  | private field                    |
| `const` | constant / immutable binding     |
| `if`    | if                               |
| `ife`   | if / else                        |
| `eif`   | else-if                          |
| `sw`    | switch / case / match            |
| `for`   | idiomatic default loop           |
| `forr`  | iterate a collection             |
| `wh`    | while                            |
| `try`   | try / catch (pcall, rescue)      |
| `tryf`  | try / catch / finally            |
| `throw` | throw / raise / panic            |
| `defer` | deferred cleanup                 |
| `imp`   | import / require / using / alias |
| `exp`   | export                           |
| `log`   | print a line to stdout / console |
| `logv`  | print a variable with its label  |
| `logf`  | formatted print                  |
| `ret`   | return                           |
| `test`  | test case / function             |
| `suite` | test group / describe / class    |

Not every language has every concept — only applicable ones are defined per file.
Language-specific one-offs may use any trigger not listed above.

Files rebuilt to this convention: `go, cs, typescript, javascript, lua, elixir,
powershell, shell, heex`. Other files (`html, css, sql, markdown, ...`) predate
this and are unreviewed.

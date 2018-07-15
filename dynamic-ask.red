Red[
  author: "Abdullah Yiğiterol"
]

ask: func [question [string!] /local a][
  a: copy ""
  switch system/platform[
    Windows WindowsXP MSDOS [
      prin question
      call/console/output {set /p ask=&echo %ask%} a
      a: replace a "^/" ""
      return a
    ]
    macOs Darwin [
      prin question
      call/console/output {ruby -e "ask = gets.chomp; puts ask"} a
      a: replace a "^/" ""
      return a
    ]
    Linux Linux-ARM FreeBSD [
      prin question
      either (call/wait "python3") = 0 [
        call/console/output {python3 -c "ask = input();print(ask)"} a
      ][
        call/console/output {python -c "ask = raw_input();print(ask)"} a
      ]
      a: replace a "^/" ""
      return a
    ]
  ]
]

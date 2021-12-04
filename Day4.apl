readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← readFile 'inputDay4'

nums ← ↑⍎¨','(≠⊆⊢)⊃data
getBoard← {⍎¨¨' '(≠⊆⊢)¨1 1 1 1 1 0/6↑⍵}
boards ← getBoard¨{⍵↓data}¨2+6×1-⍨⍳(6÷⍨≢1↓data)

bingoRound←{
    3⊃⍵≠0:⍵

    board← ⊃⍵
    played← ⍺ ∪ 2⊃⍵

    ((+/¨⊢) ∨⍥(5∘∊) ((↑+/)⊢)) ↑+/{⍵∊⍨¨board}¨played : board played (board calculateScore played)
    board played 0
}

calculateScore ← {
    board ← ⍺
    played ← ⍵

    mask ← ~⊃+/{⍵∊⍨¨board}¨played
    (⊃played) × +/+/¨mask/¨board
}

sol1 ← {
    res ← {bingoRound/(⊖nums), ⊂(⍵ ⍬ 0)}¨⍵
    ⊃({3⊃⊃⍵}¨res)[⍋{≢2⊃⊃⍵}¨res]
}

sol2 ← {
    res ← {bingoRound/(⊖nums), ⊂(⍵ ⍬ 0)}¨⍵
    ⊃({3⊃⊃⍵}¨res)[⍒{≢2⊃⊃⍵}¨res]
}

sol1 boards ⍝ 38913
sol2 boards ⍝ 16836

readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
stringData ← ' '(≠⊆⊢)¨readFile 'inputDay2'
data ← {(⊃⍵) (⍎(2⊃⍵))}¨stringData

moveSub ← {
    X ← 2⊃⍺
    (⊃⍺) ≡ 'forward': ⍵ + X (X×3⊃⍵) 0
    (⊃⍺) ≡ 'down': ⍵ + 0 0 X
    (⊃⍺) ≡ 'up': ⍵ - 0 0 X
}

sol ← {
    ⍺ ≡ 1: {(⊃⍵) × (3⊃⍵)}⊃moveSub/⊖((⊆ 0 0 0),⍵)
    ⍺ ≡ 2: {(⊃⍵) × (2⊃⍵)}⊃moveSub/⊖((⊆ 0 0 0),⍵)
}

1 sol data ⍝ 1840243
2 sol data ⍝ 1727785422

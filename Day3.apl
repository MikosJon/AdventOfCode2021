readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← {⍎¨⍵}¨readFile 'inputDay3'

mostCommonBitAt←{(+/⍺⊃¨⍵)≥(≢⍵)÷2}
takeMostCommonAtPos←{
    (≢⍵)≡1:⍵
    pos←⍺
    bit←pos mostCommonBitAt ⍵
    ({bit≡pos⊃⍵}¨⍵)/⍵
}
takeLeastCommonAtPos←{
    (≢⍵) ≡ 1: ⍵
    pos←⍺
    bit←~(pos mostCommonBitAt ⍵)
    ({bit≡pos⊃⍵}¨⍵)/⍵
}

sol1 ← (~×⍥(2∘⊥)⊢)(⊃(2÷⍨≢)<+/)

sol2 ← {
    oxygen ← 2⊥(⊃⊃takeMostCommonAtPos / (⊖⍳≢⊃⍵) , ⊂⍵)
    co2 ← 2⊥(⊃⊃takeLeastCommonAtPos / (⊖⍳≢⊃⍵) , ⊂⍵)
    oxygen × co2
}

sol1 data ⍝ 3374136
sol2 data ⍝ 4432698

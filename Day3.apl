readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← {⍎¨⍵}¨readFile 'inputDay3'

length ← ≢data

mostCommonBitAt←{(+/⍺⊃¨⍵)≥(≢⍵)÷2}
takeMostCommonAtPos←{
    (≢⍵) ≡ 1: ⍵
    pos ← ⍺
    bit← pos mostCommonBitAt ⍵
    ({(pos⊃⍵)≡bit}¨⍵)/⍵
}
takeLeastCommonAtPos←{
    (≢⍵) ≡ 1: ⍵
    pos←⍺
    bit←~(pos mostCommonBitAt ⍵)
    ({(pos⊃⍵)≡bit}¨⍵)/⍵
}

sol1 ← {
    mask ← ⊃{⍵≥length÷2}¨+/⍵
    {(+/(~mask)/⍵)×(+/mask/⍵)}⊖2*(⍳≢⊃⍵)-1
}
sol2 ← {
    oxygen ← +/(⊃⊃takeMostCommonAtPos / (⊖⍳≢⊃⍵) , ⊂⍵) / ⊖2*(⍳≢⊃⍵)-1
    co2 ← +/(⊃⊃takeLeastCommonAtPos / (⊖⍳≢⊃⍵) , ⊂⍵) / ⊖2*(⍳≢⊃⍵)-1
    oxygen × co2
}

sol1 data ⍝ 3374136
sol2 data ⍝ 4432698

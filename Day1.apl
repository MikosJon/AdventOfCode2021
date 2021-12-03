data ← ⍎¨⊃⎕NGET 'inputDay1' 1

sol1 ← {+/2</⍵}
sol2 ← {+/2</3+/⍵}

sol1 data ⍝ 1390
sol2 data ⍝ 1457

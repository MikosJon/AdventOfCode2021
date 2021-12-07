'big'⎕CY'dfns'

readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← ⍎¨','(≠⊆⊢)⊃readFile'inputDay6'

numAfterN ← (1+0∘×⍳9),0∘×⍳256
{numAfterN[⍵] ← numAfterN[⍵-7] + numAfterN[⍵-9]}¨9+⍳256
numAfterN ← 9↓numAfterN

sol1 ← {⊃+big/numAfterN[80-⍵]}
sol2 ← {⊃+big/numAfterN[256-⍵]}

sol1 data ⍝ 385391
sol2 data ⍝ 1728611055389

readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← ⍎¨','(≠⊆⊢)⊃readFile'inputDay7'

M ← ⌈/data
costs ← 0∘×⍳M+1
update1←{costs[⍵+1+⍳M-⍵]←costs[⍵+1+⍳M-⍵]+(⍳M-⍵) ⋄ costs[⍳⍵]←costs[⍳⍵]+⊖⍳⍵}

update1¨data
sol1 ← ⌊/costs ⍝ 325528


moveCost ← 0∘×⍳M+1
moveCost[1] ← 1
{moveCost[⍵] ← moveCost[⍵-1]+⍵}¨1+⍳M

costs ← 0∘×⍳M+1
update2←{costs[⍵+1+⍳M-⍵]←costs[⍵+1+⍳M-⍵]+moveCost[⍳M-⍵] ⋄ costs[⍳⍵]←costs[⍳⍵]+⊖moveCost[⍳⍵]}
update2¨data
sol2 ← ⌊/costs ⍝ 84678839

readFile ←{⊃⎕NGET ('/home/jon/Documents/AdventOfCode2021/',⍵) 1}
data ← readFile 'inputDay5'

lines ← {(⍎¨(','(≠⊆⊢)(⊃⍵))) (⍎¨(','(≠⊆⊢)(3⊃⍵)))}¨' '(≠⊆⊢)¨data
noDiag ← ({((⊃⊃⍵)≡(⊃2⊃⍵))∨((2⊃⊃⍵)≡(2⊃2⊃⍵))}¨lines)/lines

res ← data drawLine board ;dx;dy;startX;startY;stopX;stopY;length;indexArray
    data ← 1 + data
    startX startY ← ⊃data
    stopX stopY ← 2⊃data
    dx ← stopX-startX
    dy ← stopY-startY
    length ← (|dx)⌈(|dy)
    dx ← dx÷length
    dy ← dy÷length
    indexArray ← {(startX+dx×⍵)(startY+dy×⍵)}¨(¯1+⍳length+1)
    board[indexArray] ← 1+board[indexArray]
    res ← board

empty ← 1000 1000⍴0∘×⍳1000×1000
sol ← {+/+/⊃1<+/drawLine/⍵,⊂empty}

sol noDiag ⍝ 8622
sol lines ⍝ 22037
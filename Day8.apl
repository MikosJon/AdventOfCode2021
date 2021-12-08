readFile ← {⊃⎕NGET('/home/jon/Documents/AdventOfCode2021/',⍵)1}

outputLines ← ' '(≠⊆⊢)¨2⊃¨'|'(≠⊆⊢)¨readFile 'inputDay8'
decodeLines ← ' '(≠⊆⊢)¨⊃¨'|'(≠⊆⊢)¨readFile 'inputDay8'

res ← isLegit data;one;two;four;five;seven;eight;a;b;c;d;e;f;g
    one seven four eight ← ⊃data
    two five ← 2⊃data
    a ← seven ~ four
    c ← a ~⍨ seven ∩ two
    d ← c ~⍨ four ∩ two
    b ← d ~⍨ four ~ seven
    f ← one ∩ five
    g ← (a, d) ~⍨ two ∩ five
    e ← c ~⍨ two ~ five

    :If 7 ≡ +/{1≡≢⍵}¨a b c d e f g
        res ← a b c d e f g
    :Else
        res ← ⍬
    :EndIf

res ← decode line;t;known;possiblePositions;twosAndFives;candidates
    t ← ({(≢⍵)∊2 3 4 7}¨line)/line
    known ← t[⍋≢¨t]
    candidates ← ({5 ≡ ≢⍵}¨line)/line
    possiblePositions ← (1 2) (1 3) (2 1) (2 3) (3 1) (3 2) ⍝ only 3 numbers have 5 segments on
    twosAndFives ← {((⊃⍵)⊃candidates) ((2⊃⍵)⊃candidates)}¨possiblePositions

    res ← {isLegit (known ⍵)}¨twosAndFives
    res ← ⊃res/⍨{0 ≢ ≢⍵}¨res

num ← code getNum text;segments;segToNum
    segments ← 'abcdefg'[{(⊃,/code)⍳⍵}¨text]
    segments ← ⊃,/segments[⍋segments]
    segToNum ← 'abcefg' 'cf' 'acdeg' 'acdfg' 'bcdf' 'abdfg' 'abdefg' 'acf' 'abcdefg' 'abcdfg' 
    num ← ⊃¯1 + segToNum⍳segments ''

data1 ← (⊃,/) outputLines
sol1 ← {+/{(≢⍵)∊2 3 4 7}¨⍵}

codes ← decode¨decodeLines
displayedNums ← {
    code ← ⍵⊃codes
    oLine ← ⍵⊃outputLines
    +/1000 100 10 1 ×{code getNum ⍵}¨oLine}¨⍳≢codes
}
sol2 ← {+/⍵}

sol1 data1 ⍝ 237
sol2 displayedNums ⍝ 1009098

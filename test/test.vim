let s:suite = themis#suite('DiceRollSuite')
let s:assert = themis#helper('assert')

function! s:suite.RollTest1()
  let actual = diceroll#Roll("1d6+1")
  let expected_modifier = 1

  " modifier の検証
  call s:assert.equal(expected_modifier, actual.modifier)

  " rolls の検証
  call s:assert.equal(1, len(actual.rolls))
  call s:assert.true(actual.rolls[0] >= 1 && actual.rolls[0] <= 6)
  call s:assert.true(eval(join(actual.rolls, ' + ')) == actual.total - actual.modifier)
endfunction

function! s:suite.RollTest2()
  let actual = diceroll#Roll("100d20-1")
  let expected_modifier = -1

  " modifier の検証
  call s:assert.equal(expected_modifier, actual.modifier)

  " rolls の検証
  call s:assert.equal(100, len(actual.rolls))
  for i in range(0, 99)
    call s:assert.true(actual.rolls[i] >= 1 && actual.rolls[i] <= 20)
  endfor
  call s:assert.true(eval(join(actual.rolls, ' + ')) == actual.total - actual.modifier)
endfunction


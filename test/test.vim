let s:suite = themis#suite('DiceRollSuite')
let s:assert = themis#helper('assert')

import "../autoload/inner.vim"

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

function! s:suite.ParseDiceNotation()
  let diceNotation = "3d8+5"
  let actual = inner#ParseDiceNotation(diceNotation)
  let expected_numberOfDice = 3
  let expected_sidesOfDice = 8
  let expected_modifier = 5

  call s:assert.equal(expected_numberOfDice, actual.numOfDice)
  call s:assert.equal(expected_sidesOfDice, actual.sidesOfDice)
  call s:assert.equal(expected_modifier, actual.modifier)
endfunction

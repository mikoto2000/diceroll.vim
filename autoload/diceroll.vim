vim9script

import "./inner.vim"

# DiceRollResult クラスの定義
# 例: DiceRollResult.new([3, 5], 2) は 2 個のサイコロの出目が 3 と 5、修正値が 2 の結果を表す
class DiceRollResult
  var rolls: list<number>
  var modifier: number
  var total: number

  def new(rolls: list<number>, modifier: number)
    this.rolls = rolls
    this.modifier = modifier
    this.total = eval(join(rolls, ' + ')) + modifier
  enddef
endclass

# サイコロを振る関数
# 例: Roll("2d6+3") は 2 個の 6 面サイコロを振り、その合計に 3 を加えた結果を返す
export def Roll(diceNotation: string): DiceRollResult
  # サイコロの数を解析(例: "2d6+3")
  var parseResult = inner.ParseDiceNotation(diceNotation)

  # サイコロを振る
  var rolls = inner.RollDiceX(parseResult.numOfDice, parseResult.sidesOfDice)

  # 結果を返す
  return DiceRollResult.new(rolls, parseResult.modifier)
enddef


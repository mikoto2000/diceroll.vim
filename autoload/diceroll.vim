vim9script

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
  # サイコロの数を解析
  var splitedNotation1 = split(diceNotation, 'd')
  if len(splitedNotation1) != 2
    throw 'Invalid dice notation'
  endif
  var numOfDice = str2nr(splitedNotation1[0])

  # サイコロの面数を解析
  var splitedNotation2 = split(splitedNotation1[1], '[+-]')
  var sidesOfDice = str2nr(splitedNotation2[0])

  # modifire の数値と符号を解析
  var modifier = 0
  if len(splitedNotation2) == 2
    var modStr = splitedNotation2[1]
    modifier = str2nr(modStr)
  endif
  if (match(diceNotation, '-') != -1)
    modifier = -modifier
  endif

  # サイコロを振る
  var rolls: list<number> = []
  for i in range(numOfDice)
    var roll = rand() % sidesOfDice + 1
    call add(rolls, roll)
  endfor

  # 結果を返す
  return DiceRollResult.new(rolls, modifier)
enddef


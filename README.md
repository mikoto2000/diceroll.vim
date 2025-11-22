# diceroll.vim

サイコロを振るプラグイン

## Usage:

スクリプト内で `diceroll#Roll()` 関数を呼び出してください。
ダイスロールの結果が返却されます。

使用例:

```vim
let result = diceroll#Roll("2d6+3")
=> object of DiceRollResult {rolls: [3, 3], modifier: 3, total: 9}
```
## License:

Copyright (C) 2025 mikoto2000

This software is released under the MIT License, see LICENSE

このソフトウェアは MIT ライセンスの下で公開されています。 LICENSE を参照してください。


## Author:

mikoto2000 <mikoto2000@gmail.com>

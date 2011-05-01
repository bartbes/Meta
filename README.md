**Meta** (name pending), is a small script that adds a package loader for lua. Instead of just loading files (for both pure lua and [LÖVE](http://love2d.org)), it also does a few string substitutions to allow for extra syntax.

###Extra syntax###

    --New syntax -- old syntax
      a += b     -- a = a + b
      a -= b     -- a = a - b
      a *= b     -- a = a * b
      a /= b     -- a = a / b
      a ^= b     -- a = a ^ b
      a %= b     -- a = a % b
      a &&= b    -- a = a and b
      a ||= b    -- a = a or b
      a++        -- a = a + 1
      a--        -- a = a - 1

###Files###

meta.lua is the actual script, and main.lua and game.lua are an example for LÖVE.

###Usage###

    require("meta")

Then you can use require to load m.lua files, so in the example:

    --for game.lua
    require("game")
    --and for game.m.lua, still
    require("game")

Note that normal lua files take precedence over m.lua files.

{ ... }:
{
  plugins.treesitter =
  { enable = true
  ; ensureInstalled = [ "rust"
      "haskell"
      "java"
      "c_sharp"
      "go"
      "lua"
      "json"
    ]
  ;
  };
}

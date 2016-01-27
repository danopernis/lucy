module LucyPrelude where

import IntermediateRepresentation

preludeDefs :: CoreProgram
preludeDefs =
    [ Supercombinator
        "I"
        ["x"]
        (EVariable "x")
    , Supercombinator
        "K"
        ["x", "y"]
        (EVariable "x")
    , Supercombinator
        "K1"
        ["x", "y"]
        (EVariable "y")
    , Supercombinator
        "S"
         ["f", "g", "x"]
         (EApplication
            (EApplication (EVariable "f") (EVariable "x"))
            (EApplication (EVariable "g") (EVariable "x")))
    , Supercombinator
        "compose"
        ["f", "g", "x"]
        (EApplication
            (EVariable "f")
            (EApplication (EVariable "g") (EVariable "x")))
    , Supercombinator
        "twice"
        ["f"]
        (EApplication
            (EApplication (EVariable "compose") (EVariable "f"))
            (EVariable "f"))
    ]

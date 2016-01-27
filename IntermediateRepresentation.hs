module IntermediateRepresentation where

type Program a = [Supercombinator a]

data Supercombinator a
    = Supercombinator
        { supercombinatorName :: String
        , supercombinatorVariables :: [a]
        , supercombinatorBody :: Expression a
        }
    deriving (Show)

data Expression a
    = EVariable
        { variableName :: String
        }
    | ENumber
        { numberValue :: Int
        }
    | EConstructor
        { constructorTag :: Int
        , constructorArity :: Int
        }
    | EApplication
        { applicationFunction :: Expression a
        , applicationAgument :: Expression a
        }
    | ELet
        { letRecursive :: Bool
        , letDefinitions :: [Definition a]
        , letBody :: Expression a
        }
    | ECase
        { caseExpression :: Expression a
        , caseAlternatives :: [Alternative a]
        }
    | ELambda
        { lambdaVariables :: [a]
        , lambdaBody :: Expression a
        }
    deriving (Show)

data Definition a
    = Definition
        { definitionVariable :: a
        , definitionBody :: Expression a
        }
    deriving (Show)

data Alternative a
    = Alternative
        { alternativeTag :: Int
        , alternativeBoundVariables :: [a]
        , alternativeBody :: Expression a
        }
    deriving (Show)

type CoreProgram = Program String
type CoreSupercombinator = Supercombinator String
type CoreExpression = Expression String
type CoreDefinition = Definition String
type CoreAlternative = Alternative String

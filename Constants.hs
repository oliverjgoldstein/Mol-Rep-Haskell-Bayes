

module Constants where 

import Molecule
import qualified Data.Vector as V
import LazyPPL
import Orbital
import Data.Array
import Data.Maybe

-- Takes the bond order and two atomic symbols and gives the equilibrium bond length between them.
-- Currently this is only working for covalent single bonds.
equilibriumBondLengths :: Integer -> AtomicSymbol -> AtomicSymbol -> EquilibriumBondLength
equilibriumBondLengths bondOrder symbol1 symbol2 =
    case (bondOrder, symbol1, symbol2) of
        (1, C, C)   -> Angstrom 1.54
        (1, C, H)   -> Angstrom 1.09
        (1, C, O)   -> Angstrom 1.43
        (1, C, N)   -> Angstrom 1.47
        (1, C, B)   -> Angstrom 1.55
        (1, C, Fe)  -> Angstrom 1.84
        (1, H, C)   -> Angstrom 1.09
        (1, H, H)   -> Angstrom 0.74
        (1, H, O)   -> Angstrom 0.96
        (1, H, N)   -> Angstrom 1.01
        (1, H, B)   -> Angstrom 1.19
        (1, H, Fe)  -> Angstrom 1.52
        (1, O, C)   -> Angstrom 1.43
        (1, O, H)   -> Angstrom 0.96
        (1, O, O)   -> Angstrom 1.48
        (1, O, N)   -> Angstrom 1.40
        (1, O, B)   -> Angstrom 1.49
        (1, O, Fe)  -> Angstrom 1.70
        (1, N, C)   -> Angstrom 1.47
        (1, N, H)   -> Angstrom 1.01
        (1, N, O)   -> Angstrom 1.40
        (1, N, N)   -> Angstrom 1.45
        (1, N, B)   -> Angstrom 1.55
        (1, N, Fe)  -> Angstrom 1.76
        (1, B, C)   -> Angstrom 1.55
        (1, B, H)   -> Angstrom 1.19
        (1, B, O)   -> Angstrom 1.49
        (1, B, N)   -> Angstrom 1.55
        (1, B, B)   -> Angstrom 1.59
        (1, B, Fe)  -> Angstrom 2.03
        (1, Fe, C)  -> Angstrom 1.84
        (1, Fe, H)  -> Angstrom 1.52
        (1, Fe, O)  -> Angstrom 1.70
        (1, Fe, N)  -> Angstrom 1.76
        (1, Fe, B)  -> Angstrom 2.03
        (1, Fe, Fe) -> Angstrom 2.48
        (2, C, C) -> Angstrom 1.34
        (2, C, H) -> Angstrom 1.06
        (2, C, O) -> Angstrom 1.20
        (2, C, N) -> Angstrom 1.27
        (2, C, B) -> Angstrom 1.37
        (2, C, Fe) -> Angstrom 1.64
        (2, H, C) -> Angstrom 1.06
        (2, H, H) -> Angstrom 0.74
        (2, H, O) -> Angstrom 0.96
        (2, H, N) -> Angstrom 1.01
        (2, H, B) -> Angstrom 1.19
        (2, H, Fe) -> Angstrom 1.52
        (2, O, C) -> Angstrom 1.20
        (2, O, H) -> Angstrom 0.96
        (2, O, O) -> Angstrom 1.21
        (2, O, N) -> Angstrom 1.20
        (2, O, B) -> Angstrom 1.26
        (2, O, Fe) -> Angstrom 1.58
        (2, N, C) -> Angstrom 1.27
        (2, N, H) -> Angstrom 1.01
        (2, N, O) -> Angstrom 1.20
        (2, N, N) -> Angstrom 1.25
        (2, N, B) -> Angstrom 1.33
        (2, N, Fe) -> Angstrom 1.64
        (2, B, C) -> Angstrom 1.37
        (2, B, H) -> Angstrom 1.19
        (2, B, O) -> Angstrom 1.26
        (2, B, N) -> Angstrom 1.33
        (2, B, B) -> Angstrom 1.59
        (2, B, Fe) -> Angstrom 1.89
        (2, Fe, C) -> Angstrom 1.64
        (2, Fe, H) -> Angstrom 1.52
        (2, Fe, O) -> Angstrom 1.58
        (2, Fe, N) -> Angstrom 1.64
        (2, Fe, B) -> Angstrom 1.89
        (2, Fe, Fe) -> Angstrom 2.26
        (3, C, C) -> Angstrom 1.20
        (3, C, H) -> Angstrom 1.06
        (3, C, O) -> Angstrom 1.13
        (3, C, N) -> Angstrom 1.14
        (3, C, B) -> Angstrom 1.19
        (3, C, Fe) -> Angstrom 1.44
        (3, H, C) -> Angstrom 1.06
        (3, H, H) -> Angstrom 0.74
        (3, H, O) -> Angstrom 0.96
        (3, H, N) -> Angstrom 1.01
        (3, H, B) -> Angstrom 1.19
        (3, H, Fe) -> Angstrom 1.52
        (3, O, C) -> Angstrom 1.13
        (3, O, H) -> Angstrom 0.96
        (3, O, O) -> Angstrom 1.21
        (3, O, N) -> Angstrom 1.06
        (3, O, B) -> Angstrom 1.20
        (3, O, Fe) -> Angstrom 1.58
        (3, N, C) -> Angstrom 1.14
        (3, N, H) -> Angstrom 1.01
        (3, N, O) -> Angstrom 1.06
        (3, N, N) -> Angstrom 1.10
        (3, N, B) -> Angstrom 1.20
        (3, N, Fe) -> Angstrom 1.50
        (3, B, C) -> Angstrom 1.19
        (3, B, H) -> Angstrom 1.19
        (3, B, O) -> Angstrom 1.20
        (3, B, N) -> Angstrom 1.20
        (3, B, B) -> Angstrom 1.59
        (3, B, Fe) -> Angstrom 1.89
        (3, Fe, C) -> Angstrom 1.44
        (3, Fe, H) -> Angstrom 1.52
        (3, Fe, O) -> Angstrom 1.58
        (3, Fe, N) -> Angstrom 1.50
        (3, Fe, B) -> Angstrom 1.89
        (3, Fe, Fe) -> Angstrom 2.26
        (_, _, _) -> undefined

getMaxBondsSymbol :: AtomicSymbol -> Integer
getMaxBondsSymbol symbol =
  case symbol of
    H -> 1
    C -> 4
    N -> 3
    O -> 2
    F -> 1
    P -> 5
    S -> 6
    Cl -> 1
    Br -> 1
    B -> 3
    Fe -> 6
    I -> 1

elementAttributes :: AtomicSymbol -> ElementAttributes
elementAttributes O = ElementAttributes O 8 15.999
elementAttributes H = ElementAttributes H 1 1.008
elementAttributes N = ElementAttributes N 7 14.007
elementAttributes C = ElementAttributes C 6 12.011
elementAttributes B = ElementAttributes B 5 10.811
elementAttributes Fe = ElementAttributes Fe 26 55.845
elementAttributes F = ElementAttributes F 9 18.998
elementAttributes Cl = ElementAttributes Cl 17 35.453
elementAttributes S = ElementAttributes S 16 32.065
elementAttributes Br = ElementAttributes Br 35 79.904
elementAttributes P = ElementAttributes P 15 30.974
elementAttributes I = ElementAttributes I 53 126.904 -- Added case for iodine

elementShells :: AtomicSymbol -> Shells 
elementShells O = oxygen
elementShells H = hydrogen
elementShells N = nitrogen
elementShells C = carbon
elementShells B = boron
elementShells Fe = iron
elementShells F = fluorine
elementShells Cl = chlorine
elementShells S = sulfur
elementShells Br = bromine -- Added case for bromine
elementShells P = phosphorus -- Added case for phosphorus
elementShells I = iodine -- Added case for iodine
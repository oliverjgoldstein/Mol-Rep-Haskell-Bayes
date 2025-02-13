
module Group where 
import Molecule 
import Coordinate
import Data.List (transpose)

data MoleculeRotation = MoleculeRotation Molecule Coordinate Double deriving (Show)

class Group g where
  mul :: g -> g -> g -- Group operation: combining two operations
  inv :: g -> g -- Inverse of an operation
  e :: g -> g -- Identity operation

instance Group MoleculeRotation where
  mul (MoleculeRotation mol1 axis1 angle1) (MoleculeRotation _ axis2 angle2) =
    combineRotations mol1 axis1 angle1 axis2 angle2
  inv (MoleculeRotation mol axis angle) = MoleculeRotation mol axis (-angle)
  e (MoleculeRotation mol axis angle) = MoleculeRotation mol (Coordinate 0 0 0) 0 -- Identity rotation, angle 0 along any axis

combineRotations :: Molecule -> Coordinate -> Double -> Coordinate -> Double -> MoleculeRotation
combineRotations = undefined -- For users: implement permutation, symmetry, dihedral group etc. 
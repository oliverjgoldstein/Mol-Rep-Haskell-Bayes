module Serialisable where

import Molecule

-- Writing the molecule to a file
writeMoleculeToFile :: FilePath -> Molecule -> IO ()
writeMoleculeToFile filePath molecule = writeFile filePath (show molecule)

-- Reading the molecule from a file
readMoleculeFromFile :: FilePath -> IO Molecule
readMoleculeFromFile filePath = do
  contents <- readFile filePath
  return (read contents)

-- Example usage
main :: IO ()
main = do
  -- Write the methane molecule to a file
  writeMoleculeToFile "methane.hs" undefined
  
  -- Read the methane molecule from the file
  molecule <- readMoleculeFromFile "methane.hs"
  
  -- Print the molecule read from the file
  print molecule

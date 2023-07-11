from __future__ import print_function
from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit import DataStructs
from sys import argv
import pandas as pd
import csv

#input = smiles file


      

#import data and cluster
data = pd.read_csv(argv[1], sep='\t')
test = data["Smiles"]
test_id = data["ID"]
ms = [Chem.MolFromSmiles(x) for x in test]

from rdkit.Chem import Draw
#from rdkit.Chem.Draw import IPythonConsole
nmol = len(test)
for i in range(0,nmol):
    mol = ms[i]      
    name =  str(test_id[i]) + ".png"
    Draw.MolToFile(mol,name,size=(300,350))
   










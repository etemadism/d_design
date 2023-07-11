from __future__ import print_function
from rdkit import Chem
from rdkit.Chem import AllChem

from sys import argv
import pandas as pd
import csv

smi = list(csv.reader(open(argv[1])))
out = []
for aa in smi:
#   print(aa[0])
   a = aa[0].split("\t")
 #  print(a[1])
   m1 = Chem.MolFromSmiles(a[1])
   fp1 = AllChem.GetMorganFingerprintAsBitVect(m1,2,nBits=1024)
   fp1_b = fp1.ToBitString()
   fp2_b = ",".join(fp1_b)
   out.append([a[0],a[1],fp2_b])
out_df = pd.DataFrame(out)
out_df.to_csv(argv[2], index=False, header = ['ID', 'Smiles','FP'], sep="\t")

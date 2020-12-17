import xlwt
from xlwt import Workbook
import os
import sys

#lists of data to save
executed=[]
retired=[]
#file = open('/Users/bernicama/PROGRAMMI/mag_secondo_anno/Advanced cybersecurity topics/FLIPPED/RISULTATI/Miei/RSB/final_results.txt', 'r') 

file = open(os.path.join(sys.path[0], "final_results.txt"), 'r') 

lines = file.readlines()
#get average from each line containing substring provided and append it to list
for line in lines:
	if("SLOW_LEA" in line):
		executed.append(line.split()[2][:-1])
# for line in lines:
#         if("UOPS_RET" in line):
#                 retired.append(line.split()[2][:-1])
#print (executed)
wb = Workbook() 
sheet1 = wb.add_sheet('Sheet')

sheet1.write(0,0,'res')
i=1 
for data in executed:
	sheet1.write(i,0,data)
	i=i+1  
# i=0
# for data in retired:
#         sheet1.write(i,1,data)
#         i=i+1
wb.save(os.path.join(sys.path[0], "data.xls")) 
file.close() 

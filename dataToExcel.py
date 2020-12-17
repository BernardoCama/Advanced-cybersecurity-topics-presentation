import xlwt
from xlwt import Workbook
#lists of data to save
executed=[]
retired=[]
file = open('final_results.txt', 'r') 
lines = file.readlines()
#get average from each line containing substring provided and append it to list
for line in lines:
	if("UOPS_EXE" in line):
		executed.append(line.split()[2][:-1])
for line in lines:
        if("UOPS_RET" in line):
                retired.append(line.split()[2][:-1])
wb = Workbook() 
sheet1 = wb.add_sheet('Sheet')
i=0 
for data in executed:
	sheet1.write(i,0,data)
	i=i+1  
i=0
for data in retired:
        sheet1.write(i,1,data)
        i=i+1
wb.save('data.xls') 
file.close() 


Create Strings as file list... listA ../newDB/A/*.wav
numberOfFilesA = Get number of strings

Create Strings as file list... listE ../newDB/E/*.wav
numberOfFilesE = Get number of strings

Create Strings as file list... listF ../newDB/F/*.wav
numberOfFilesF = Get number of strings

Create Strings as file list... listL ../newDB/L/*.wav
numberOfFilesL = Get number of strings

Create Strings as file list... listN ../newDB/N/*.wav
numberOfFilesN = Get number of strings

Create Strings as file list... listT ../newDB/T/*.wav
numberOfFilesT = Get number of strings

Create Strings as file list... listW ../newDB/W/*.wav
numberOfFilesW = Get number of strings

for ifile to numberOfFilesA
  select Strings listA
  fileName$ = Get string... ifile
  Read from file... ../newDB/A/'fileName$'
endfor

for ifile to numberOfFilesE
  select Strings listE
  fileName$ = Get string... ifile
  Read from file... ../newDB/E/'fileName$'
endfor

for ifile to numberOfFilesF
  select Strings listF
  fileName$ = Get string... ifile
  Read from file... ../newDB/F/'fileName$'
endfor

for ifile to numberOfFilesL
  select Strings listL
  fileName$ = Get string... ifile
  Read from file... ../newDB/L/'fileName$'
endfor

for ifile to numberOfFilesN
  select Strings listN
  fileName$ = Get string... ifile
  Read from file... ../newDB/N/'fileName$'
endfor

for ifile to numberOfFilesT
  select Strings listT
  fileName$ = Get string... ifile
  Read from file... ../newDB/T/'fileName$'
endfor

for ifile to numberOfFilesW
  select Strings listW
  fileName$ = Get string... ifile
  Read from file... ../newDB/W/'fileName$'
endfor

echo Extracting Intensity Features
include intensity_extraction.psc
echo Extracting Pitch Features
include pitch_extraction.psc

select all
Remove

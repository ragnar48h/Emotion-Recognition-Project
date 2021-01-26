for n to 7
  
  if n==1
	select Strings listA
	
    elsif  n==2
	select Strings listE
    elsif  n==3
	select Strings listF
    elsif  n==4
	select Strings listL
    elsif  n==5
	select Strings listN
    elsif  n==6
	select Strings listT
    elsif  n==7
	select Strings listW
    endif   


    numberOfFiles = Get number of strings
	if numberOfFiles > 0
		  for ifile to numberOfFiles
		     
		    if n==1
			select Strings listA
			emo$ = "A"
		    elsif  n==2
			select Strings listE
			emo$ = "E"
		    elsif  n==3
			select Strings listF
			emo$ = "F"
		    elsif  n==4
			select Strings listL
			emo$ = "L"
		    elsif  n==5
			select Strings listN
			emo$ = "N"
		    elsif  n==6
			select Strings listT
			emo$ = "T"
		    elsif  n==7
			select Strings listW
			emo$ = "W"
		    endif   
	fileName$ = Get string... ifile
	
	name$ = fileName$ - ".wav"

		select Sound 'name$'
   		
 		To Intensity... 120.0 0.0 on
			
			mean_value = Get mean... 0.0 0.0 energy
			if mean_value = undefined
			 mean_value = 0
			endif  

			std_value = Get standard deviation... 0.0 0.0 
			if std_value = undefined
				std_value = 0
			endif

			median_value = Get quantile... 0.0 0.0 0.5
			if median_value = undefined
				median_value = 0
			endif			

			min_value = Get minimum... 0.0 0.0 parabolic
			if min_value = undefined
				min_value = 0
			endif

			max_value = Get maximum... 0.0 0.0 parabolic
			if max_value = undefined
				max_value = 0
			endif

			time_of_min = Get time of minimum... 0.0 0.0 parabolic
			if time_of_min = undefined
				time_of_min = 0
			endif

			time_of_max = Get time of maximum... 0.0 0.0 parabolic
			if time_of_max = undefined
				time_of_max = 0
			endif

			first_quartile = Get quantile... 0.0 0.0 0.25
			if first_quartile = undefined
				first_quartile = 0
			endif

			third_quartile = Get quantile... 0.0 0.0 0.75
			if third_quartile = undefined
				third_quartile = 0
			endif

			path$="features/Intensity_Features.txt"
			fileappend 'path$' 'name$' 'mean_value' 'std_value' 'median_value' 'min_value' 'max_value' 'time_of_min' 'time_of_max' 'first_quartile' 'third_quartile' 'emo$' 'newline$'

		select Intensity 'name$'
		Remove
		endfor
		
	endif
	
endfor



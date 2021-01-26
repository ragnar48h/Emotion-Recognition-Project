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

		    numberOfFiles = Get number of strings
		    fileName$ = Get string... ifile
		    name$ = fileName$ - ".wav"
		    select Sound 'name$'
		    To Pitch (ac)... 0.0 50.0 15 off 0.1 0.60 0.01 0.35 0.14 500.0

			mean_value = Get mean... 0.0 0.0 Hertz
			if mean_value = undefined
			 mean_value = 0
			endif  

			std_value = Get standard deviation... 0.0 0.0 Hertz
			if std_value = undefined
				std_value = 0
			endif

			median_value = Get quantile... 0.0 0.0 0.5 Hertz
			if median_value = undefined
				median_value = 0
			endif			

			min_value = Get minimum... 0.0 0.0 Hertz Parabolic
			if min_value = undefined
				min_value = 0
			endif

			max_value = Get maximum... 0.0 0.0 Hertz Parabolic
			if max_value = undefined
				max_value = 0
			endif

			time_of_min = Get time of minimum... 0.0 0.0 Hertz Parabolic
			if time_of_min = undefined
				time_of_min = 0
			endif

			time_of_max = Get time of maximum... 0.0 0.0 Hertz Parabolic
			if time_of_max = undefined
				time_of_max = 0
			endif

			first_quartile = Get quantile... 0.0 0.0 0.25 Hertz
			if first_quartile = undefined
				first_quartile = 0
			endif

			third_quartile = Get quantile... 0.0 0.0 0.75 Hertz
			if third_quartile = undefined
				third_quartile = 0
			endif

			mean_abs_slope = Get mean absolute slope... Hertz

			path$="features/Pitch_Features.txt"
			fileappend 'path$' 'name$' 'mean_value' 'std_value' 'median_value' 'min_value' 'max_value' 'time_of_min' 'time_of_max' 'first_quartile' 'third_quartile' 'mean_abs_slope' 'emo$' 'newline$'
		    
		    select Pitch 'name$'
		    Remove
		      endfor
	endif
endfor

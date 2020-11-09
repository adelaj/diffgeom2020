.RECIPEPREFIX := $(.RECIPEPREFIX) #

%.pdf:
      lualatex $*.tex
      biber $*.bcf
      sed -i 's/{\\textup\s*{\([^}]\+\)}}/{\1}/g' $*.idx
      makeindex $*.idx
      lualatex $*.tex

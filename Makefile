.RECIPEPREFIX := $(.RECIPEPREFIX) #

main.pdf:

%.pdf: %.tex
      lualatex $<
      biber $*.bcf
      sed -i 's/{\\textup\s*{\([^}]\+\)}}/{\1}/g' $*.idx
      makeindex $*.idx
      lualatex $<

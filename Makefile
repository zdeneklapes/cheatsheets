CO=rl_cheatsheet
CMD_PDFLATEX=pdflatex
CMD_BIBTEX=bibtex
OUT_DIR=./out
FLAGS=-synctex=1 -output-directory=$(OUT_DIR)
RM=rm -rfd

pdf: $(CO).pdf

$(CO).pdf: clean setup
	$(CMD_PDFLATEX) $(FLAGS) $(CO)
	-$(CMD_BIBTEX) $(OUT_DIR)/$(CO)
	$(CMD_PDFLATEX) $(FLAGS) $(CO)
	$(CMD_PDFLATEX) $(FLAGS) $(CO)
clean:
	$(RM) $(OUT_DIR)
	find . -iname "*.log" -delete

setup:
	mkdir $(OUT_DIR)

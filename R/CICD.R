#-------------------------- spell-check ----------------------------------------

# create empty wordlist:
# write("", file =   "inst/WORDLIST.txt")
# check spelling:
spelling::spell_check_files(list.files(pattern = ".*.qmd$", recursive = TRUE),
  ignore = readr::read_lines("inst/WORDLIST.txt"),
  lang = "inst/de_CH_frami.dic"
)

# now check those words and whether or not they are really mistakes.
# once you fixed all mistaked you can:
words <- spelling::spell_check_files(list.files(pattern = ".*.qmd$", recursive = TRUE),
  ignore = readr::read_lines("inst/WORDLIST.txt"),
  lang = "inst/de_CH_frami.dic"
)
# now you can add words to the wordlist
#-- uncomment the following line
# write(words[[1]], file =   "inst/WORDLIST.txt", append = TRUE)

spelling::spell_check_files(list.files(pattern = ".*.qmd$", recursive = TRUE),
  ignore = readr::read_lines("inst/WORDLIST.txt"),
  lang = "inst/de_CH_frami.dic"
)

#-------------------------- style-check ----------------------------------------

# this is what happens in CICD:
styler::style_dir(dry = "fail")

# fix it like this:
styler::style_dir()

# now it should work:
styler::style_dir(dry = "fail")

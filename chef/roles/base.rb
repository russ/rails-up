name "base"
run_list "recipe[apt]", "recipe[application::user]", "recipe[rvm]", "recipe[rvm::vagrant]"

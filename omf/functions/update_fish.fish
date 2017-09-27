function update_fish
	echo (c magenta)'updating brew...'(c normal)
  brew update
  echo (c magenta)'updating fish shell...'(c normal)
  brew upgrade fish
  echo (c magenta)'cleaning brew...'(c normal)
  brew cleanup
  echo (c magenta)'updating omf...'(c normal)
  omf update
  echo (c magenta)'updating fish completions...'(c normal)
  fish_update_completions
end

function check_umbrella_deps
	for app in apps/*
    echo (c magenta)(string replace 'apps/' '' $app)(c normal)
    cd $app
    mix hex.outdated
    cd -
  end
end

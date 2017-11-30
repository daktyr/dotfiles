function olrm -d "open last rails migration"
	vim db/migrate/(ls db/migrate/ | sort | tail -1)
end

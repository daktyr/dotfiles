function olem -d "open last ecto migration"
	vim priv/repo/migrations/(ls priv/repo/migrations/ | sort | tail -1)
end

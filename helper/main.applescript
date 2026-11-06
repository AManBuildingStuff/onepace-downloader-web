on open location theURL
	set scriptPath to POSIX path of (path to resource "add.sh")
	do shell script "/bin/zsh " & quoted form of scriptPath & " " & quoted form of theURL
end open location

on run
	display dialog "One Pace Helper is installed. It runs by itself when you click “Add all to Transmission” in One Pace Downloader." buttons {"OK"} default button "OK" with title "One Pace Helper"
end run

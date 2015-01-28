on run
	tell application "Finder"
		set myPath to quoted form of POSIX path of ((container of (path to me) as string))
	end tell
	tell application "Finder"
		if selection is {} then
			set finderSelection to quoted form of POSIX path of (folder of the front window as string)
		else
			set sel to (first item of (selection as list))
			if class of sel is folder then
				set finderSelection to quoted form of POSIX path of (sel as string)
			else
				set finderSelection to quoted form of POSIX path of ((container of sel) as string)
			end if
		end if
	end tell
	tell application "Terminal"
		activate
		set scriptPath to myPath & "SimpleHTTPServer_in_node.app/Contents/Resources/script.sh "
		do script "bash " & scriptPath & finderSelection
	end tell
end run
pushd Server
start node Server.js -h 127.0.0.1 -p 3011 -k 30 11
popd
pushd WebClient
start index.html
popd
pushd Arena

IF EXIST P1.exe (
	start "Bot C++" cmd /c call P1.exe -h 127.0.0.1 -p 3011 -k 30
) ELSE IF EXIST P1.js (
	copy P1.js P2.js
	start node P1.js -h 127.0.0.1 -p 3011 -k 30
) ELSE IF EXIST P1.jar (
	IF EXIST tyrus-standalone-client-1.10.jar (
		start "Bot Java" cmd /c call java -jar P1.jar -h 127.0.0.1 -p 3011 -k 30
	) ELSE (
		echo tyrus-standalone-client-1.10.jar missing. Please copy it to Arena folder.
	)
)


popd
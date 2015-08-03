; Author: CommanderJeb
; Version: 0.0.0
; Date: 07/13/2015
; Last Update: 7/15/2015

#include <File.au3>

Global $filePathToUpload = "H:\Old Backups\Pictures\2009-11-19\"
Global $siaCLI = "C:\Users\%username%\Desktop\Mining\Siacoin\3.3.3\win64\resources\app\Sia\"
Global $iniFile = "c:\temp\temp1.txt"
Global $logFile = "c:\temp\logs\log.txt"

$CMD = 'DIR /b "H:\Old Backups\Pictures\Chicago Trip (My Camera)\*.jpg" > c:\temp\temp1.txt'
RunWait(@ComSpec & " /c " & $CMD)

FileOpen($iniFile)
FileOpen($logFile)
Global $lineCount = _FileCountLines($iniFile)

;ConsoleWrite(@CRLF & "File size (MB): " & FileGetSize("c:\temp\temp1.txt")/1048576)
;ConsoleWrite(@CRLF & "Line count: " & $lineCount & @CRLF & @CRLF)



For $i = 1 to $lineCount Step 1 ;Run through all the files, one by one for the first tests

   Local $fileName = FileReadLine($iniFile,$i)
;~    Local $command = ('siac renter upload ' & $filePathToUpload & $fileName & ' ' & $fileName)
   Local $response = RunWait(@ComSpec & " /c " & "C:\Users\%username%\Desktop\Mining\Siacoin\3.3.3\win64\resources\app\Sia\" & "'" & $filePathToUpload & "'" & $fileName & '" ' & $fileName)


   ConsoleWrite("C:\Users\%username%\Desktop\Mining\Siacoin\3.3.3\win64\resources\app\Sia\" & 'siac renter upload ' & "'" & $filePathToUpload & "'" & $fileName & '" ' & $fileName & @CRLF)

	  ConsoleWrite($response & @CRLF & "Waiting 5 minutes" & @CRLF)
	  Sleep(500000)

;~    FileWrite($logFile,$command)

Next

FileClose($iniFile)
FileClose($logFile)
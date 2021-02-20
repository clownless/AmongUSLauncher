Logging(status,text)
{
	if (status = 1)
	{
		out = [LOG]%A_DD%.%A_MM%.%A_YYYY% - %A_Hour%:%A_Min%:%A_Sec% - %text%`n
		FileAppend, %out%, %A_ScriptDir%\logs.log
	}
	if (status = 2)
	{
		out = [ERR]%A_DD%.%A_MM%.%A_YYYY% - %A_Hour%:%A_Min%:%A_Sec% - %text%`n
		FileAppend, %out%, %A_ScriptDir%\logs.log
	}
}


OnError("LogError")

LogError(exception)
{
	Logging(2, "Error on line " exception.Line ": " exception.Message)
	MsgBox, 16, %script%, An error occurred while executing the program. Details can be found in the log file.
    ExitApp
}
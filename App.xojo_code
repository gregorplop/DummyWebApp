#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(request As WebRequest, response As WebResponse) As Boolean
		  if request.Path = "" then Return false
		  
		  
		  dim path() as String = request.Path.Split("/")
		  if path.Count > 1 then
		    if path(path.LastIndex) = "" then call path.Pop
		  end if
		  
		  // routing begins here
		  
		  select case path(0).Lowercase
		    
		  case "info"
		    
		    if path(1).Lowercase = "general" and request.Method = "GET" then
		      
		      response.MIMEType = "application/json"
		      response.Write(GetInfoJSON.ToString)
		      response.Status = 200
		      
		    else
		      response.MIMEType = "text/html"
		      response.Write(GetHTMLMessage("Error" , "400 Bad Request" , "Invalid endpoint"))
		      response.Status = 400
		    end if
		    
		    
		  case "download"
		    
		    if path(1).Lowercase = "executable" and request.Method = "GET" then
		      
		      response.MIMEType = "application/octet-stream"
		      response.File = app.ExecutableFile
		      response.Status = 200
		      
		    else
		      response.MIMEType = "text/html"
		      response.Write(GetHTMLMessage("Error" , "400 Bad Request" , "Invalid endpoint"))
		      response.Status = 400
		    end if
		    
		  else
		    response.MIMEType = "text/html"
		    response.Write(GetHTMLMessage("Error" , "400 Bad Request" , "Invalid endpoint"))
		    response.Status = 400
		    
		  end Select
		  
		  Return true
		  
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() As String)
		  StartStamp = DateTime.Now
		  
		  for i as Integer = 0 to args.LastIndex
		    CmdLineArgs.Add args(i)
		  next i 
		  
		  
		  dim s as new Shell
		  s.ExecuteMode = shell.ExecuteModes.Synchronous
		  s.Execute("whoami")
		  OSUser = s.Result.Trim
		  s.Close
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetHTMLMessage(WindowTitle as String, PageTitle as String, Message as String) As String
		  Return HTMLMessageTemplate.ReplaceAll("$WINDOWTITLE$" , WindowTitle).ReplaceAll("$PAGETITLE$" , PageTitle).ReplaceAll("$PAGETEXT$" , Message)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoJSON() As JSONItem
		  dim output as new JSONItem
		  output.Compact = False
		  
		  output.Value("Last Refresh") = DateTime.Now.SQLDateTime
		  output.Value("Instance Start") = app.StartStamp.SQLDateTime
		  output.Value("Process owner") = app.OSUser
		  output.Value("Executable Path") = app.ExecutableFile.NativePath
		  output.Value("Command Line") = String.FromArray(app.CmdLineArgs , " ")
		  output.Value("Port") = app.Port.ToString
		  output.Value("SSL Port") = app.SSLPort.ToString
		  output.Value("Active Sessions") = app.SessionCount.ToString
		  output.Value("Memory Allocated") = Runtime.MemoryUsed.ToString
		  output.Value("Object Count") = Runtime.ObjectCount.ToString
		  
		  Return output
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CmdLineArgs() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OSUser As String
	#tag EndProperty

	#tag Property, Flags = &h0
		StartStamp As DateTime
	#tag EndProperty


	#tag Constant, Name = HTMLMessageTemplate, Type = String, Dynamic = False, Default = \"<!DOCTYPE html>\r\n<html lang\x3D\"en\">\r\n<head>\r\n  <meta charset\x3D\"UTF-8\" />\r\n  <title>$WINDOWTITLE$</title>\r\n  <meta name\x3D\"viewport\" content\x3D\"width\x3Ddevice-width\x2Cinitial-scale\x3D1\" />\r\n  <meta name\x3D\"description\" content\x3D\"\" />\r\n  <link rel\x3D\"icon\" href\x3D\"favicon.png\">\r\n</head>\r\n<body>\r\n  <h1>$PAGETITLE$</h1>\r\n  <p>$PAGETEXT$</p>\r\n</body>\r\n</html>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = License, Type = String, Dynamic = False, Default = \"The MIT License\r\nCopyright 2024 Georgios Poulopoulos\r\n\r\nPermission is hereby granted\x2C free of charge\x2C to any person obtaining a copy of this software and associated documentation files (the \xE2\x80\x9CSoftware\xE2\x80\x9D)\x2C to deal in the Software without restriction\x2C including without limitation the rights to use\x2C copy\x2C modify\x2C merge\x2C publish\x2C distribute\x2C sublicense\x2C and/or sell copies of the Software\x2C and to permit persons to whom the Software is furnished to do so\x2C subject to the following conditions:\r\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\r\nTHE SOFTWARE IS PROVIDED \xE2\x80\x9CAS IS\xE2\x80\x9D\x2C WITHOUT WARRANTY OF ANY KIND\x2C EXPRESS OR IMPLIED\x2C INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY\x2C FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM\x2C DAMAGES OR OTHER LIABILITY\x2C WHETHER IN AN ACTION OF CONTRACT\x2C TORT OR OTHERWISE\x2C ARISING FROM\x2C OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

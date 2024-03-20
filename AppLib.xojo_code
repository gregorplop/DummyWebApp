#tag Module
Protected Module AppLib
	#tag Method, Flags = &h0
		Function ToFriendlyInteger(extends NativeInt as Integer) As string
		  dim FriendlyInt as String
		  dim UnfriendlyInt as string = NativeInt.ToString
		  dim len as Integer = UnfriendlyInt.Length
		  dim triplet as string
		  
		  for i as Integer = len to 0 step -3
		    triplet = UnfriendlyInt.Middle(i - 3 , 3)
		    FriendlyInt = triplet + "." + FriendlyInt
		  next i
		  
		  if FriendlyInt.Left(1) = "." then FriendlyInt = FriendlyInt.Right(FriendlyInt.Length - 1)
		  if FriendlyInt.Right(1) = "." then FriendlyInt = FriendlyInt.Left(FriendlyInt.Length - 1)
		  
		  Return FriendlyInt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToIntegerTimestamp(extends inputDate as DateTime) As String
		  if IsNull(inputDate) then inputDate = DateTime.Now
		  dim sqlstamp as string = inputDate.SQLDateTime
		  Return sqlstamp.ReplaceAll("-" , "").ReplaceAll(" " , "").ReplaceAll(":" , "")
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule

<% dim con, rec

b=request.querystring("TrackID")


set con=server.createobject("ADODB.connection")
con.provider="Microsoft.ace.OLEDB.12.0"
con.open "C:\inetpub\wwwroot\MeloListens\MeloListens.accdb"
set rec=server.createobject("ADODB.recordset")
rec.open "Tracks", con

do until rec.eof
	if b=rec("TrackID") then
		TrackName=rec("TrackName")
		TrackNo=rec("TrackNo")
		Artist=rec("Artist")
		Album=rec("Album")
		Genre=rec("Genre")
		ReleaseDate=rec("ReleaseDate")
		Label=rec("Label")
		Length=rec("Length")
		Writer=rec("Writer")
		Producer=rec("Producer")
		Lyrics=rec("Lyrics")
		Note=rec("Note")
		Art=rec("Art")
		Sample=rec("Sample")

		exit do
	else
		TrackName="NotFound"
		TrackNo="NotFound"
		Artist="NotFound"
		Album="NotFound"
		Genre="NotFound"
		ReleaseDate="NotFound"
		Label="NotFound"
		Length="NotFound"
		Writer="NotFound"
		Producer="NotFound"
		Lyrics="NotFound"
		Note="NotFound"
		Art="NotFound"
		Sample="NotFound"
		rec.movenext
	end if
	

loop
	
rec.close
con.close
set rec=nothing
set con=nothing
%>



<html>
	<head>
		<base=C:\Documents and Settings\User\Desktop\MeloListens>
		<title>MeloListens.com  | <%=TrackName%> (<%=Artist%>)</title>
	</head>

	<body background="images\bgm.jpg" link="brown" vlink="brown" alink="#ff9f00">

		<table align=right border=2><tr><td><font size=+1>_____Adverstise Here!____ <br><br><a href=mailto:advertisements@melolistens.com><center>Email us.</center></a></font></td><td><font size=+1>_____Adverstise Here!____ <br><br><a href=mailto:advertisements@melolistens.com><center>Email us.</center></a></font></td></tr></table>



		
		<br><br><br><br><a name=top>
		<table cellpadding=25>
			<tr>	<td rowspan=2><br><img src=images\logo3.gif><br><br></td>
				<td><a href=about.htm><br><h3>About MeloListens</h3></a></td>
				<td><a href=tour.htm><br><h3>Take a Tour</h3></a></td>
				<td><a href=browse.htm><br><h3>Browse</h3></a></td>
				<td><a href=signup.htm><br><h3>Profile</h3></a></td>	
				<td><a href=Group.htm><br><h3>Groups</h3></a></td> 	
				<td><a href=home.htm><img src=images\home.gif></a></td>
			
		</table>
		
				<br><center><big><b>Browse by<a href=browse.htm> Artist</a> / <a href=browsealbum.htm> Album</a> / <a href=browsetracks.htm> Tracks </a></b></big></center>
		<hr size=5 color=yellow> <font  face="goudy stout" size=10><center><%=TrackName%><br><small><small><small>(<%=Artist%>)</small></small></small></font><hr size=5 color=yellow>
		<br>
</center>
		<br>





		<table border=1 align=right><td><table>
			<tr><th colspan=2 bgcolor=yellow align=center><%=TrackName%>
			<tr><th colspan=2 align=center><img src=images\<%=Art%>.jpg>
			<tr><th colspan=2 bgcolor=yellow align=center>Song by <a href=enriqueiglesias.htm><%=Artist%>
			<tr><th>Album<td><a href=7.htm><%=album%>
			<tr><th>Track no.<td><%=TrackNo%>
			<tr><th>Release<td> <%=ReleaseDate%>
			<tr><th>Genre<td><%=Genre%>
			<tr><th>Label<td><%=Label%>
			<tr><th>Writers<td><%=Writer%> 
			<tr><th>Producer<td><%=Producer%>
			<tr><th>Length<td><%=Length%>
		</table></table>

		<%=Note%><br><br>

		<form><table cellpadding=12><tr><td><b>Add this single to your MeloListens' lists:</b><td><select><option>To Listen<option>To Buy<option>Listening to it Now<option>Favorites<option>Have Listened to it<option>Albums I Own</select><tr><td><b>Rate this single Overall:</b><td><input type=radio name=star>1 of 5 stars<br><input type=radio name=star>2 of 5 stars<br><input type=radio name=star>3 of 5 stars<br><input type=radio name=star>4 of 5 stars<br><input type=radio name=star>5 of 5 stars</table><br> <input type=submit value=save onclick=ok()></form><br><br><br><br><br><br><br><br><br><br>
	<table align=right><th>Listen to sample:<br><embed src=tracks/<%Sample%>.mp3></table>
		<h2><b>Lyrics to '<%=TrackName%>'(from AZLyrics)</b></h2><br><pre>
<%=Lyrics%></pre>
	<br><hr size=5 color=blue><b><center>Want to add a song? See a mistake? <a href=addnew.htm>Tell us here.</a></center></b><hr size=5 color=blue><font face="monotype corsiva"> To add a new album or artist, just add a new song from/by that album/artist <a href=addnew.htm>here.</a> We'll automatically add the corresponding album/artist.<hr size=4 color=blue><br>
		<hr><table width=100%><th><a href=privacy.htm>Privacy Policy</a><th><a href=about.htm>About Us</a><th><a href=contact.htm>Contact Us</a></table><hr>
		<font face="courier new" align=right size=+1 color=purple> © 2014 MeloListens.com<br>All data are properties of respective owners</font><br><br><hr>

	</body>
</html>
<% dim con, rec

b=request.querystring("AlbumID")


set con=server.createobject("ADODB.connection")
con.provider="Microsoft.ace.OLEDB.12.0"
con.open "C:\inetpub\wwwroot\MeloListens\MeloListens.accdb"
set rec=server.createobject("ADODB.recordset")
rec.open "Albums", con

do until rec.eof
	if b=rec("AlbumID") then

		AlbumName=rec("AlbumName")
		Artist=rec("Artist")
		Genre=rec("Genre")
		ReleaseDate=rec("ReleaseDate")
		NumberofTracks=rec("NumberofTracks")
		Label=rec("Label")
		Writer=rec("Writer")
		Producer=rec("Producer")
		Ratings=rec("Ratings")
		AvgRating=rec("AvgRating")
		Note=rec("Note")

		exit do

	else

		AlbumName="NotFound"
		Artist="NotFound"
		Genre="NotFound"
		ReleaseDate="NotFound"
		NumberofTracks="NotFound"
		Label="NotFound"
		Writer="NotFound"
		Producer="NotFound"
		Ratings="NotFound"
		AvgRating="NotFound"
		Note="NotFound"

		rec.movenext
	end if
	
loop
	
rec.close
con.close
set rec=nothing
set con=nothing
%>

set con=server.createobject("ADODB.connection")
con.provider="Microsoft.ace.OLEDB.12.0"
con.open "C:\inetpub\wwwroot\MeloListens\MeloListens.accdb"
set rec=server.createobject("ADODB.recordset")
rec.open "Tracks", con

for k=1 to Numberoftracks

do until rec.eof
	if AlbumName=rec("Album") and Artist=rec("Artist") then
		TrackName=rec("TrackName")
		TWriter=rec("Writer")
		TProducer=rec("TrackName")
		TLength=rec("TrackName")
		rec.movenext
		exit do
	else
		rec.movenext
	end if
loop
response.write("<tr><td>" &k& "<td>" &TrackName& "<td>" &TWriter& "<td>" &TProducer& "<td>" &Length)
next


<html>
	<head>
		<base=C:\Documents and Settings\User\Desktop\MeloListens>
		<title>MeloListens.com  | <%=Album%></title>
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
		<hr size=5 color=yellow> <font  face="goudy stout" size=10><center><%=Album%><br><small><small><small>(<%=Artist%>)</small></small></small></font><hr size=5 color=yellow>
		<br>
</center>
		<br>





		<table border=1 align=right><td><table>
			<tr><th colspan=2 bgcolor=yellow align=center><%=Album%>
			<tr><th colspan=2 align=center><img src=images\<%=Album%>.jpg>
			<tr><th colspan=2 bgcolor=yellow align=center>Studio album by <a href=<%=Artist%>.asp><%=Artist%>
			<tr><th>Release<td> <%=ReleaseDate%>
			<tr><th>Genre<td>Pop<%=Genre%>
			<tr><th>Label<td><%=Label%>
			<tr><th>Producer<td><%=Producer%>
			<tr><th colspan=2 bgcolor=yellow align=center>Ratings
			<tr><th>No. of ratings<td><%=Ratings%>
			<tr><th>Rating<td><%=AvgRating%>
		</table></table>

		<%=Note%>
	<a href="http://en.wikipedia.org/wiki/<%=Album%>">more on Wikipedia</a><br><br><br>
		<form name=album><table cellpadding=12><tr><td><b>Add this album to your MeloListens' lists:</b><td><select><option>To Listen<option>To Buy<option>Listening to it Now<option>Favorites<option>Have Listened to it<option>Albums I Own</select><tr><td><b>Rate this Album Overall:</b><td><input type=radio name=rate>1 of 5 stars<br><input type=radio name=rate>2 of 5 stars<br><input type=radio name=rate>3 of 5 stars<br><input type=radio name=rate>4 of 5 stars<br><input type=radio name=rate>5 of 5 stars</table><br> <input type=submit value=save onclick=ok()>
<br><br><br></form><br><br><br><br>
<h2><b>Track Listing</b></h2><br>
	<table cellpadding=12> <tr><th>No.<th>Title<th>Writer(s)<th>Producer(s)<th>Length

<%
set con=server.createobject("ADODB.connection")
con.provider="Microsoft.ace.OLEDB.12.0"
con.open "C:\inetpub\wwwroot\MeloListens\MeloListens.accdb"
set rec=server.createobject("ADODB.recordset")
rec.open "Tracks", con

for k=1 to Numberoftracks

do until rec.eof
	if AlbumName=rec("Album") then
		TrackName=rec("TrackName")
		TWriter=rec("Writer")
		TProducer=rec("TrackName")
		TLength=rec("TrackName")
		rec.movenext
		exit do
	else
		rec.movenext
	end if
loop
response.write("<tr><td>" &k& "<td>" &TrackName& "<td>" &TWriter& "<td>" &TProducer& "<td>" &Length)
next

rec.close
con.close
set rec=nothing
set con=nothing
%>


	</table>
	<br><hr size=5 color=blue><b><center>Want to add a song? See a mistake? <a href=addnew.htm>Tell us here.</a></center></b><hr size=5 color=blue><font face="monotype corsiva"> To add a new album or artist, just add a new song from/by that album/artist <a href=addnew.htm>here.</a> We'll automatically add the corresponding album/artist.<hr size=4 color=blue><br>
		<hr><table width=100%><th><a href=privacy.htm>Privacy Policy</a><th><a href=about.htm>About Us</a><th><a href=contact.htm>Contact Us</a></table><hr>
		<font face="courier new" align=right size=+1 color=purple> � 2014 MeloListens.com<br>All data are properties of respective owners</font><br><br><hr>

	</body>
</html>
<%
		TrackName=request.querystring("TrackName")
		TrackNo=request.querystring("TrackNo")
		Artist=request.querystring("Artist")
		Album=request.querystring("Album")
		Genre=request.querystring("Genre")
		ReleaseDate=request.querystring("ReleaseDate")
		Label=request.querystring("Label")
		Length=request.querystring("Length")
		Writer=request.querystring("Writer")
		Producer=request.querystring("Producer")
		Lyrics=request.querystring("Lyrics")
		Note=request.querystring("Note")
		Art=request.querystring("Art")
		Sample=request.querystring("Sample")

		k=1
set con=server.createobject("ADODB.connection")
con.provider="Microsoft.ace.OLEDB.12.0"
con.open "C:\inetpub\wwwroot\MeloListens\MeloListens.accdb"
set rec=server.createobject("ADODB.recordset")
rec.open "Tracks", con, 1, 3

do until rec.eof
	if TrackName=rec("TrackName") and Artist=rec("Artist") and Album=rec("Album") then
		OID=rec("TrackID")
		response.write("<br><br>We found a track with the same name and details. If its another version, we suggest you do not add it. If its by another artist, we suggest you read the guidelines <a href=C:\inetpub\wwwroot\MeloListens\MeloListens\guide.htm>here</a>.<br>" )
		response.write("<br>Track: <a href=http:\\localhost\MeloListens\MeloListens\opentrack.asp?TrackID=<%=OID%>>" &TrackName& "</a>")
		response.write("<br>Album:" &Album)
		response.write("<br>Artist:" &Artist)
		k=k+1
	end if
loop
if k=1 then
	rec.addnew
		rec("TrackName")=TrackName
		rec("TrackNo")=TrackNo
		rec("Artist")=Artist
		rec("Album")=Album
		rec("Genre")=Genre
		rec("ReleaseDate")=ReleaseDate
		rec("Label")=Label
		rec("Length")=Length
		rec("Writer")=Writer
		rec("Producer")=Producer
		rec("Lyrics")=Lyrics
		rec("Note")=Note
		rec("Art")=Art
		rec("Sample")=Sample
	rec.update
end if
rec.close
con.close
set rec=nothing
set con=nothing
%>


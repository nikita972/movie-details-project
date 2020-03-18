<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.movies.*" %>
  <%@ page import="java.sql.Connection"%>
  <%@ page import="java.sql.PreparedStatement"%>
  <%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<link rel="stylesheet" href="../css/movie_style.css"/>
</head>
<script type="text/javascript">
 if(window.history.replaceState)
	 {
	 	window.history.replaceState(null,null,window.location.href);
	 }
</script>
<body>
<div class="container">
	<div class="row" >
		<div class="col-md-3"></div>
			<div class="col-md-5" style="background-color: aliceblue;margin-top:40px;">
				<form action="movie-details.jsp" method="post">
				<table class="table">
				<tr>
					<th>Movie name:</th>
					<td><input type="text" name="movie_name" required class="txt-box" placeholder="movie name"><br><br></td>
				</tr>
				<tr>
					<th>Charater name:</th>
					<td><input type="text" name="character_name" required class="txt-box" placeholder="character name"><br><br></td>
				</tr>
				</table>
				<input type="submit" value="SAVE" class="search-btn"> 
			</form>
		</div>
		
	</div>
</div>
	<%! String movie_name,character_name,db_movie_name;
		int count;
	%>
	<%
		Connection con1;
		PreparedStatement stmt;
		ResultSet rs;
		DBCon db=new DBCon();
		con1=db.dbCon();
		
		if(request.getParameter("movie_name")!=null && request.getParameter("character_name")!=null)
		{
			movie_name=request.getParameter("movie_name");
			character_name=request.getParameter("character_name");
			stmt=con1.prepareStatement("select * from movie");
			rs=stmt.executeQuery();
			count=0;
			while(rs.next())
			{ 
				db_movie_name=rs.getString(2);
				if(db_movie_name.equals(movie_name))
				{
					count=1;
				}
				
			}
			if(count==0)
			{
				stmt=con1.prepareStatement("insert into movie(movie_name,characters_name)values(?,?)");
				stmt.setString(1,movie_name);
				stmt.setString(2,character_name);
				int result=stmt.executeUpdate();
				
			}
			else
				{%>
			<script type='text/javascript'>
			alert('Movie name is already exist.please enter new movie name');
			</script>
		
			<%}
			}
		
			stmt=con1.prepareStatement("select * from movie");
				rs=stmt.executeQuery(); %>
				<table border="1"  class="table-class">
					<tr>
						<th>Movie Id</th>
						<th>Movie Name</th>
						<th>Character Name</th>
					</tr>
					
					
				 <%while(rs.next())
				{%>
				<tr>
					<td><%= rs.getInt(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
				</tr>
				<% }%>
				
				</table>
			
			
</body>
</html>
<%@page import="com.jspider.filmfusion_servlet_project.dto.Movie"%>
<%@page import="com.jspider.filmfusion_servlet_project.dao.MovieDao"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Gallery</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
  .card {
    margin: 10px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
  }

  .card:hover {
    transform: scale(1.05);
  }
</style>
</head>
<body>

<%
    MovieDao dao = new MovieDao();
    List<Movie> movies = dao.getAllMovieDetailsDao();
%>

<jsp:include page="front-navbar.jsp" />
<br>
<br>

<div class="container">
  <h2>Bollywood</h2>
  <div class="row">
    <%
    for (Movie movie : movies) {
        if (movie.getType().equalsIgnoreCase("BOLLYWOOD")) {
    %>
    <div class="col-md-4">
      <div class="card">
        <img src="<%=movie.getUrl()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=movie.getName()%></h5>
          <p class="card-text">Year: <%=movie.getReleasedYear()%></p>
          <a href="#" class="btn btn-primary">Details</a>
        </div>
      </div>
    </div>
    <%
        }
    }
    %>
  </div>
</div>

<div class="container">
  <h2>Hollywood</h2>
  <div class="row">
    <%
    for (Movie movie : movies) {
        if (movie.getType().equalsIgnoreCase("HOLLYWOOD")) {
    %>
    <div class="col-md-4">
      <div class="card">
        <img src="<%=movie.getUrl()%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=movie.getName()%></h5>
          <p class="card-text">Year: <%=movie.getReleasedYear()%></p>
          <a href="#" class="btn btn-primary">Details</a>
        </div>
      </div>
    </div>
    <%
        }
    }
    %>
  </div>
</div>

<div class="container">
  <h2>Tollywood</h2>
  <div class="row">
    <%
    for (Movie movie : movies) {
        if (movie.getType().equalsIgnoreCase("TOLLYWOOD")) {
            String base64Image = Base64.getEncoder().encodeToString(movie.getImageFecth());
    %>
    <div class="col-md-4">
      <div class="card">
        <img src="data:image/jpeg;base64,<%=base64Image%>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title"><%=movie.getName()%></h5>
          <p class="card-text">Year: <%=movie.getReleasedYear()%></p>
          <a href="#" class="btn btn-primary">Details</a>
        </div>
      </div>
    </div>
    <%
        }
    }
    %>
  </div>
</div>

</body>
</html>

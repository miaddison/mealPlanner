<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href= "files/style.css" rel= "stylesheet" type= "text/css" media = "screen" />
<link href = "files/printstyle.css" rel = "stylesheet" type = "text/css" media = "print"/>
<%@ page import = "java.util.ArrayList, model.Meal, controller.MealDaoImpl" %>
<title>Menu Planner - All Recipes</title>
<script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;
        }
</script>
</head>
<body>
<div id = "container">
<div id = "login">
	<a href = "login.jsp">Login</a>
</div>
<header>
	<a href = "index.html">
		<h1>Welcome to the meal planner</h1>
	</a>
</header>
<% 
ArrayList<Meal> selectedMeals = new ArrayList<Meal>();
MealDaoImpl mealDao = new MealDaoImpl();
selectedMeals = mealDao.findAll();
%>
<nav>
	<ul>
		<li><a href = "index.html">Home</a></li>
		<li><a href = "mealpick.jsp">Meal Planner</a>
		<li><a href = "allmeals.jsp">See all Meals</a></li>
	</ul>
</nav>
<main>
<br/>
<!--form style = "float:right; border: none; background: white; color: dimgray; font-size:0.8em; max-width: 50%; margin: 0; padding:0">
  <label for = "search">Search: </label>
  <input type="search" name="search" size = "20">
</form-->
	<h3 style = "clear: both">Here is our entire selection of recipes</h3>
		<nav class = "sub">
		<%for(int i = 0; i < selectedMeals.size(); i++){
					Meal meal = new Meal();
					meal = selectedMeals.get(i);
					%>
					<li><a href = "#<%=meal.getId() %>"><%=meal.getMealname() %></a></li>
		<% } %>
		</nav>
		<%for(int i = 0; i < selectedMeals.size(); i++){
					Meal meal = new Meal();
					meal = selectedMeals.get(i);
					%>
					<div id = "<%=meal.getId() %>">
					<h4><%=meal.getMealname() %></h4>
					
					<input style = "float: right; margin-right:15%" type="button" value="Print Recipe" onclick="javascript:printDiv('<%=meal.getId() %>')" />
					
					<!--begin bullet list of ingredients-->
					<ul style = "clear: both">
					
					<% for (int y = 0; y < meal.getIngredients().size(); y++){%>
						<li><%=meal.getIngredients().get(y) %></li>
					<% } %>
					 </ul> 
					
					<!--begin numbered list of directions-->
					<ol>
					<% for(int x = 0; x < meal.getDirections().size(); x++){  %>
						<li><%=meal.getDirections().get(x) %></li>
					<% } %>
					</ol>
					</div><!-- end meal div -->
					<p><a href="#top">Top of Page</a></p>	
		<%}%>
		
	
<!--h3>Click below if you would like to try again.</h3>
<form>
<button formaction="index.html" type="submit">Try again</button>
</form-->			

</main>
<footer>
	<p>&copy; 2017 Merna Addison and Sally Coil</p>
</footer>
</div><!--end container-->

</body>
</html>
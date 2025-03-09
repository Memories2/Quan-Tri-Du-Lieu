<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Client Dashboard</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="<c:url value='/resources/css/style.css'/>"
    />
  </head>
  <body>
    <header>
      <h1>Welcome to Client Dashboard</h1>
      <nav>
        <ul>
          <li><a href="<c:url value='/client/home'/>">Home</a></li>
          <li><a href="<c:url value='/client/profile'/>">Profile</a></li>
          <li><a href="<c:url value='/client/settings'/>">Settings</a></li>
          <li><a href="<c:url value='/client/logout'/>">Logout</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <h2>Dashboard Content</h2>
      <p>
        Welcome to your dashboard. Here you can find an overview of your
        activities and settings.
      </p>
      <!-- Add more client-specific content here -->
    </main>
    <footer>
      <p>&copy; 2023 Your Company. All rights reserved.</p>
    </footer>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
    integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
  <!-- Open Sans -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="form.css" />
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
</head>
<body>
  <div class="content">
    <div class="d-flex h-100 align-items-center justify-content-center">
      <div class="container">
        <div class="row position-relative">
          <div class="col-sm-12">
            <div class="glowBox">
              <h4 class="title">User Register</h4>
              <div class="socialMedia">
                <a href="#" class="btn btn-just-icon btn-link">
                  <i class="fab fa-facebook-square"></i>
                </a>
                <a href="#" class="btn btn-just-icon btn-link">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="btn btn-just-icon btn-link">
                  <i class="fab fa-google-plus"></i>
                </a>
              </div>
            </div>
            <div class="card " style="background-color: rgba(255, 255, 255, 0.1);">
              <div class="card-body p-5">
                <form action="sample.jsp" method="post">
                  <div class="desc text-center">
                    <p>Sign up now to use our services!</p>
                  </div>
                  <div class="row">
                    <div class="signUp col-sm-6">
                      <span>
                        <input type="text" class="form" placeholder="Name" autocomplete="off" style="cursor: auto;"
                          id="nameValidate" title="Enter Name with letter only" name="name" required>
                          <span class="underline"></span>
                      </span>
                      <span>
                        <input type="email" class="form" placeholder="Email" autocomplete="off" style="cursor: auto;"
                          id="emailInput" title="Enter Valid Input" name="email" required>
                          <span class="underline"></span>
                      </span>
                      <span>
                        <input type="password" class="form" placeholder="Password" autocomplete="off"
                          style="cursor: auto;" id="passwordInput" name = "password" title="more than 8 characters" required>
                          <span class="underline"></span>
                      </span>
                    </div>
                    <div class="signUp col-sm-6">
                     <span>
                        <input type="text" class="form" placeholder="Phone Number" autocomplete="off"
                          style="cursor: auto;" id="phoneInput" name = "phone" title="more than 8 characters" required>
                          <span class="underline"></span>
                      </span>
                     
                        <span>
                          <input type="text" name="birthday" class="form" placeholder="Date Of Birth" autocomplete="off"
                            style="cursor: auto;" id="datepicker" title="Date of Birth" required >
                       </span>
                          <span>
                            <select class="form" aria-label="Membership Option" id="gender" name="gender"
                              title="this is required field and u have to add" required>
                              <option selected>Gender</option>
                              <option value="Female">Female</option>
                              <option value="male">Male</option>
                              <option value="other">Other</option>

                            </select>
                            <span class="underline"></span>
                            </span>
                    </div>
                    <button type="submit" class="btn  p-2 ml-auto mr-auto mt-3" id="subscribeButton"
                      style="background: linear-gradient(45deg, #ffa600dd, #ff4400d3); width: 15%;">Register</button>

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
    <%-- JSP Processing --%>
    <%
if (request.getMethod().equalsIgnoreCase("post")) {
    String username = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String birthday = request.getParameter("birthday");
    String gender = request.getParameter("gender");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/form?useSSL=false&serverTimezone=UTC";
        String dbUsername = "root";
        String dbPassword = "abcd1234";
        
        Connection con = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
        String query = "INSERT INTO users (name, password, email, phone, birthday, gender) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, birthday);
        ps.setString(6, gender);
        ps.executeUpdate();
        ps.close();
        con.close();
        response.sendRedirect("success.jsp");
    } catch (Exception e) {
        out.println("Error: " + e);
    }
}
%>
</body>
</html>

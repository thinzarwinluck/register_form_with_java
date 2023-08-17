package form;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


@WebServlet("/registration")
public class registration extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String phone = request.getParameter("phone");
	        String birthday = request.getParameter("birthday");
	        String gender = request.getParameter("gender");
		String jdbcUrl = "jdbc:mysql://localhost:3306/form";
	        String dbusername = "root";
	        String dbpassword = "abcd1234";

	        try {
	            // Load the JDBC driver (optional for Java 8 and later)
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish the connection
	            Connection connection = DriverManager.getConnection(jdbcUrl, dbusername, dbpassword);
	            String insertQuery = "INSERT INTO users (name, email,password,phone,birthday,gender) VALUES (?, ?,?,?,?,?)";
	            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
	            preparedStatement.setString(1, name);
	            preparedStatement.setString(2, email);
	            preparedStatement.setString(3, password);
	            preparedStatement.setString(4, phone);
	            preparedStatement.setString(5, birthday);
	            preparedStatement.setString(6, gender);
	            int rowsAffected = preparedStatement.executeUpdate();
	         // Close resources
	            preparedStatement.close();
	            connection.close();

	            String result = "Thank, " + name + " for your registration";
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();

	            String pageTitle = "Thank for Your registration";

	            String htmlResponse = "<!DOCTYPE html>\n"
	                + "<html lang=\"en\">\n"
	                + "<head>\n"
	                + "<meta charset=\"UTF-8\">\n"
	                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
	                + "<title>" + pageTitle + "</title>\n"
	                + "<style>\n"
	                + "/* Your CSS styles here */\n"
	                + "body {\n"
	                + "    background-color: black;\n"
	                + "}\n"
	                + "</style>\n"
	                + "<!-- Your external resources here -->\n"
	                + "</head>\n"
	                + "<body>\n"
	                + "<nav class=\"navbar navbar-expand-lg bg-black\">\n"
	                // ... (rest of your HTML content)
	                + "<div class=\"card bg-black w-30 ml-auto mr-auto\" style=\"margin-left: 33%; height: 59vh;\">\n"
	                + "<img src=\"https://gifdb.com/images/high/pooh-and-piglet-thank-you-6wqrkd3xvlfer4i7.gif\" width=\"50%\">\n"
	                + "<h3 style='color : white'>" + result + "</h3>\n"
	                + "</div>\n"
	                + "</div>\n"
	                // ... (rest of your HTML content)
	                + "</footer>\n"
	                + "</body>\n"
	                + "</html>";

	            out.println(htmlResponse);

	        } catch (ClassNotFoundException e) {
	            System.out.println("JDBC driver not found.");
	        } catch (SQLException e) {
	            System.out.println("Error while connecting to the database: " + e.getMessage());
	        }
	    }
	}



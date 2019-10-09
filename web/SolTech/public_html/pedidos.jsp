<%-- 
    Document   : pedidos
    Created on : 3/10/2019, 04:04:05 PM
    Author     : felipe
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="OneTech shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
   <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
   <link rel="stylesheet" type="text/css" href="styles/cart_styles.css">
   <link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
        <title>JSP Page</title>
    </head>
    <body>
        
       
        <div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="cart_container">
						<div class="cart_title">Shopping Cart</div>
                                                <%
                                                String marca=request.getParameter("marca");
                                                String color=request.getParameter("color");
                                                int cantidad=Integer.parseInt(request.getParameter("cantidad"));
                                                double precio=Double.parseDouble(request.getParameter("precio"));
                                                
                                                double valorEnvio = 30000;
                                                double total = precio+valorEnvio;
                                                if(request.getParameter("btn1") !=null)
                                                {
                                                Connection connection=null;
                                                                                                ResultSet rs=null;
                                                                                                Statement sta=null;

                                                                                                try{
                                                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pedidosJSP","root","root+*");
                                                                                           
                                                                                                        

                                                                                                sta=connection.createStatement();

                                                                                                sta.executeUpdate("insert into pedidosEnEspera values('"+marca+"','"+color+"',"+cantidad+","+precio+","+total+");");
                                                                                                request.getRequestDispatcher("index.jsp").forward(request, response);                        
                                                                                                }catch(Exception e){out.print(e+"");}
                                                                                                
                                                                                                  }

                                                %>
                                                      
						<div class="cart_items">
							<ul class="cart_list">
								<li class="cart_item clearfix">
									<div class="cart_item_image"><img src="images/shopping_cart.jpg" alt=""></div>
									<div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="cart_item_name cart_info_col">
                                                                                    
											<div class="cart_item_title">Marca</div>
                                                                                        
											<div class="cart_item_text"><%out.print(marca);%></div>
										</div>
										<div class="cart_item_color cart_info_col">
											<div class="cart_item_title">Color</div>
                                                                                        
											<div class="cart_item_text"><span style="background-color:#D3D3D3"></span><%out.print(color);%></div>
										</div>
										<div class="cart_item_quantity cart_info_col">
											<div class="cart_item_title">Cantidad</div>
                                                                                        
											<div class="cart_item_text"><%out.print(cantidad);%></div>
										</div>
										<div class="cart_item_price cart_info_col">
											<div class="cart_item_title">Precio</div>
                                                                                        
											<div class="cart_item_text"><%out.print(precio);%></div>
										</div>
										<div class="cart_item_total cart_info_col">
											<div class="cart_item_title">Total</div>
											<div class="cart_item_text"><%out.print(precio);%></div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						
						<!-- Order Total -->
						<div class="order_total">
							<div class="order_total_content text-md-right">
								<div class="order_total_title">Orden total:</div>
								<div class="order_total_amount"><%out.print(total);%></div>
							</div>
						</div>

						<div class="cart_buttons">
							
                                                        <input type="submit" name="btn2" value="Confirmar Pedido">
                                                        </form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    </body>
</html>

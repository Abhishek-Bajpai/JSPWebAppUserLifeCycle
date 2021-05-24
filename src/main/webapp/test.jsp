<html>
<body>
<%
    Integer Count = 
      (Integer)application.getAttribute("Counter");

if (Count == null)
 Count = 0;
        Count += 1;
  
    application.setAttribute("Counter", Count);
%>
<center>
<p>Total number of visits: <%= Count%></p>
</center>
</body>
</html>
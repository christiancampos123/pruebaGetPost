<%@ page import="java.util.List" %>
<%@ page import="com.proyecto.clases.Generador" %>
<%@ page import="com.proyecto.clases.Persona" %>
<%@ page import="com.proyecto.clases.Profesor" %>
<%@ page import="com.proyecto.clases.Alumno" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Mostrar contenido de archivos</title>
</head>

<body>
 <ul>
        <h1><a href="index.jsp">Index</a> | <a href="alumnos.jsp">Alumnos</a> | <a href="profesores.jsp">Profesores</a></h1>

    </ul><br><br>
<form action="profesores.jsp" method="POST">
    <input type="hidden" name="archivoAlumnos">
    <input type="hidden" name="dato" value="hola">

        <label for="filtroEdad">Filtrar por edad Profesores:</label>
        <select id="filtroEdad" name="filtroEdad">
            <option value="0">Todos</option>
            <option value="20">20 años o más</option>
            <option value="30">30 años o más</option>
            <option value="40">40 años o más</option>
            <option value="50">50 años o más</option>
            <!-- Agrega más opciones según sea necesario -->
        </select>

    <input type="submit" value="Enviar">
</form>

</body>
</html>
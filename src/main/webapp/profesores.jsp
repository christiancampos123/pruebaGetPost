<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.proyecto.clases.Generador" %>
<%@ page import="com.proyecto.clases.Alumno" %>
<%@ page import="com.proyecto.clases.Profesor" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Uso de Generador en JSP</title>
    <script>
        function toggleTabla() {
            var checkbox = document.getElementById("mostrarTabla");
            var tabla = document.getElementById("tablaProfesores");

            if (checkbox.checked) {
                tabla.style.display = "table"; // Mostrar la tabla
            } else {
                tabla.style.display = "none"; // Ocultar la tabla
            }
        }
    </script>

</head>
<body>

    <ul>
        <h1><a href="index.jsp">Index</a> | <a href="alumnos.jsp">Alumnos</a> | <a href="profesores.jsp">Profesores</a></h1>

    </ul>

    <%
    Generador generador = new Generador();
    %>

    <%
    out.println("<h1>Lista de Profesores</h1>");
    String dato = request.getParameter("filtroEdad");
    //out.println("<h1>Valor  " + dato + "</h1>");
    //out.println("<h1>Valor de archivoAlumnos: " + dato + "</h1>");

    generador.leerProfesores();
    List<Profesor> listaProfesores = generador.getListaProfesores();
    %>

    <form>
        <label for="filtroEdad">Filtrar por edad:</label>
        <select id="filtroEdad" onchange="aula(document.getElementById('filtroEdad').value)">
            <option value="0">Todos</option>
            <option value="20">20 años o más</option>
            <option value="30">30 años o más</option>
            <option value="40">40 años o más</option>
            <option value="50">50 años o más</option>
            <!-- Agrega más opciones según sea necesario -->
        </select>
    </form>



        Aula
        <input id="aula"
       onchange="aula(document.getElementById('aula').value);"
       style="width: 40px; text-align: center; padding: 5px;"
       name="aula"
       maxlength="2"
       pattern="\d{2}">
       <br><br>
       <!--<button id="aulaf">filtrar</button><br> -->


    <input type="checkbox" id="mostrarTabla" checked="checked" onclick="toggleTabla()"> Mostrar/ocultar tabla

    <div id="tablaProfesores">
        <table border='1'>
            <tr>
                <th><h1>&nbsp;&nbsp;&nbsp;Nombre &nbsp;&nbsp;&nbsp;</h1></th>
                <th><h1>&nbsp;&nbsp;&nbsp;Edad &nbsp;&nbsp;&nbsp;</h1></th>
                <th><h1>&nbsp;&nbsp;&nbsp;Aula &nbsp;&nbsp;&nbsp;</h1></th>
                <th><h1>&nbsp;&nbsp;&nbsp;Horas &nbsp;&nbsp;&nbsp;</h1></th>
            </tr>
        <%
            if (listaProfesores != null && !listaProfesores.isEmpty()) {
                for (Profesor profesor : listaProfesores) {
                    out.println("<tr style='color: blue;'><th><h1>" + profesor.getNombre() +"</th><th><h1>"+ profesor.getEdad() + "</th><th><h1>" + profesor.getNumAula() +"</th><th><h1>"+ profesor.getNumHoras() +"</th></tr>");
                }
        %>
        </table>
    </div>

    <%
        } else {
    %>
    <h1>No hay profes disponibles</h1>
    <%
        }
    %>

    <script>

        function filtrarPorEdad() {
            //var filtroEdad = parseInt(document.getElementById("filtroEdad").value);

            var filtroEdad = '<%= dato %>';
            var tablaProfesores = document.getElementById("tablaProfesores");
            var filas = tablaProfesores.getElementsByTagName("tr");

            for (var i = 1; i < filas.length; i++) {
            // omitir encabezados
                var fila = filas[i];
                var edad = parseInt(fila.getElementsByTagName("th")[1].textContent); // edad en la segunda celda

                if (filtroEdad === 0 || edad >= filtroEdad) {
                    fila.style.display = ""; // Mostrar la fila
                } else {
                    fila.style.display = "none"; // Ocultar la fila
                }
            }
        }
    </script>

    <script>

        function aula(edad) {
        console.log(document.getElementById("filtroEdad").value);
            //alert("¡Hiciste clic en el botón!");
            // Puedes realizar otras acciones aquí
                //var edadB = document.getElementById("filtroEdad").value;
                var edadB = edad;
                //var edadB = '<%= dato %>';

                var filtroAula = parseInt(document.getElementById("aula").value);
                //console.log(filtroAula);
                var tablaProfesores = document.getElementById("tablaProfesores");
                var filas = tablaProfesores.getElementsByTagName("tr");
                    if (isNaN(filtroAula)){
                        filtroAula = 0;
                        //console.log("hola " + filtroAula);
                    }

                for (var i = 1; i < filas.length; i++) {
                // omitir encabezados
                    var fila = filas[i];
                    var aula = parseInt(fila.getElementsByTagName("th")[2].textContent); // aula en la tercera celda
                    var age = parseInt(fila.getElementsByTagName("th")[1].textContent);

                    if (aula == filtroAula && edadB<=age || filtroAula == 0 && edadB<=age) {
                        fila.style.display = ""; // Mostrar la fila
                    } else {
                        fila.style.display = "none"; // Ocultar la fila
                    }
                }

        }
        aula('<%= dato %>');

        // Obtener el botón por su ID
        var boton = document.getElementById("aulaf");


        // Asignar la función al evento onclick del botón
        boton.onclick = () => {
            var valorFiltro = document.getElementById("filtroEdad").value;
            aula(valorFiltro);
        };

    </script>


</body>
</html>

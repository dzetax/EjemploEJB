<%--Paso 1: Declarar el servicio --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="modelo.ServicioLocal" %>
<%! ServicioLocal servicio; %>

<%--Paso 2: Crear el contexto y el servicio --%>
<%
    InitialContext ctx=new InitialContext();
    servicio=(ServicioLocal)ctx.lookup("java:global/EjemploSingleton/Servicio!modelo.ServicioLocal");
%>

<%-- Paso 3: Hacer que el servicio sea visible para EL y JSTL --%>
<c:set var="servicio" scope="page" value="<%=servicio%>"/>

<%@include file="Templates/header.jsp"%>

<div class="row">
    <div class="col s6 offset-s3">
        <div class="card-panel">
            <p class="center-align"><span class="blue-text text-darken-2">Ingresar Productos</span></p>
            <form action="control.do" method="post">
            <div class="input-field">
                <input id="nombre" name="nombre" type="text" class="validate">
                <label for="nombre">Nombre:</label>
            </div>
            <div class="input-field">
                <input id="precio" name="precio" type="text" class="validate">
                <label for="precio">Precio:</label>
            </div>
                <button type="submit" class="btn right">Guardar</button>
                <br/><br/>
            </form>
        </div>
        <table class="bordered highlight">
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>
            <c:forEach items="${servicio.producto}" var="p">
                <tr>
                <td>${p.nombre}</td>
                <td>${p.precio}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<%@include file="Templates/footer.jsp"%>
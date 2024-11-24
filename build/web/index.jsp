<%-- 
    Document   : index
    Created on : Nov 23, 2024, 4:25:33 PM
    Author     : hg259
--%>
<%@page import="modelo.Cliente" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Clientes</h1>
        <div class="container">
        <form action="sr_cliente" method="post" class="form-group">
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" readonly>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                <label for="lbl_nit"><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 10248154-7" required>
                <label for="lbl_genero"><b>Genero:</b></label>
                <input type="text" name="txt_genero" id="txt_genero" class="form-control" placeholder="Ejemplo: Masculino - Femenino - Otros" required>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 89562354" required>
                <label for="lbl_correo"><b>Correo Electronico</b>:</b></label>
                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: example@gmail.com" required>
                <label for="lbl_fingreso"><b>Fecha Ingreso:</b></label>
                <input type="date" name="txt_fingreso" id="txt_fingreso" class="form-control" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg"><b>Agregar</b></button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg"><b>Modificar</b></button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg"><b>Eliminar</b></button>
            </form>
    <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Nit</th>
        <th>Telefono</th>
        <th>Genero</th>
        <th>Correo Electronico</th>
        <th>Fecha de Ingreso</th>
      </tr>
    </thead>
    <tbody id="tbl_clientes">
      <tr>
          <% 
          Cliente cliente = new Cliente ();
          DefaultTableModel tabla = new DefaultTableModel();
          tabla = cliente.leer();
          for(int t=0;t<tabla.getRowCount();t++){
             out.println("<tr>");
             out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
             out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
             out.println("</tr>");
              }
          %>
      </tr>
    </tbody>
  </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
       <script type="text/javascript">
        $('#tbl_clientes').on('click','tr',function(evt){
        var target, id, nombres, apellidos, nit, genero, telefono, correo, fingreso;
        target = $(evt.target);
        
        id = target.closest("tr").find("td").eq(0).html();
        nombres = target.closest("tr").find("td").eq(1).html();
        apellidos = target.closest("tr").find("td").eq(2).html();
        nit = target.closest("tr").find("td").eq(3).html();
        genero = target.closest("tr").find("td").eq(4).html();
        telefono = target.closest("tr").find("td").eq(5).html();
        correo = target.closest("tr").find("td").eq(6).html();
        fingreso = target.closest("tr").find("td").eq(7).html();
        
        $("#txt_id").val(id);
        $("#txt_nombres").val(nombres);
        $("#txt_apellidos").val(apellidos);
        $("#txt_nit").val(nit);
        $("#drop_genero").val(genero);
        $("#txt_telefono").val(telefono);
        $("#txt_correo").val(correo);
        $("#txt_fingreso").val(fingreso);
        });
        </script>
    </body>
</html>

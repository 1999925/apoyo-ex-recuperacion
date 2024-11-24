/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.util.HashMap;
import java.sql.SQLDataException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author hg259
 */
public class Cliente extends Persona {
    private int id_cliente;
    private String nit;  
    private String correo;
    private String fingreso;
    private Conexion cn;
    public Cliente (){ }
    public Cliente(int id_cliente, String nit, String correo, String fingreso, int id, String nombres, String apellidos, String telefono, String genero) {
        super(id, nombres, apellidos, telefono, genero);
        this.id_cliente = id_cliente;
        this.nit = nit;
        this.correo = correo;
        this.fingreso = fingreso;
    }



    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFingreso() {
        return fingreso;
    }

    public void setFingreso(String fingreso) {
        this.fingreso = fingreso;
    }
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT e.id_cliente, e.nombres, e.apellidos, e.nit, e.genero, e.telefono, e.correo_electronico, e.fecha_ingreso\n" +"FROM clientes e;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado [] = {"id_cliente","nombres","apellidos","nit","genero","telefono","correo_electronico","fecha_ingreso",};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String [8];
            while (consulta.next()){
                datos[0] = consulta.getString("id_cliente");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("nit");
                datos[4] = consulta.getString("genero");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("fecha_ingreso");
                tabla.addRow(datos);
                
            }
            cn.cerrar_conexion();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return tabla;
    }
    @Override
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="INSERT INTO clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fecha_ingreso) VALUES (?,?,?,?,?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getNombres());
        parametro.setString(2, getApellidos());
        parametro.setString(3, getNit());
        parametro.setString(4, getGenero());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getCorreo());
        parametro.setString(7, getFingreso());
        
        retorno =parametro.executeUpdate();
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno =0;
    }
    return retorno;
    }
    @Override
    public int modificar() {
    int retorno = 0;
    try {
        PreparedStatement parametro;
        cn = new Conexion();
        String query = "UPDATE clientes SET nombres=?, apellidos=?, nit=?, genero=?, telefono=?, correo_electronico=?, fecha_ingreso=? WHERE id_cliente=?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
        parametro.setString(1, getNombres());
        parametro.setString(2, getApellidos());
        parametro.setString(3, getNit());
        parametro.setString(4, getGenero());
        parametro.setString(5, getTelefono());
        parametro.setString(6, getCorreo());
        parametro.setString(7, getFingreso());
        parametro.setInt(8, getId_cliente());
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        retorno = 0;
    }
    return retorno;
}
    public int eliminar (){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="delete from clientes where id_cliente = ?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, this.getId_cliente());
        
        retorno =parametro.executeUpdate();
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno =0;
    }
    return retorno;
    }
}

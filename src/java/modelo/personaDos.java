
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author felipe
 */
public class personaDos implements validar{

    Connection con;
    conexion cn=new conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r= 0;
    
    public int validar(persona per) {
        String sql="select * from persona where Nombre=? and Correo=?";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, per.getNom());
            ps.setString(2,per.getCorreo());
            rs=ps.executeQuery();
            
            while(rs.next()){
                r=r+1;
            per.setNom(rs.getString("Nombre"));
            per.setCorreo(rs.getString("Correo"));
            }
            if(r==1){
            return 1;
            }else{
            return 0;
            }
        } catch (Exception e){
        return 0;
        }
    }    
}

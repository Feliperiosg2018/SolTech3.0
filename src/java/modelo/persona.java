/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author felipe
 */
public class persona {
    int id;
    String nom;
    String correo;
    
    public persona(){
    }
    
     public persona(int id, String nom, String correo){
         this.id = id;
         this.nom = nom;
         this.correo = correo;
     }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getCorreo() {
        return correo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
     
     
}

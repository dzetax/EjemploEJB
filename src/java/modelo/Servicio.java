/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import javax.ejb.Singleton;

/**
 *
 * @author Informatica
 */
@Singleton
public class Servicio implements ServicioLocal {
    private ArrayList<Producto> lista=new ArrayList();
    
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public Servicio() {
        lista.add(new Producto("Bolso",20990));
        lista.add(new Producto("Cinturon",10990));
    }

    @Override
    public void addProducto(Producto P) {
        lista.add(P);
    }

    @Override
    public ArrayList<Producto> getProducto() {
        return lista;
    }
    
}

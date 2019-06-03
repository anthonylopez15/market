
package models;

import java.util.Date;
import java.util.List;

public class ListaCompra {

    private int codigo;
    private Usuario user;
    private Date datahora;
    private String supermercado_str;
    private List<ItemProduto> listProdutos;
    private Supermercado supermercado;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public Date getDatahora() {
        return datahora;
    }

    public void setDatahora(Date datahora) {
        this.datahora = datahora;
    }

    

    public List<ItemProduto> getListProdutos() {
        return listProdutos;
    }

    public void setListProdutos(List<ItemProduto> listProdutos) {
        this.listProdutos = listProdutos;
    }

    public String getSupermercado_str() {
        return supermercado_str;
    }

    public void setSupermercado_str(String supermercado_str) {
        this.supermercado_str = supermercado_str;
    }

    public Supermercado getSupermercado() {
        return supermercado;
    }

    public void setSupermercado(Supermercado supermercado) {
        this.supermercado = supermercado;
    }

    
    
}

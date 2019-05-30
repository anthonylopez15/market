
package models;

import java.util.Date;
import java.util.List;

public class ListaCompra {

    private int codigo;
    private Usuario user;
    private Date datahora;
    private String supermercado;
    private List<ItemProduto> listProdutos;

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

    public String getSupermercado() {
        return supermercado;
    }

    public void setSupermercado(String supermercado) {
        this.supermercado = supermercado;
    }

    public List<ItemProduto> getListProdutos() {
        return listProdutos;
    }

    public void setListProdutos(List<ItemProduto> listProdutos) {
        this.listProdutos = listProdutos;
    }

    
}

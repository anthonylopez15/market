
package models;

import java.util.Objects;

public class ItemProduto {

    private Produto produto;
//    private ListaCompra listaCompra;
    private int quantidade;
    private double preco;
    private Estoque estoque;
    
    public ItemProduto() {
    }
    
    public ItemProduto(Produto produto, int quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }
    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

//    public ListaCompra getListaCompra() {
//        return listaCompra;
//    }
//
//    public void setListaCompra(ListaCompra listaCompra) {
//        this.listaCompra = listaCompra;
//    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Estoque getEstoque() {
        return estoque;
    }

    public void setEstoque(Estoque estoque) {
        this.estoque = estoque;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 19 * hash + Objects.hashCode(this.produto);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ItemProduto other = (ItemProduto) obj;
        if (!Objects.equals(this.produto, other.produto)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ItemProduto{" + "produto=" + produto.getNome() + '}';
    }
    
    
    
}

package models;

public class Estoque {

    private Produto produto;
    private Supermercado supermercado;
    private double preco;
    private int produtoCod;
    private int supermercadoCod;

    public Estoque() {
    }

    public Estoque(Produto produto, Supermercado supermercado, double preco) {
        this.produto = produto;
        this.supermercado = supermercado;
        this.preco = preco;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Supermercado getSupermercado() {
        return supermercado;
    }

    public void setSupermercado(Supermercado supermercado) {
        this.supermercado = supermercado;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getProdutoCod() {
        return produtoCod;
    }

    public void setProdutoCod(int produtoCod) {
        this.produtoCod = produtoCod;
    }

    public int getSupermercadoCod() {
        return supermercadoCod;
    }

    public void setSupermercadoCod(int supermercadoCod) {
        this.supermercadoCod = supermercadoCod;
    }

    @Override
    public String toString() {
        return supermercado + " - " + produto + " - " + preco;
    }

}

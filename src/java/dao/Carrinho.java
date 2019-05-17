
package dao;

import java.util.ArrayList;
import java.util.List;
import models.ListaCompra;
import models.Produto;

public class Carrinho {
    


    private List<ListaCompra> items = new ArrayList<>();

    public Carrinho(ListaCompra item) {
        this.addItem(item);
    }

    public void addItem(ListaCompra item) {
        if (items.contains(item)) {
            int indice = items.indexOf(item);
            ListaCompra temp = (ListaCompra) items.get(indice);
            int quantidade = temp.getQuantidade();
            temp.setQuantidade(quantidade + 1);
        } else {
            this.items.add(item);
        }
    }

    public void removeItem(Produto item) {
        if (items.contains(item))
            items.remove(item);
    }

    public double calcularValorTotal() {
        double precoTotal = 0;
        for(ListaCompra itemAtual: items) {
            //precoTotal += itemAtual.getServicoCod().getPreco();
        }
        return precoTotal;
    }

    public List<ListaCompra> getItems() {
        return items;
    }
}

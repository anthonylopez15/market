
package dao;

import java.util.ArrayList;
import java.util.List;
import models.Produto;

public class Carrinho {
    


    private List<Produto> items = new ArrayList<>();

    public Carrinho(Produto item) {
        this.addItem(item);
    }

    public void addItem(Produto item) {
//        if (items.contains(item)) {
//            int indice = items.indexOf(item);
//            Lista_servicos temp = (Lista_servicos) items.get(indice);
//            //int quantidade = temp.getQuantidade();
//            //temp.setQuantidade(quantidade + 1);
//        } else {
            this.items.add(item);
//        }
    }

    public void removeItem(Produto item) {
        if (items.contains(item))
            items.remove(item);
    }

    public double calcularValorTotal() {
        double precoTotal = 0;
        for(Produto itemAtual: items) {
            //precoTotal += itemAtual.getServicoCod().getPreco();
        }
        return precoTotal;
    }

    public List<Produto> getItems() {
        return items;
    }
}

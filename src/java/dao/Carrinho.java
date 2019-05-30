package dao;

import java.util.ArrayList;
import java.util.List;
import models.ItemProduto;

public class Carrinho {

    private List<ItemProduto> items = new ArrayList<>();

    public Carrinho(ItemProduto item) {
        this.addItem(item);
    }

    public void addItem(ItemProduto item) {
        if (items.contains(item)) {
            int indice = items.indexOf(item);
            ItemProduto temp = (ItemProduto) items.get(indice);
            int quantidade = temp.getQuantidade();
            temp.setQuantidade(quantidade + 1);
        } else {
            this.items.add(item);
        }
    }

    public void removeItem(ItemProduto item) {
        if (items.contains(item)) {
            items.remove(item);
        }
    }

    public double calcularValorTotal() {
        double precoTotal = 0;
        for (ItemProduto itemAtual : items) {
            precoTotal += itemAtual.getPreco();
        }
        return precoTotal;
    }

    public List<ItemProduto> getItems() {
        return items;
    }
}

package models;

public class Produto {

    private Integer codigo;
    private String nome;
    private Marca marcacod;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Marca getMarcacod() {
        return marcacod;
    }

    public void setMarcacod(Marca marcacod) {
        this.marcacod = marcacod;
    }

    @Override
    public String toString() {
        return nome + " - " + marcacod.getNome();
    }

}

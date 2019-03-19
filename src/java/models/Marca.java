package models;

public class Marca {

    private Integer codigo;
    private String nome;

    public Marca(Integer codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
    }

    public Marca() {
    }

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

    @Override
    public String toString() {
        return nome;
    }

}

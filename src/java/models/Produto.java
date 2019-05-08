package models;

public class Produto {

    private Integer codigo;
    private String nome;
    private String descricao;
    private Marca marcacod;
    private String status;

    public Produto() {
    }

    public Produto(Integer codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
    }

    public Produto(Integer codigo, String nome, Marca marcacod) {
        this.codigo = codigo;
        this.nome = nome;
        this.marcacod = marcacod;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public Marca getMarcacod() {
        return marcacod;
    }

    public void setMarcacod(Marca marcacod) {
        this.marcacod = marcacod;
    }

    @Override
    public String toString() {
        return nome + " - " + marcacod;
    }

}

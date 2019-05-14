package models;

public class Supermercado {

    private Integer codigo;
    private String nome;
    private String status;
    private String enderecocod;
    private Endereco enderecoM;

    public Supermercado() {
    }

    public Supermercado(Integer codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
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

    public String getEnderecocod() {
        return enderecocod;
    }

    public void setEnderecocod(String enderecocod) {
        this.enderecocod = enderecocod;
    }

    public Endereco getEnderecoM() {
        return enderecoM;
    }

    public void setEnderecoM(Endereco enderecoM) {
        this.enderecoM = enderecoM;
    }
    
    @Override
    public String toString() {
        return nome;
    }

}

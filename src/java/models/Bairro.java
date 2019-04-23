
package models;

public class Bairro {
    
    private Integer codigo;
    private String nome;
    private String status;

    public Bairro(Integer codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
    }

    public Bairro() {
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}

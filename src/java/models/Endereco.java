package models;


public class Endereco {
    
    private int codigo;
    private String rua;
    private String cep;
    private String numero;
    private String bairrocod;
    private Bairro bairro;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairrocod() {
        return bairrocod;
    }

    public void setBairrocod(String bairrocod) {
        this.bairrocod = bairrocod;
    }

    public Bairro getBairro() {
        return bairro;
    }

    public void setBairro(Bairro bairro) {
        this.bairro = bairro;
    }

    @Override
    public String toString() {
        return rua + " - " + numero + " - " + bairrocod;
    }
    
    
    
    
}


package models;

public class Usuario {

    private Integer codigo;
    private String nome;
    private String login;
    private String senha;
    private Integer tipocod;
    private String tipoDesc;
    private String cpf;
    private String email;
    private String endereco;
    private String bairroNome;
    private String bairrocod;
    private String cep;
    
    
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

   

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Integer getTipocod() {
        return tipocod;
    }

    public void setTipocod(Integer tipocod) {
        this.tipocod = tipocod;
    }

    public String getTipoDesc() {
        return tipoDesc;
    }

    public void setTipoDesc(String tipoDesc) {
        this.tipoDesc = tipoDesc;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBairrocod() {
        return bairrocod;
    }

    public void setBairrocod(String bairrocod) {
        this.bairrocod = bairrocod;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getBairroNome() {
        return bairroNome;
    }

    public void setBairroNome(String bairroNome) {
        this.bairroNome = bairroNome;
    }

    
    @Override
    public String toString() {
        return nome;
    }
    
    
}

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
    private String telefone;
//    private String rua;
//    private String bairroNome;
//    private String bairrocod;
//    private String cep;
    private String rg;
    private String status;
//    private String numero;
    
    private String endereco;
    private Endereco e;

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    

    

   
    
    

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
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

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Endereco getE() {
        return e;
    }

    public void setE(Endereco e) {
        this.e = e;
    }
    
    
    
    @Override
    public String toString() {
        return nome;
    }

//    @Override
//    public String toString() {
//        return "Usuario{" + "codigo=" + codigo + ", nome=" + nome + ", login=" + login + ", senha=" + senha + ", tipocod=" + tipocod + ", tipoDesc=" + tipoDesc + ", cpf=" + cpf + ", email=" + email + ", telefone=" + telefone + ", rua=" + rua + ", bairroNome=" + bairroNome + ", bairrocod=" + bairrocod + ", cep=" + cep + ", rg=" + rg + ", status=" + status + ", numero=" + numero + ", endereco=" + endereco + ", e=" + e + '}';
//    }
    

}

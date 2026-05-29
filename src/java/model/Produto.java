package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/* Model representa a entidade Produto do mundo real
   Padrão OO.. todos os atributos são PRIVADOS que seria o encapsulamento
   Acesso apenas via getters e setters */
public class Produto {

    private int id;                      /* gerado automaticamente pelo banco */
    private String nome;
    private String descricao;
    private String categoria;
    private String marca;
    private String codigoBarras;
    private double precoCompra;
    private double precoVenda;
    private String fornecedor;
    private int quantidadeEstoque;
    private int quantidadeMinimo;        /* alerta quando estoque estiver baixo */
    private LocalDate dataValidade;
    private double peso;
    private LocalDateTime dataCadastro;  /* registrado automaticamente pelo banco */

    /* Getters e Setters único ponto de acesso aos atributos privados */

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public LocalDateTime getDataCadastro() { return dataCadastro; }
    public void setDataCadastro(LocalDateTime dataCadastro) { this.dataCadastro = dataCadastro; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getCodigoBarras() { return codigoBarras; }
    public void setCodigoBarras(String codigoBarras) { this.codigoBarras = codigoBarras; }

    public double getPrecoCompra() { return precoCompra; }
    public void setPrecoCompra(double precoCompra) { this.precoCompra = precoCompra; }

    public double getPrecoVenda() { return precoVenda; }
    public void setPrecoVenda(double precoVenda) { this.precoVenda = precoVenda; }

    public String getFornecedor() { return fornecedor; }
    public void setFornecedor(String fornecedor) { this.fornecedor = fornecedor; }

    public int getQuantidadeEstoque() { return quantidadeEstoque; }
    public void setQuantidadeEstoque(int quantidadeEstoque) { this.quantidadeEstoque = quantidadeEstoque; }

    public int getQuantidadeMinimo() { return quantidadeMinimo; }
    public void setQuantidadeMinimo(int quantidadeMinimo) { this.quantidadeMinimo = quantidadeMinimo; }

    public LocalDate getDataValidade() { return dataValidade; }
    public void setDataValidade(LocalDate dataValidade) { this.dataValidade = dataValidade; }

    public double getPeso() { return peso; }
    public void setPeso(double peso) { this.peso = peso; }
}

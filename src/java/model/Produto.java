package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author SABRINA
 */
public class Produto {
    private int id;
    private LocalDateTime data_cadastro;
    private String nome;
    private String descricao;
    private String categoria;
    private String marca;
    private String codigo_barras;
    private double preco_compra;
    private double preco_venda;
    private String fornecedor;
    private int quantidade_estoque;
    private int quantidade_minimo;
    private LocalDate data_validade;
    private double peso;
    
    public int getId(){
        return id;
    }
    public LocalDateTime getDataCadastro(){
        return data_cadastro;
    }
    
    public String getNome(){
        return nome;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public String getDescricao(){
        return descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
    public String getCategoria(){
        return categoria;
    }
    public void setCategoria(String categoria){
        this.categoria = categoria;
    }
    
    public String getMarca(){
        return marca;
    }
    public void setMarca(String marca){
        this.marca = marca;
    }
  public String getCodigoBarras(){                                                                      
      return codigo_barras;
  }
  public void setCodigoBarras(String codigo_barras){
      this.codigo_barras = codigo_barras;
  }
    public void setPrecoCompra(double preco_compra){
        this.preco_compra = preco_compra;
    }
    public double getPrecoCompra(){
        return preco_compra;
    }
    public void setPrecoVenda(double preco_venda){
        this.preco_venda = preco_venda;
    }
    public double getPrecoVenda(){
        return preco_venda;
    }
    public void setFornecedor(String fornecedor){
        this.fornecedor = fornecedor;
    }
    public String getFornecedor(){
        return fornecedor;
    }
    public void setQuantidadeEstoque(int quantidade_estoque){
        this.quantidade_estoque = quantidade_estoque;
    }
    public int getQuantidadeEstoque(){
        return quantidade_estoque;
    }
    public void setQuantidadeMinimo(int quantidade_minimo){
        this.quantidade_minimo = quantidade_minimo;
    }
    public int getQuantidadeMinimo(){
        return quantidade_minimo;
    }

    public void setDataValidade(LocalDate data_validade){
        this.data_validade = data_validade;
    }
    public LocalDate getDataValidade(){
        return data_validade;
    }
    public void setPeso(double peso){
        this.peso = peso;
    }
    public double getPeso(){
        return peso;
    }
}

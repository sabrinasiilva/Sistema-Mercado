package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Produto;
import util.Conexao;

/* DAO responsável exclusivamente pela comunicação com o banco
   o controller nunca acessa o banco diretamente sempre passa pelo DAO */
public class ProdutoDAO {

    public ProdutoDAO() {
    }

    /* INSERT cadastra um novo produto no banco
       O ID não é inserido pois é gerado automaticamente pelo banco  */


    public void cadastrar(Produto p) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();


        /* PreparedStatement com parâmetros "?" proteção contra SQL Injection */
        PreparedStatement comando = con.prepareStatement(
            "insert into produtos (nome, descricao, categoria, marca, codigo_barras, " +
            "preco_compra, preco_venda, fornecedor, quantidade_estoque, " +
            "quantidade_minimo, data_validade, peso) values (?,?,?,?,?,?,?,?,?,?,?,?)"
        );

        
        /* Cada "?" recebe o valor correspondente do objeto Produto */
        comando.setString(1, p.getNome());
        comando.setString(2, p.getDescricao());
        comando.setString(3, p.getCategoria());
        comando.setString(4, p.getMarca());
        comando.setString(5, p.getCodigoBarras());
        comando.setDouble(6, p.getPrecoCompra());
        comando.setDouble(7, p.getPrecoVenda());
        comando.setString(8, p.getFornecedor());
        comando.setInt(9, p.getQuantidadeEstoque());
        comando.setInt(10, p.getQuantidadeMinimo());
        /* converte LocalDate para java.sql.Date para salvar no banco */
        comando.setDate(11, java.sql.Date.valueOf(p.getDataValidade()));
        comando.setDouble(12, p.getPeso());
        comando.execute();
        con.close(); /* sempre fechar a conexão após uso */
    }

    /* DELETE remove o produto pelo ID */
    public void deletar(Produto p) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement(
            "delete from produtos where id = ?"
        );
        comando.setInt(1, p.getId());
        comando.execute();
        con.close();
    }

    /* UPDATE atualiza todos os campos do produto pelo ID
       data_cadastro não é atualizada — foi registrada quando o produto foi criado */
    public void atualizar(Produto p) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement(
            "update produtos set nome=?, descricao=?, categoria=?, marca=?, " +
            "codigo_barras=?, preco_venda=?, preco_compra=?, fornecedor=?, " +
            "quantidade_estoque=?, quantidade_minimo=?, data_validade=?, peso=? " +
            "where id=?"
        );
        comando.setString(1, p.getNome());
        comando.setString(2, p.getDescricao());
        comando.setString(3, p.getCategoria());
        comando.setString(4, p.getMarca());
        comando.setString(5, p.getCodigoBarras());
        comando.setDouble(6, p.getPrecoVenda());
        comando.setDouble(7, p.getPrecoCompra());
        comando.setString(8, p.getFornecedor());
        comando.setInt(9, p.getQuantidadeEstoque());
        comando.setInt(10, p.getQuantidadeMinimo());
        comando.setDate(11, java.sql.Date.valueOf(p.getDataValidade()));
        comando.setDouble(12, p.getPeso());
        /* ID vai no WHERE identifica qual produto atualizar */
        comando.setInt(13, p.getId());
        comando.execute();
        con.close();
    }

    /* SELECT por ID retorna um único produto
       usa resultSet para ler o resultado da query */
    public Produto consultarById(Produto p) throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement(
            "select * from produtos where id = ?"
        );
        comando.setInt(1, p.getId());
        ResultSet rs = comando.executeQuery(); /* executeQuery para SELECT */
        Produto prod = new Produto();
        if (rs.next()) { /* se encontrou o produto */
            prod.setId(rs.getInt("id"));
            prod.setNome(rs.getString("nome"));
            prod.setDescricao(rs.getString("descricao"));
            prod.setCategoria(rs.getString("categoria"));
            prod.setMarca(rs.getString("marca"));
            prod.setCodigoBarras(rs.getString("codigo_barras"));
            prod.setPrecoCompra(rs.getDouble("preco_compra"));
            prod.setPrecoVenda(rs.getDouble("preco_venda"));
            prod.setFornecedor(rs.getString("fornecedor"));
            prod.setQuantidadeEstoque(rs.getInt("quantidade_estoque"));
            prod.setQuantidadeMinimo(rs.getInt("quantidade_minimo"));
            prod.setDataValidade(rs.getDate("data_validade").toLocalDate());
            prod.setPeso(rs.getDouble("peso"));
            if (rs.getTimestamp("data_cadastro") != null)
                prod.setDataCadastro(rs.getTimestamp("data_cadastro").toLocalDateTime());
        }
        return prod;
    }

    /* SELECT todos retorna uma lista com todos os produtos do banco */
    public List<Produto> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = Conexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from produtos");
        ResultSet rs = comando.executeQuery();
        List<Produto> lprod = new ArrayList<>(); /* lista que vai acumular os produtos */
        while (rs.next()) { /* percorre cada linha do resultado */
            Produto prod = new Produto();
            prod.setId(rs.getInt("id"));
            prod.setNome(rs.getString("nome"));
            prod.setDescricao(rs.getString("descricao"));
            prod.setCategoria(rs.getString("categoria"));
            prod.setMarca(rs.getString("marca"));
            prod.setCodigoBarras(rs.getString("codigo_barras"));
            prod.setPrecoCompra(rs.getDouble("preco_compra"));
            prod.setPrecoVenda(rs.getDouble("preco_venda"));
            prod.setFornecedor(rs.getString("fornecedor"));
            prod.setQuantidadeEstoque(rs.getInt("quantidade_estoque"));
            prod.setQuantidadeMinimo(rs.getInt("quantidade_minimo"));
            java.sql.Date dv = rs.getDate("data_validade");
            if (dv != null) prod.setDataValidade(dv.toLocalDate());
            prod.setPeso(rs.getDouble("peso"));
            
            /* data_cadastro é gerado automaticamente pelo banco (DEFAULT CURRENT_TIMESTAMP)
            usamos Timestamp para ler do ResultSet e convertemos para LocalDateTime do Java */
            
            if (rs.getTimestamp("data_cadastro") != null)
                prod.setDataCadastro(rs.getTimestamp("data_cadastro").toLocalDateTime());
            lprod.add(prod); /* adiciona o produto na lista */
        }
        return lprod;
    }
}

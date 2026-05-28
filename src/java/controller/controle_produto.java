package controller;

import DAO.ProdutoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

/* Servlet mapeado para a URL /controle_produto — é o Controller do padrão MVC */
@WebServlet(name = "controle_produto", urlPatterns = {"/controle_produto"})
public class controle_produto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        /* Lê qual botão foi clicado no formulário HTML (CADASTRAR, DELETAR, etc.) */
        String op = request.getParameter("op");

        /* Instancia o DAO (acesso ao banco) e o Model (objeto Produto) */
        ProdutoDAO pdao = new ProdutoDAO();
        Produto p = new Produto();

        try {

            if (op.equals("CADASTRAR")) {
                /* Preenche o objeto Produto com os dados do formulário */
                preencherProduto(request, p);
                /* Manda o DAO salvar no banco */
                pdao.cadastrar(p);
                request.setAttribute("message", "Cadastrar");
                /* Redireciona para a tela de sucesso */
                request.getRequestDispatcher("resultado.jsp").forward(request, response);

            } else if (op.equals("DELETAR")) {
                /* Converte o ID digitado (String) para inteiro e seta no objeto */
                p.setId(Integer.parseInt(request.getParameter("txtid")));
                /* Manda o DAO deletar no banco */
                pdao.deletar(p);
                /* Após deletar, busca todos os produtos para exibir a lista atualizada */
                List<Produto> lprod = pdao.consultarTodos();
                request.setAttribute("lprod", lprod);
                request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);

            } else if (op.equals("CONSULTAR BY ID")) {
                /* Seta o ID informado no objeto Produto */
                p.setId(Integer.parseInt(request.getParameter("txtid")));
                /* Busca o produto pelo ID no banco */
                p = pdao.consultarById(p);
                /* Passa o produto encontrado para a View */
                request.setAttribute("p", p);
                request.getRequestDispatcher("resultadocosultarbyid.jsp").forward(request, response);

            } else if (op.equals("CONSULTAR TODOS")) {
                /* Busca todos os produtos do banco — retorna uma List<Produto> */
                List<Produto> lprod = pdao.consultarTodos();
                /* Passa a lista para a View */
                request.setAttribute("lprod", lprod);
                request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);

            } else if (op.equals("ATUALIZAR")) {
                /* Etapa 1: busca os dados atuais do produto para preencher o formulário de edição */
                p.setId(Integer.parseInt(request.getParameter("txtid")));
                p = pdao.consultarById(p);
                request.setAttribute("p", p);
                /* Redireciona para o formulário de edição já preenchido */
                request.getRequestDispatcher("resultadocosultaratualizar.jsp").forward(request, response);

            } else if (op.equals("EFETIVAR ATUALIZAÇÃO")) {
                /* Etapa 2: recebe os dados editados e salva no banco */
                p.setId(Integer.parseInt(request.getParameter("txtid")));
                preencherProduto(request, p);
                pdao.atualizar(p);
                request.setAttribute("message", "Atualizar");
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            /* Se qualquer operação no banco falhar, redireciona para a tela de erro */
            System.out.println("Erro: " + ex.getMessage());
            request.setAttribute("message", op);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }
    }

    /* Método auxiliar privado — evita repetição de código no CADASTRAR e EFETIVAR ATUALIZAÇÃO
       Pega os valores digitados no formulário e popula o objeto Produto */
    private void preencherProduto(HttpServletRequest request, Produto p) {
        p.setNome(request.getParameter("txtnome"));
        p.setDescricao(request.getParameter("txtdescricao"));
        p.setCategoria(request.getParameter("txtcategoria"));
        p.setMarca(request.getParameter("txtmarca"));
        p.setCodigoBarras(request.getParameter("txtcodigobarras"));
        /* Converte String para double — necessário pois getParameter() sempre retorna String */
        p.setPrecoCompra(Double.parseDouble(request.getParameter("txtprecocompra")));
        p.setPrecoVenda(Double.parseDouble(request.getParameter("txtprecovenda")));
        p.setFornecedor(request.getParameter("txtfornecedor"));
        /* Converte String para int */
        p.setQuantidadeEstoque(Integer.parseInt(request.getParameter("txtquantidadeestoque")));
        p.setQuantidadeMinimo(Integer.parseInt(request.getParameter("txtquantidademinimo")));
        /* Converte String para LocalDate (formato: yyyy-MM-dd) */
        p.setDataValidade(LocalDate.parse(request.getParameter("txtdatavalidade")));
        p.setPeso(Double.parseDouble(request.getParameter("txtpeso")));
    }

    /* Requisições GET (clique nos botões do formulário) chegam aqui */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /* Requisições POST chegam aqui — ambos redirecionam para processRequest */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

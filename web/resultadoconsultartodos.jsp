<%@page import="java.util.List"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todos os Produtos</title>
        <style>
            * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
            body { background: linear-gradient(160deg, #ffffff 0%, #ffcccc 50%, #c62828 100%); min-height: 100vh; }
            header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 20px 36px; display: flex; align-items: center; gap: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.5); }
            header span { font-size: 40px; }
            header h1 { font-size: 22px; font-weight: bold; letter-spacing: 2px; text-transform: uppercase; }
            header p { font-size: 12px; opacity: 0.7; }
            .container { max-width: 800px; margin: 36px auto; background: #f5e6e6; border-radius: 14px; box-shadow: 0 8px 32px rgba(0,0,0,0.2); overflow: hidden; border: 1px solid #f5c6c6; }
            .container-header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 16px 24px; display: flex; justify-content: space-between; align-items: center; }
            .container-header h2 { font-size: 16px; font-weight: bold; letter-spacing: 0.5px; }
            .container-header a { background: white; color: #c62828; padding: 6px 16px; border-radius: 6px; text-decoration: none; font-size: 13px; font-weight: bold; }
            table { width: 100%; border-collapse: collapse; }
            th { background-color: #c62828; color: white; padding: 12px 16px; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px; }
            td { padding: 11px 16px; font-size: 14px; color: #333; border-bottom: 1px solid #f5c6c6; }
            tr:nth-child(even) td { background-color: #fdf2f2; }
            tr:hover td { background-color: #fce8e8; }
            .btn-acao { padding: 5px 12px; border: none; border-radius: 4px; font-size: 12px; font-weight: bold; cursor: pointer; text-decoration: none; }
            .btn-del { background-color: #ef9a9a; color: #7f0000; }
            .btn-edit { background: linear-gradient(90deg, #7f0000, #c62828); color: white; }
            footer { text-align: center; padding: 20px; font-size: 12px; color: #000; font-weight: bold; }
        </style>
    </head>
    <body>
        <header>
            <span>🏪</span>
            <div>
                <h1>Supermercado</h1>
                <p>Sistema de Gerenciamento de Produtos</p>
            </div>
        </header>
        <%
            List<Produto> lprod = (List<Produto>) request.getAttribute("lprod");
        %>
        <div class="container">
            <div class="container-header">
                <h2>📦 Todos os Produtos</h2>
                <a href="index.html">+ Novo Produto</a>
            </div>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Categoria</th>
                    <th>Preço Venda</th>
                    <th>Estoque</th>
                    <th>Remover</th>
                    <th>Editar</th>
                </tr>
                <%for (Produto p : lprod) {%>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getNome()%></td>
                    <td><%=p.getDescricao()%></td>
                    <td><%=p.getCategoria()%></td>
                    <td>R$ <%=p.getPrecoVenda()%></td>
                    <td><%=p.getQuantidadeEstoque()%></td>
                    <td><a class="btn-acao btn-del" href="controle_produto?op=DELETAR&txtid=<%=p.getId()%>">Deletar</a></td>
                    <td><a class="btn-acao btn-edit" href="controle_produto?txtid=<%=p.getId()%>&op=ATUALIZAR">Editar</a></td>
                </tr>
                <%}%>
            </table>
        </div>
        <footer>CRUD SISTEMA GERENCIADOR DE PRODUTOS &copy; 2025</footer>
    </body>
</html>

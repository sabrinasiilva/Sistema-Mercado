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
            .container { max-width: 1100px; margin: 36px auto; background: #f5e6e6; border-radius: 14px; box-shadow: 0 8px 32px rgba(0,0,0,0.2); overflow: hidden; border: 1px solid #f5c6c6; }
            .container-header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 16px 24px; display: flex; justify-content: space-between; align-items: center; }
            .container-header h2 { font-size: 16px; font-weight: bold; letter-spacing: 0.5px; }
            .container-header a { background: white; color: #c62828; padding: 6px 16px; border-radius: 6px; text-decoration: none; font-size: 13px; font-weight: bold; }
            .table-wrapper { overflow-x: auto; max-height: 70vh; overflow-y: auto; }
            table { width: 100%; border-collapse: collapse; min-width: 900px; }
            thead th { background-color: #7f0000; color: white; padding: 12px 14px; font-size: 12px; text-transform: uppercase; letter-spacing: 0.5px; position: sticky; top: 0; white-space: nowrap; }
            th:nth-child(1) { width: 50px; }
            th:nth-child(2) { width: 150px; }
            th:nth-child(3) { width: 200px; }
            th:nth-child(4) { width: 110px; }
            th:nth-child(5) { width: 120px; }
            th:nth-child(6) { width: 80px; }
            th:nth-child(7), th:nth-child(8) { width: 80px; }
            td { padding: 10px 14px; font-size: 13px; color: #333; border-bottom: 1px solid #f5c6c6; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px; }
            tbody tr:nth-child(even) td { background-color: #fdf2f2; }
            tbody tr:nth-child(odd) td { background-color: #ffffff; }
            tbody tr:hover td { background-color: #fce8e8; transition: background 0.15s; }
            .btn-acao { padding: 4px 10px; border: none; border-radius: 4px; font-size: 11px; font-weight: bold; cursor: pointer; text-decoration: none; display: inline-block; }
            .btn-del { background-color: #ef9a9a; color: #7f0000; }
            .btn-del:hover { background-color: #e57373; }
            .btn-edit { background: linear-gradient(90deg, #7f0000, #c62828); color: white; }
            .btn-edit:hover { opacity: 0.85; }
            footer { text-align: center; padding: 20px; font-size: 12px; color: #000; font-weight: bold; }
            .btn-home { position: fixed; bottom: 28px; right: 28px; background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 12px 20px; border-radius: 50px; text-decoration: none; font-weight: bold; font-size: 13px; box-shadow: 0 4px 12px rgba(0,0,0,0.3); transition: opacity 0.2s; }
            .btn-home:hover { opacity: 0.85; }
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
            <div class="table-wrapper">
                <table>
                    <thead>
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
                    </thead>
                    <tbody>
                        <%for (Produto p : lprod) {%>
                        <tr>
                            <td><%out.print(p.getId());%></td>
                            <td><%out.print(p.getNome());%></td>
                            <td><%out.print(p.getDescricao());%></td>
                            <td><%out.print(p.getCategoria());%></td>
                            <td>R$ <%out.print(p.getPrecoVenda());%></td>
                            <td><%out.print(p.getQuantidadeEstoque());%></td>
                            <td><a class="btn-acao btn-del" href="controle_produto?op=DELETAR&txtid=<%out.print(p.getId());%>">❌ Deletar</a></td>
                            <td><a class="btn-acao btn-edit" href="controle_produto?txtid=<%out.print(p.getId());%>&op=ATUALIZAR">Editar</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <footer>Sistema de Mercado — Andy & Sabrina &copy; 2026</footer>
        <a class="btn-home" href="index.html">🏠 Home</a>
    </body>
</html>

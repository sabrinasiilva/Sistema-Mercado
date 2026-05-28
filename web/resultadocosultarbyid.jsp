<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar por ID</title>
        <style>
            * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
            body { background: linear-gradient(160deg, #ffffff 0%, #ffcccc 50%, #c62828 100%); min-height: 100vh; }
            header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 20px 36px; display: flex; align-items: center; gap: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.5); }
            header span { font-size: 40px; }
            header h1 { font-size: 22px; font-weight: bold; letter-spacing: 2px; text-transform: uppercase; }
            header p { font-size: 12px; opacity: 0.7; }
            .container { max-width: 540px; margin: 36px auto; background: #f5e6e6; border-radius: 14px; box-shadow: 0 8px 32px rgba(0,0,0,0.2); overflow: hidden; border: 1px solid #f5c6c6; }
            .container-header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 16px 24px; }
            .container-header h2 { font-size: 16px; font-weight: bold; }
            .info { padding: 24px; }
            .linha { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #f5c6c6; font-size: 14px; }
            .linha span:first-child { font-weight: bold; color: #c62828; text-transform: uppercase; font-size: 12px; letter-spacing: 0.5px; }
            .linha span:last-child { color: #333; }
            .nao-encontrado { padding: 40px; text-align: center; color: #c62828; font-size: 18px; }
            .btn-voltar { display: block; margin: 24px; text-align: center; background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 10px; border-radius: 6px; text-decoration: none; font-weight: bold; font-size: 13px; }
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
            Produto p = (Produto) request.getAttribute("p");
        %>
        <div class="container">
            <div class="container-header">
                <h2>🔍 Resultado da Consulta</h2>
            </div>
            <%if (p.getNome() != null) {%>
            <div class="info">
                <div class="linha"><span>ID</span><span><%=p.getId()%></span></div>
                <div class="linha"><span>Nome</span><span><%=p.getNome()%></span></div>
                <div class="linha"><span>Descrição</span><span><%=p.getDescricao()%></span></div>
                <div class="linha"><span>Categoria</span><span><%=p.getCategoria()%></span></div>
                <div class="linha"><span>Marca</span><span><%=p.getMarca()%></span></div>
                <div class="linha"><span>Preço Compra</span><span>R$ <%=p.getPrecoCompra()%></span></div>
                <div class="linha"><span>Preço Venda</span><span>R$ <%=p.getPrecoVenda()%></span></div>
                <div class="linha"><span>Estoque</span><span><%=p.getQuantidadeEstoque()%> un</span></div>
                <div class="linha"><span>Estoque Mínimo</span><span><%=p.getQuantidadeMinimo()%> un</span></div>
                <div class="linha"><span>Fornecedor</span><span><%=p.getFornecedor()%></span></div>
                <div class="linha"><span>Validade</span><span><%=p.getDataValidade()%></span></div>
                <div class="linha"><span>Peso</span><span><%=p.getPeso()%> kg</span></div>
            </div>
            <%} else {%>
            <div class="nao-encontrado">Produto não encontrado.</div>
            <%}%>
            <a class="btn-voltar" href="index.html">Voltar ao início</a>
        </div>
        <footer>CRUD SISTEMA GERENCIADOR DE PRODUTOS &copy; 2025</footer>
    </body>
</html>

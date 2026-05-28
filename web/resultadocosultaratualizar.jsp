<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Produto</title>
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
            form { padding: 24px; }
            .campo { margin-bottom: 16px; }
            .campo label { display: block; font-size: 12px; font-weight: bold; color: #c62828; margin-bottom: 6px; text-transform: uppercase; letter-spacing: 1px; }
            .campo input { width: 100%; padding: 10px 14px; border: 1px solid #e0b0b0; border-radius: 6px; font-size: 14px; color: #333; background-color: #fdf2f2; }
            .campo input:focus { outline: none; border-color: #c62828; box-shadow: 0 0 0 3px rgba(198,40,40,0.15); }
            .id-display { font-size: 14px; color: #333; padding: 10px 0; font-weight: bold; }
            .divider { border: none; border-top: 1px solid #f5c6c6; margin: 20px 0; }
            .btn-salvar { width: 100%; padding: 12px; background: linear-gradient(90deg, #7f0000, #c62828); color: white; border: none; border-radius: 6px; font-size: 14px; font-weight: bold; cursor: pointer; letter-spacing: 1px; }
            .btn-salvar:hover { opacity: 0.88; }
            .nao-encontrado { padding: 40px; text-align: center; color: #c62828; font-size: 18px; }
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
                <h2>✏️ Atualizar Produto</h2>
            </div>
            <%if (p.getNome() != null) {%>
            <form name="f1" action="controle_produto" method="GET">
                <input type="hidden" name="txtid" value="<%=p.getId()%>">
                <div class="campo">
                    <label>ID</label>
                    <div class="id-display">#<%=p.getId()%></div>
                </div>
                <div class="campo">
                    <label>Nome</label>
                    <input type="text" name="txtnome" value="<%=p.getNome()%>">
                </div>
                <div class="campo">
                    <label>Descrição</label>
                    <input type="text" name="txtdescricao" value="<%=p.getDescricao()%>">
                </div>
                <div class="campo">
                    <label>Categoria</label>
                    <input type="text" name="txtcategoria" value="<%=p.getCategoria()%>">
                </div>
                <div class="campo">
                    <label>Marca</label>
                    <input type="text" name="txtmarca" value="<%=p.getMarca()%>">
                </div>
                <div class="campo">
                    <label>Código de Barras</label>
                    <input type="text" name="txtcodigobarras" value="<%=p.getCodigoBarras()%>">
                </div>
                <div class="campo">
                    <label>Preço Compra (R$)</label>
                    <input type="text" name="txtprecocompra" value="<%=p.getPrecoCompra()%>">
                </div>
                <div class="campo">
                    <label>Preço Venda (R$)</label>
                    <input type="text" name="txtprecovenda" value="<%=p.getPrecoVenda()%>">
                </div>
                <div class="campo">
                    <label>Fornecedor</label>
                    <input type="text" name="txtfornecedor" value="<%=p.getFornecedor()%>">
                </div>
                <div class="campo">
                    <label>Quantidade em Estoque</label>
                    <input type="text" name="txtquantidadeestoque" value="<%=p.getQuantidadeEstoque()%>">
                </div>
                <div class="campo">
                    <label>Quantidade Mínima</label>
                    <input type="text" name="txtquantidademinimo" value="<%=p.getQuantidadeMinimo()%>">
                </div>
                <div class="campo">
                    <label>Data de Validade</label>
                    <input type="text" name="txtdatavalidade" value="<%=p.getDataValidade()%>">
                </div>
                <div class="campo">
                    <label>Peso (kg)</label>
                    <input type="text" name="txtpeso" value="<%=p.getPeso()%>">
                </div>
                <hr class="divider">
                <input class="btn-salvar" type="submit" name="op" value="EFETIVAR ATUALIZAÇÃO">
            </form>
            <%} else {%>
            <div class="nao-encontrado">Produto não encontrado.</div>
            <%}%>
        </div>
        <footer>CRUD SISTEMA GERENCIADOR DE PRODUTOS &copy; 2025</footer>
    </body>
</html>

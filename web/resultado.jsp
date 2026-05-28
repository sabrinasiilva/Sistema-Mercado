<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
        <style>
            * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
            body { background: linear-gradient(160deg, #ffffff 0%, #ffcccc 50%, #c62828 100%); min-height: 100vh; }
            header { background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 20px 36px; display: flex; align-items: center; gap: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.5); }
            header span { font-size: 40px; }
            header h1 { font-size: 22px; font-weight: bold; letter-spacing: 2px; text-transform: uppercase; }
            header p { font-size: 12px; opacity: 0.7; }
            .container { max-width: 540px; margin: 60px auto; background: #fdf5f5; border-radius: 14px; box-shadow: 0 8px 32px rgba(0,0,0,0.2); padding: 40px; text-align: center; border: 1px solid #f5c6c6; }
            .icone { font-size: 60px; margin-bottom: 16px; }
            h2 { color: #2e7d32; font-size: 22px; margin-bottom: 10px; }
            p { color: #555; font-size: 14px; margin-bottom: 24px; }
            a { display: inline-block; background: linear-gradient(90deg, #7f0000, #c62828); color: white; padding: 10px 24px; border-radius: 6px; text-decoration: none; font-weight: bold; font-size: 13px; }
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
            String msg = (String) request.getAttribute("message");
        %>
        <div class="container">
            <div class="icone">✅</div>
            <h2>Operação realizada com sucesso!</h2>
            <p><strong><%=msg%></strong> concluído.</p>
            <a href="index.html">Voltar ao início</a>
        </div>
        <footer>CRUD SISTEMA GERENCIADOR DE PRODUTOS &copy; 2025</footer>
    </body>
</html>

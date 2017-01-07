--Procedure inserir funcionário
CREATE OR REPLACE PROCEDURE inserirFuncionario
( p_nome IN tb_funcionarios.nome_funcionario%TYPE, 
  p_cpf IN tb_funcionarios.cpf_funcionario%TYPE, 
  p_rg IN tb_funcionarios.rg_funcionario%TYPE, 
  p_fone IN tb_funcionarios.telefone_funcionario%TYPE, 
  p_email IN tb_funcionarios.email_funcionario%TYPE, 
  p_senha IN tb_funcionarios.senha%TYPE) 
  AS
BEGIN
	  INSERT INTO tb_funcionarios (nome_funcionario, cpf_funcionario, rg_funcionario, telefone_funcionario, email_funcionario, senha) 
    VALUES (p_nome, p_cpf, p_rg, p_fone, p_email, p_senha);
    
    COMMIT;
END inserirFuncionario;

--EXECUTE inserirFuncionario('Ana','111123','112113','11213','email@yahoo',21);
--SELECT * FROM tb_funcionarios;



--Delete funcionário
CREATE OR REPLACE PROCEDURE excluirFuncionario(p_codfunc IN tb_funcionarios.codigo_funcionario%TYPE)
AS
BEGIN
	DELETE tb_funcionarios WHERE codigo_funcionario = p_codfunc;
  COMMIT;
END excluirFuncionario;

EXECUTE excluirFuncionario (7);


--Consulta funcionário
CREATE OR REPLACE PROCEDURE consultarFuncionarioCodigo (p_codfunc IN tb_funcionarios.codigo_funcionario%TYPE)
    IS
    CURSOR C1 IS 
    
    	SELECT codigo_funcionario, nome_funcionario, cpf_funcionario, rg_funcionario, telefone_funcionario, email_funcionario 
      FROM tb_funcionarios 
      WHERE codigo_funcionario = p_codfunc;

  BEGIN
  FOR x IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE(x.nome_funcionario || x.cpf_funcionario ||x.rg_funcionario || x.telefone_funcionario || x.email_funcionario );
  END LOOP;
  END consultarFuncionarioCodigo;
    
    SET serveroutput ON;
    EXECUTE consultarFuncionarioCodigo(2);


--Consuta funcionário por nome
CREATE OR REPLACE PROCEDURE consultarFuncionarioNome(p_nomefunc IN tb_funcionarios.nome_funcionario%TYPE)
    IS
    CURSOR C1 IS
    
	SELECT codigo_funcionario, nome_funcionario, cpf_funcionario, rg_funcionario, telefone_funcionario, email_funcionario 
  FROM tb_funcionarios 
  WHERE nome_funcionario LIKE p_nomefunc;
  
  BEGIN
  FOR x IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE(x.nome_funcionario || x.cpf_funcionario ||x.rg_funcionario || x.telefone_funcionario || x.email_funcionario );
  END LOOP;
  
END consultarFuncionarioNome;

SET serveroutput ON;
EXECUTE consultarFuncionarioNome('juliana');


--Consulta tabela funcionário
CREATE OR REPLACE PROCEDURE consultarFuncionarioTabela 
IS
CURSOR C1 IS

	SELECT nome_funcionario, cpf_funcionario, email_funcionario 
  FROM tb_funcionarios;
  
  BEGIN
  FOR x IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE(x.nome_funcionario || x.cpf_funcionario || x.email_funcionario );
  END LOOP;
  
END consultarFuncionarioTabela;

EXECUTE consultarFuncionarioTabela;


--Update funcionário
CREATE OR REPLACE PROCEDURE updateFuncionario
(p_codigo IN TB_FUNCIONARIOS.CODIGO_FUNCIONARIO%TYPE , 
 p_nome IN TB_FUNCIONARIOS.NOME_FUNCIONARIO%TYPE, 
 p_cpf IN TB_FUNCIONARIOS.CPF_FUNCIONARIO%TYPE, 
 p_rg IN TB_FUNCIONARIOS.RG_FUNCIONARIO%TYPE, 
 p_fone IN TB_FUNCIONARIOS.TELEFONE_FUNCIONARIO%TYPE, 
 p_email IN TB_FUNCIONARIOS.EMAIL_FUNCIONARIO%TYPE, 
 p_senha IN TB_FUNCIONARIOS.SENHA%TYPE)
 AS
 BEGIN
	  UPDATE tb_funcionarios
    SET nome_funcionario = p_nome, 
        cpf_funcionario = p_cpf , 
        rg_funcionario = p_rg, 
        telefone_funcionario = p_fone, 
        email_funcionario = p_email, 
        senha = p_senha
    WHERE codigo_funcionario = p_codigo;
    COMMIT;
END updateFuncionario;

EXECUTE updateFuncionario (2, 'marcia', '999999999-10', '99999999-1', '6666-6668', 'marcia@gmail.com', '123456');
--SELECT * FROM TB_FUNCIONARIOS;


--Consulta login do funcionário
CREATE OR REPLACE PROCEDURE consultarFuncionarioLogin 
(p_cpf IN TB_FUNCIONARIOS.CPF_FUNCIONARIO%type, 
 p_senha IN TB_FUNCIONARIOS.SENHA%TYPE)
IS
CURSOR C1 IS
	SELECT codigo_funcionario, nome_funcionario, cpf_funcionario, email_funcionario 
  FROM tb_funcionarios 
  WHERE cpf_funcionario = p_cpf AND senha = p_senha;
  
  BEGIN
  FOR x IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE(x.codigo_funcionario || x.nome_funcionario || x.cpf_funcionario || x.email_funcionario );
  END LOOP;

END consultarFuncionarioLogin;

EXECUTE consultarFuncionarioLogin ('999999999-10', 123456);
--SELECT * FROM TB_FUNCIONARIOS;


--Inserir produto
CREATE PROCEDURE inserirProduto 
(p_nome IN TB_PRODUTOS.NOME_PRODUTO%TYPE , 
 p_quantidade IN TB_PRODUTOS.QUANTIDADE_PRODUTO%TYPE , 
 p_preco IN TB_PRODUTOS.PRECO_PRODUTO%TYPE )
 AS
 BEGIN
    INSERT INTO tb_produtos (nome_produto, quantidade_produto ,preco_produto) 
    VALUES(p_nome, p_quantidade, p_preco);
    COMMIT;
END inserirProduto;

EXECUTE inserirProduto('Capa de Celular', 0, 10);
--SELECT * FROM tb_produtos;


--Excluir produto
CREATE PROCEDURE excluirProduto (p_cod IN TB_PRODUTOS.CODIGO_PRODUTO%TYPE )
AS
BEGIN
	DELETE tb_produtos WHERE codigo_produto = p_cod;
  COMMIT;
END excluirProduto;

EXECUTE excluirProduto(21);


--Consultar produto
CREATE OR REPLACE PROCEDURE consultaProduto(p_cod IN TB_PRODUTOS.CODIGO_PRODUTO%TYPE)
IS
CURSOR C1 IS
	SELECT nome_produto, quantidade_produto, preco_produto 
  FROM TB_produtos 
  WHERE codigo_produto = p_cod;
  
  BEGIN
  FOR X IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE (x.nome_produto ||', '|| x.quantidade_produto ||', '|| x.preco_produto);
  END LOOP;
END consultaProduto;

Execute consultaProduto(2);

--Consultar requisição   ##ERROS DE COMPILAÇÃO
CREATE OR REPLACE PROCEDURE consultaRequisicao
IS
CURSOR C1 IS

	SELECT  req.codigo_requisicao AS codigo_requisicao , 
          func.nome_funcionario AS nome_funcionario, 
          prod.nome_produto AS nome_produto, 
          req.qtd_requisicao AS qtd_requisicao, 
          req.data_requisicao AS data_requisicao, 
          req.status_requisicao AS status_requisicao 
  INTO V1
  FROM tb_requisicao req
	INNER JOIN tb_produtos prod ON req.codigo_produto = prod.codigo_produto
	INNER JOIN tb_funcionarios func ON req.codigo_funcionario = func.codigo_funcionario;

  BEGIN
  FOR X IN C1 LOOP
  SYS.DBMS_OUTPUT.PUTLINE ( X.codigo_requisicao ||', '|| X.nome_funcionario ||', '|| X.nome_produto ||', '|| X.qtd_requisicao ||', '|| X.data_requisicao ||', '|| X.status_requisicao);
  END LOOP;
END consultaRequisicao;


Execute consultaRequisicao;



--Inserir requisição
CREATE OR REPLACE PROCEDURE inserirRequisicao
(p_codfunc IN TB_REQUISICAO.CODIGO_FUNCIONARIO%TYPE, 
 p_codprod IN TB_REQUISICAO.CODIGO_PRODUTO%TYPE, 
 p_qtd IN TB_REQUISICAO.QTD_REQUISICAO%TYPE)
 AS
 BEGIN
    INSERT INTO TB_requisicao(codigo_funcionario, codigo_produto, qtd_requisicao, data_requisicao, status_requisicao)
    VALUES (p_codfunc, p_codprod, p_qtd, SYSDATE(),'P');
  
  COMMIT;
END inserirRequisicao;

Execute inserirRequisicao (2, 2, 80);
--SELECT * FROM TB_PRODUTOS;
--SELECT * FROM TB_REQUISICAO;



--Consulta saída da caixa
CREATE PROCEDURE consultaSaidaCaixa
IS
CURSOR C1 IS

	SELECT  prod.nome_produto AS nome_produto, 
          SUM (req.QTD_REQUISICAO * prod.PRECO_PRODUTO) AS valor_caixa 
  FROM tb_requisicao req
	INNER JOIN tb_produtos prod	ON req.codigo_produto = prod.codigo_produto
	GROUP BY prod.NOME_PRODUTO--, prod.codigo_produto, req.qtd_requisicao
  ORDER BY valor_caixa DESC;
  
  BEGIN
  FOR X IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE (X.nome_produto ||', '|| X.valor_caixa);
  END LOOP;

END consultaSaidaCaixa;

Execute consultaSaidaCaixa;


--Consulta estoque baixo
CREATE OR REPLACE PROCEDURE consultaEstoqueBaixo
IS
CURSOR C1 IS

	SELECT NOME_PRODUTO, QUANTIDADE_PRODUTO, PRECO_PRODUTO 
  FROM tb_produtos
	WHERE quantidade_produto BETWEEN 5 AND 15
	ORDER BY quantidade_produto;
  
  BEGIN
  FOR X IN C1 LOOP
  SYS.DBMS_OUTPUT.PUT_LINE (X.NOME_PRODUTO ||', '|| X.QUANTIDADE_PRODUTO ||', '|| X.PRECO_PRODUTO);
  END LOOP;
  
END consultaEstoqueBaixo;
--SELECT * FROM TB_PRODUTOS;
EXECUTE consultaEstoqueBaixo;


--Update produto
CREATE OR REPLACE PROCEDURE updateProduto
(p_codigo IN TB_PRODUTOS.CODIGO_PRODUTO%TYPE, 
 p_nome IN TB_PRODUTOS.NOME_PRODUTO%TYPE, 
 p_qtd IN TB_PRODUTOS.QUANTIDADE_PRODUTO%TYPE, 
 p_preco IN TB_PRODUTOS.PRECO_PRODUTO%TYPE)
 AS
 BEGIN
    UPDATE tb_produtos
    SET nome_produto = p_nome, preco_produto = p_preco, quantidade_produto = p_qtd
    WHERE codigo_produto = p_codigo;
    COMMIT;
END updateProduto;


Execute updateProduto (2,'Teclado sem Fio', 2, 50);


--Excluir requisição
CREATE OR REPLACE PROCEDURE excluirRequisicao( p_cod IN TB_REQUISICAO.CODIGO_REQUISICAO%TYPE )
AS
BEGIN
	DELETE TB_requisicao WHERE codigo_requisicao = p_cod;
  COMMIT;
END excluirRequisicao;

EXECUTE excluirRequisicao (42);
--SELECT * FROM TB_REQUISICAO;
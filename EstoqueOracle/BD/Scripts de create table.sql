
CREATE TABLE tb_funcionarios (
	  codigo_funcionario INT NOT NULL,
    nome_funcionario VARCHAR(50) NOT NULL,
    cpf_funcionario VARCHAR(20) NOT NULL UNIQUE,
    rg_funcionario VARCHAR(20)	NOT NULL,
    telefone_funcionario VARCHAR(15),
    email_funcionario VARCHAR(50) NOT NULL,
    senha INT NOT NULL);

ALTER TABLE tb_funcionarios ADD PRIMARY KEY (codigo_funcionario);



CREATE TABLE tb_produtos (
	  codigo_produto INT NOT NULL,
    nome_produto VARCHAR(20) NOT NULL,
    quantidade_produto INT,
	  preco_produto FLOAT);
  
  ALTER TABLE tb_produtos ADD PRIMARY KEY (codigo_produto);
  
  

CREATE TABLE tb_requisicao (
	  codigo_requisicao INT NOT NULL,
    codigo_funcionario INT NOT NULL,
    codigo_produto INT NOT NULL,
    qtd_requisicao INT NOT NULL,
    data_requisicao TIMESTAMP NOT NULL,
    status_requisicao CHAR(1) NOT NULL);

 ALTER TABLE tb_requisicao ADD PRIMARY KEY (codigo_requisicao);
 ALTER TABLE tb_requisicao ADD FOREIGN KEY (codigo_funcionario) REFERENCES tb_funcionarios (codigo_funcionario);
 ALTER TABLE tb_requisicao ADD FOREIGN KEY (codigo_produto) REFERENCES tb_produtos (codigo_produto);
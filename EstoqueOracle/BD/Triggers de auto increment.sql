--TRIGGERS DE AUTO INCREMENT

--TB_FUNCIONARIOS
create or replace trigger tgr_tbfunc
before insert on tb_funcionarios
for each row

begin
  select codfunc_seq.nextval
  into :new.codigo_funcionario
  from dual;
end;

--TB_PRODUTOSODUTOS
create or replace trigger tgr_tbprod
before insert on tb_produtos
for each row

begin
  select codprod_seq.nextval
  into :new.codigo_produto
  from dual;
end;

--TB_REQUISICAO
create or replace trigger tgr_tbreq
before insert on tb_requisicao
for each row

begin
  select codreq_seq.nextval
  into :new.codigo_requisicao
  from dual;
end;
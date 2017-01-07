<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Gerencia Produtos</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title">
    <link rel="stylesheet" href="css/vanilla.css" media="screen" title="no title">
    <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" charset="utf-8"></script>
  </head>
  <body>
  	<c:choose> 
		<c:when test="${sessionScope.usuario != null}">  
		    <nav class="navbar navbar-default navbar-fixed-top navbar-cor">
		      <div class="container-fluid">
		        <div class="navbar-header">
		          <a class="navbar-brand" href="home">
		            <img class="alinha-icone-navbar" src="imgs/icone-navbar.png" height="35">
		          </a>
		          <p class="navbar-text">Gerencia Estoque Show</p>
		        </div>
		
		        <ul class="nav navbar-nav">
		          <li><a href="RetornaFuncionarios">Funcionários</a></li>
		          <li><a class="active" href="RetornaProdutos">Produtos</a></li>
		          <li><a href="RetornaRequisicao">Requisições</a></li>
		        </ul>
		
		        <div class="pull-right">
		          <ul class="nav navbar-nav">
		            <li><a href="#"><c:out value="${sessionScope.usuario}" /><i class="glyphicon glyphicon-user"></i></a></li>
		            <li><a href="login">Sair <i class="glyphicon glyphicon-remove"></i></a></li>
		          </ul>
		        </div>
		
		      </div>
		    </nav>
		
		   <div class="container-fluid">
		      <div class="row">
		
		        <div class="col-xs-12">
		          <ol class="breadcrumb">
		            <li><a href="home">Home</a></li>
		            <li class="active"><a href="RetornaProdutos">Produtos</a></li>
		          </ol>
		        </div>
		
		        <div class="col-xs-12">
		          <table class="table table-bordered">
		          	<thead>
			            <caption>Produtos Cadastrados:</caption>
			            <tr>
			              <th colspan="5">
			                <div style='width:100%;' class="input-group">
			                  <span class="input-group-addon">Nome:</span>
			                  <input id="filtroProduto" type="text" class="form-control" placeholder="Pesquisar Produtos por Nome:">
			                  <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
			                </div>
			              </th>
			            </tr>
			            <tr class="info">
			              <th>ID:</th>
			              <th>Produto:</th>
			              <th>Preço:</th>
        			      <th>Quantidade:</th>
			              <th>Alterar:</th>
			              <th>Deletar:</th>
			            </tr>		          	
		          	</thead>
					<tbody id="table-produto">
			            <c:forEach items="${produtos}" var="produto" >
			                <tr> 
			                    <td><c:out value="${produto.codigo}" /></td> 
			                    <td><c:out value="${produto.nome}" /></td>
			                    <td>
									<fmt:setLocale value="pt_BR"/>
									<fmt:formatNumber value="${produto.preco}" type="currency"/> 
			                    </td> 
			                    <td><c:out value="${produto.quantidade}" /></td>
			                    <td>
					               <a href="AtualizaProduto?codigo=${produto.codigo}" class="btn btn-info btn-block alterar" name="button">
					               Alterar Produto
					               <i style="margin-left:5px;" class="glyphicon glyphicon-pencil"></i></a>
					            </td>
					            <td>
					               <button class="btn btn-danger btn-block excluir" name="button">
					               Excluir Produto <span class="hidden codigo" name="codigo"><c:out value="${produto.codigo}"/></span>
					               <i style="margin-left:5px;" class="glyphicon glyphicon-remove"></i></button>
					            </td>
			                </tr>
			            </c:forEach>					
					</tbody>

		          </table>
		
		        </div>
		        
		        <script>
		        
		        	$(document).on("click",".excluir",function(){
		        		var codigo = $(this).find("span").eq(0).text().trim();
		                $.ajax({
		                    url: 'ControllerProduto?codigo='+codigo,
		                    type: 'delete',
		                    success: function(result) {
		                    	alert("Produto Excluido com Suceso.");
		                    	location.reload();
		                    }, error:function(result){
		                    	alert("Ocorreu um Erro ao Excluir: "+ result);
		                    }
		                });     
		        	});    
		        	
				    var $prod = $('#table-produto tr');
				    $('#filtroProduto').keyup(function() {
				        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
				        
				        $prod.show().filter(function() {
				            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
				            return !~text.indexOf(val);
				        }).hide();
				    });	
		        	
		        </script>
		
		        <div class="col-xs-6">
		          <a href="cadastraProduto" class="btn btn-success btn-block" name="button"><p>Cadastrar Produto</p><p><i class="glyphicon glyphicon-plus"></i></p></a>
		        </div>
		        
		        <div class="col-xs-6">
		          <a href="#" id="btn" class="btn btn-info btn-block" name="button"><p>Gerar Relatório</p><p><i class="glyphicon glyphicon glyphicon-print"></i></p></a>
		        </div>
		
		      </div>
		
		    <nav class="navbar navbar-default navbar-fixed-bottom navbar-cor">
		      <div class="container-fluid">
		      </div>
		    </nav>
    
   	    </c:when> 
   	    
		<c:when test="${sessionScope.usuario == null}">
			<h1 class="text-center"><c:out value="Você não possui acesso a esta opção."></c:out></h1>
			<h2 class="text-center">Por favor, faça seu <a href="login">Login</a> e tente novamente.</h2>
		</c:when>
	    
	</c:choose>  

  </body>
</html>

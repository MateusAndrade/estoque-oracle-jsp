<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Index</title>
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
		          <li><a href="RetornaProdutos">Produtos</a></li>
		          <li><a href="RetornaRequisicao">Requisições</a></li>
		        </ul>
		
		        <div class="pull-right">
		          <ul class="nav navbar-nav">
		            <li><a href="#"><c:out value="${sessionScope.usuario}" /><i class="glyphicon glyphicon-user"></i></a></li>
		            <li>
		            	<a href="<c:url value="login"/>">
		            	Sair
		            	 <i class="glyphicon glyphicon-remove"></i>
		           	 	</a>
		           	 </li>
		          </ul>
		        </div>
		
		      </div>
		    </nav>
		
		    <div class="container-fluid">
		      <div class="row">
		        <div class="col-xs-12">
		          <ol class="breadcrumb">
		            <li><a href="home">Home</a></li>
		          </ol>
		        </div>
		        
		        <div class="col-xs-12">
		        	<p>Bem-Vindo <strong class="text-primary"><c:out value="${sessionScope.usuario}" /></strong>, aqui estão algumas informações interessantes:</p>
		        </div>
		        	
		        <div class="col-xs-12">
		          <table class="table table-bordered">
		          	<thead>
			            <caption class="text-success">Produtos com maior Saída de Caixa:</caption>
			            <tr>
			              <th colspan="5">
			                <div style='width:100%;' class="input-group">
			                  <span class="input-group-addon">Nome:</span>
			                  <input id="filtroCaixa" type="text" class="form-control" placeholder="Pesquisar Produtos por Nome:">
			                  <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
			                </div>
			              </th>
			            </tr>
			            <tr class="success">
			              <th>ID:</th>
			              <th>Produto:</th>
			              <th>Valor Saída:</th>
			              <th>Quantidade:</th>
			            </tr>		          	
		          	</thead>
		            <tbody id="table-caixa" >
		            <c:forEach items="${requisicoes}" var="req" >
		                <tr class="requisicao"> 	                
		                    <td><c:out value="${req.prod.codigo}" /></td> 
		                    <td><c:out value="${req.prod.nome}" /></td>
		                    <td>
		                     	<span class="preco-req">
			                  		<fmt:setLocale value="pt_BR"/>
									<fmt:formatNumber value="${req.prod.preco}" type="currency"/>
								</span> 
		                    </td>
		                    <td><c:out value="${req.qtd_requisicao}" /></td> 
		                </tr>
		            </c:forEach>		            
		            </tbody>

		          </table>
		        </div>
		        
		        <div class="col-xs-12">
		          <table class="table table-bordered">
		          	<thead>
			            <caption class="text-danger">Produtos com Estoque baixo:</caption>
			            <tr>
			              <th colspan="5">
			                <div style='width:100%;' class="input-group">
			                  <span class="input-group-addon">Nome:</span>
			                  <input id="filtroProduto" type="text" class="form-control" placeholder="Pesquisar Produtos por Nome:">
			                  <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
			                </div>
			              </th>
			            </tr>
			            <tr class="danger">
			              <th>ID:</th>
			              <th>Produto:</th>
			              <th>Preço:</th>
			              <th>Quantidade:</th>
			            </tr>		          	
		          	</thead>
					<tbody id="table-produto">
		            <c:forEach items="${produtos}" var="produto" >
		                <tr> 	                
		                    <td><c:out value="${produto.codigo}" /></td> 
		                    <td><c:out value="${produto.nome}" /></td>
		                    <td>
		                   		<fmt:formatNumber value="${produto.preco}" type="currency"/>
		                    </td>
		                    <td><c:out value="${produto.quantidade}" /></td> 
		                </tr>
		            </c:forEach>					
					</tbody>
		          </table>
		        </div>		        
		
		      </div>
		
		    </div>
		
		    <nav class="navbar navbar-default navbar-fixed-bottom navbar-cor">
		      <div class="container-fluid">
		      </div>
		    </nav>
		    
		    <script>
		    	
			    var $req = $('#table-caixa tr');
			    $('#filtroCaixa').keyup(function() {
			        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
			        
			        $req.show().filter(function() {
			            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
			            return !~text.indexOf(val);
			        }).hide();
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

		    
	    </c:when>
	    
		<c:when test="${sessionScope.usuario == null}">
			<h1 class="text-center"><c:out value="Você não possui acesso a esta opção."></c:out></h1>
			<h2 class="text-center">Por favor, faça seu <a href="login.jsp">Login</a> clicando aqui e tente novamente.</h2>
		</c:when>
	    
	</c:choose>  

  </body>
</html>

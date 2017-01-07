<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Gerencia Produtos</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title">
    <link rel="stylesheet" href="css/vanilla.css" media="screen" title="no title">
    <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" charset="utf-8"></script>
  </head>
  <body>
  
  	<c:choose> 
		<c:when test="${sessionScope.usuario != null}">
 		    <c:set var="produto" scope="request" value="${produto}"/>	
		    <nav class="navbar navbar-default navbar-fixed-top navbar-cor">
		      <div class="container-fluid">
		        <div class="navbar-header">
		          <a class="navbar-brand" href="#">
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
		            <li><a href="ControllerProduto">Produto</a></li>
		            <li class="active"><a href="#">Cadastrar Produto</a></li>
		          </ol>
		        </div>
		        
		        <div class="col-xs-12">
				   <c:choose>
				      <c:when test="${produto == null}">
				          <form action="ControllerProduto" method="post">				      
				      </c:when>
				
				      <c:otherwise>
				          <form action="AtualizaProduto" method="post">
				      </c:otherwise>
				    </c:choose>	    
			        <input name="codigo" type="hidden" value="${produto.codigo}" />      
		            <div class="form-group">   
		              <div class="row">
		                <div class="col-xs-12">
		                  <label for="nome">Nome:</label>
		                  <input value="${produto.nome}" required type="text" class="form-control" name="nome" placeholder="Insira um Nome para o Produto:">
		                </div>
		              </div>
		            </div>
		
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <label for="quantidade">Quantidade:</label>
		                  <input value="${produto.quantidade}" required type="number" class="form-control" name="quantidade" placeholder="Insira uma Quantidade:">
		                </div>
		                <div class="col-xs-6">
			              <label for="preco">Preço:</label>
		                  <div style='width:100%;' class="input-group">
		                  <span class="input-group-addon"><strong>R$</strong></span>
		    	              <input value="${produto.preco}" required type="text" class="form-control" name="preco" placeholder="Insira um Preço">
		    	           </div>
		                </div>    
		              </div>
		            </div>
		
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <button type="submit" class="btn btn-success btn-block">
						    <c:choose>
						      <c:when test="${produto == null}">
				                  <p>Cadastrar Produto</p><p><i class="glyphicon glyphicon-ok"></i></p>						      
						      </c:when>
						
						      <c:otherwise>
				                  <p>Alterar Produto</p><p><i class="glyphicon glyphicon-ok"></i></p>
						      </c:otherwise>
						    </c:choose>
		                  </button>
		                </div>
		                <div class="col-xs-6">
		                  <button type="exit" class="btn btn-danger btn-block"><p>Cancelar</p><p><i class="glyphicon glyphicon-remove"></i></p></button>
		                </div>
		              </div>
		            </div>
		
		
		          </form>
		
		        </div>
		
		      </div>
		    </div>
		
		    <nav class="navbar navbar-default navbar-fixed-bottom navbar-cor">
		      <div class="container-fluid">
		      </div>
		    </nav>

		</c:when>	

		<c:when test="${sessionScope.usuario == null}">
			<h1 class="text-center"><c:out value="Você não possui acesso a esta opção."></c:out></h1>
			<h2 class="text-center">Por favor, faça seu <a href="login.jsp">Login</a> e tente novamente.</h2>
		</c:when>
	    
	</c:choose>  

  </body>
</html>

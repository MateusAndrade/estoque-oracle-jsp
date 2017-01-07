<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
		            <li><a href="RetornaRequisicao">Requisição</a></li>
		            <li class="active"><a href="#">Cadastrar Requisição</a></li>
		          </ol>
		        </div>
		
				
		
		        <div class="col-xs-12">
		          <form action="ControllerRequisicao" method="get">
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-12">
		                  <label for="produtos">Produto:</label>
		                  <select required name="produtos" class="form-control">
							<c:forEach items="${produtos}" var="produto" >
								<option value="${produto.codigo}">${produto.nome}</option>
							</c:forEach>
		                  </select>
		                </div>
		              </div>
		            </div>
		
		            <div class="form-group">
		            
		              <div class="row">
		              
		                <div class="col-xs-6">
		                  <label for="funcionarios">Funcionário:</label>
		                  <select required name="funcionarios" class="form-control">
							<c:forEach items="${funcionarios}" var="funcionario" >
								<option value="${funcionario.codigo}">${funcionario.nome}</option>
							</c:forEach>
		                  </select>
		                </div>
		                
		                <div class="col-xs-6">
		                	<label for="qtd">Quantidade:</label>
		                	<input required class="form-control" type="number" name="qtd">
		                </div>
		                                
		              </div>
		              
		            </div>
		            
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <button type="submit" class="btn btn-success btn-block"><p>Cadastrar Requisição</p><p><i class="glyphicon glyphicon-ok"></i></p></button>
		                </div>
		                <div class="col-xs-6">
		                  <button href="RetornaRequisicao" class="btn btn-danger btn-block"><p>Cancelar</p><p><i class="glyphicon glyphicon-remove"></i></p></button>
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
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
    <script src="js/jquery.mask.js"></script>
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
		          <li><a class="active" href="RetornaFuncionarios">Funcionários</a></li>
		          <li><a href="RetornaProdutos">Produtos</a></li>
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
		            <li><a href="RetornaFuncionarios">Funcionário</a></li>
		            <li class="active"><a href="#">Cadastrar Funcionário</a></li>
		          </ol>
		        </div>
		        
		        <div class="col-xs-12">
				   <c:choose>
				      <c:when test="${funcionario == null}">
				          <form action="ControllerFuncionario" method="post">				      
				      </c:when>
				
				      <c:otherwise>
				          <form action="AtualizaFuncionario" method="post">
				      </c:otherwise>
				      
				    </c:choose>	 
				       
			        <input name="codigo" type="hidden" value="${funcionario.codigo}" />      
		            <div class="form-group">   
		              <div class="row">
		                <div class="col-xs-12">
		                  <label for="nome">Nome:</label>
		                  <input maxlength="50" value="${funcionario.nome}" required type="text" class="form-control" name="nome" placeholder="Insira um Nome para o Funcionário">
		                </div>
		              </div>
		            </div>
		
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <label for="quantidade">CPF:</label>
		                  <input maxlength="20" value="${funcionario.cpf}" id="cpf" required type="text" class="form-control" name="cpf" placeholder="Insira um CPF para o Funcionário:">
		                </div>
		                <div class="col-xs-6">
			              <label for="rg">RG:</label>
		    	          <input maxlength="20" value="${funcionario.rg}" required type="text" class="form-control" name="rg" placeholder="Insira um RG para o Funcionário:">
		                </div>    
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <label for="quantidade">Telefone:</label>
		                  <input maxlength="15" value="${funcionario.telefone}" required type="text" class="form-control" name="telefone" id="telefone" placeholder="Insira um Telefone para o Funcionário:">
		                </div>
		                <div class="col-xs-6">
			              <label for="rg">Email:</label>
		    	          <input maxlength="50" value="${funcionario.email}" required type="email" class="form-control" name="email" placeholder="Insira um Email para o Funcionário:">
		                </div>    
		              </div>
		            </div>
		            
		            <div class="form-group">
		            	
		              <input type="hidden" id="senha_oculta" value="${funcionario.senha}"/>	
		            
		              <div class="row">
		                <div class="col-xs-6">
		                  <label for="quantidade">Senha:</label>
		                  <input id="senha1" required type="password" class="form-control" name="senha1" placeholder="Insira uma Senha para o Funcionário:">
		                </div>
		                <div class="col-xs-6">
			              <label for="rg">Confirmação de Senha:</label>
		    	          <input id="senha" required type="password" class="form-control" name="senha" placeholder="Confirme a Senha para o Funcionário:">
		                </div>    
		              </div>
		            </div>
		
		            <div class="form-group">
		              <div class="row">
		                <div class="col-xs-6">
		                  <button id="cadastrar" disabled="true" type="submit" class="btn btn-success btn-block">
						    <c:choose>
						      <c:when test="${funcionario == null}">
				                  <p>Cadastrar Funcionário</p><p><i class="glyphicon glyphicon-ok"></i></p>						      
						      </c:when>
						
						      <c:otherwise>
				                  <p>Alterar Funcionário</p><p><i class="glyphicon glyphicon-ok"></i></p>
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
	
	<script>
		
		$(document).ready(function(){
			
			$('#telefone').mask('(00) 00000-0000');
			
			$('#cpf').mask('000.000.000-00', {reverse: true});
			
		});
		
		$(document).on("input","#senha",function(){
			if($("#senha").val() === $("#senha1").val()){
				$("#cadastrar").prop("disabled", false)
				console.log($("#senha1").val());			
			}			
		});
		
	
	</script>

  </body>
</html>

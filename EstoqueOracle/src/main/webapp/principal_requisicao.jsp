<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Gerencia Requisição</title>
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
		            <li class="active"><a href="RetornaRequisicao">Requisicões</a></li>
		          </ol>
		        </div>
		
		        <div class="col-xs-12">
		          <table class="table table-bordered">
		          	<thead>
			            <caption>Requisições Registradas:</caption>
			            <tr>
			              <th colspan="9">
			                <div style='width:100%;' class="input-group">
			                  <span class="input-group-addon">Nome:</span>
			                  <input id="filtroReq" type="text" class="form-control" placeholder="Filtrar Requisições por Código:">
			                  <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
			                </div>
			              </th>
			            </tr>
			            <tr class="info">
			              <th>ID:</th>
			              <th>Funcionário:</th>
			              <th>Produto:</th>
			              <th>Quantidade:</th>
			              <th>Data:</th>
			              <th>Status:</th>
			              <th colspan="2">Opções:</th>
			            </tr>		          	
		          	</thead>
					<tbody id="table-req">
			            <c:forEach items="${requisicoes}" var="requisicao" >
			                <tr> 
			                    <td><c:out value="${requisicao.codigo_requisicao}" /></td> 
			                    <td><c:out value="${requisicao.func.nome}" /></td> 
			                    <td><c:out value="${requisicao.prod.nome}" /></td> 
			                    <td><c:out value="${requisicao.qtd_requisicao}" /></td> 
			                    <td>
								    <fmt:formatDate pattern="dd/MM/yyyy" value="${requisicao.data_requisicao}" />
			                    </td> 
								<c:set var="status" value="${requisicao.status}"/>
								<c:if test="${requisicao.status == 'P'}">
									<td style="color:white; background:#EF5350;">
			                   			<strong><c:out value="${requisicao.status}" /></strong>						
									</td>
									<td>
						               <button class="btn btn-info btn-block baixar" name="baixar">
						               Baixar Requisição <span class="hidden codigo" name="codigo"><c:out value="${requisicao.codigo_requisicao}"/></span>
						               <i style="margin-left:5px;" class="glyphicon glyphicon-pencil"></i></button>	
									</td>  
			                   	</c:if>     
								<c:if test="${requisicao.status == 'B'}">
									<td style="color:white; background:#039BE5;">
			                   			<strong><c:out value="${requisicao.status}" /></strong>						
									</td>
									<td>
						               <button class="btn btn-warning btn-block estornar" name="button">
						               Estornar Requisição <span class="hidden codigo" name="codigo"><c:out value="${requisicao.codigo_requisicao}"/></span>
						               <i style="margin-left:5px;" class="glyphicon glyphicon-pencil"></i></button>	
									</td>  					
			                   	</c:if>     
								<td>
					               <button class="btn btn-danger btn-block cancelar" name="button">
					               Cancelar Requisição <span class="hidden codigo" name="codigo"><c:out value="${requisicao.codigo_requisicao}"/></span>
					               <i style="margin-left:5px;" class="glyphicon glyphicon glyphicon-remove"></i></button>									
								</td>	                   	                                  
			                </tr>
			            </c:forEach>  					
					</tbody>
                </table>
		
		        </div>
		        
		        <div class="col-xs-6">
		          <a href="cadastraRequisicao" id="btn" class="btn btn-success btn-block" name="button"><p>Gerar Requisição</p><p><i class="glyphicon glyphicon-plus"></i></p></a>
		        </div>
		        
		        <div class="col-xs-6">
		          <a href="#" id="btn" class="btn btn-info btn-block" name="button"><p>Gerar Relatório</p><p><i class="glyphicon glyphicon glyphicon-print"></i></p></a>
		        </div>
		
		      </div>
		      
		      <script>
		      	
			  	$(document).on("click",".baixar",function(){
					var codigo = $(this).find("span").eq(0).text().trim();
			        $.ajax({
			            url: 'ControllerRequisicao?tipo=B&codigo='+codigo,
			            type: 'put',
			            success: function(result) {
			            	alert("Requisição Feita com Suceso.");
			            	location.reload();
			            }, error:function(result){
			            	alert("Ocorreu um Erro ao realizar a requisição.: "+ result);
			            }
			        });     
				}); 
			  	
			  	$(document).on("click",".estornar",function(){
					var codigo = $(this).find("span").eq(0).text().trim();
			        $.ajax({
			            url: 'ControllerRequisicao?tipo=P&codigo='+codigo,
			            type: 'put',
			            success: function(result) {
			            	alert("Requisição Estornada com Suceso.");
			            	location.reload();
			            }, error:function(result){
			            	alert("Ocorreu um Erro ao realizar a operação.: "+ result);
			            }
			        });     
				}); 
			  	
			  	$(document).on("click",".cancelar",function(){
					var codigo = $(this).find("span").eq(0).text().trim();
			        $.ajax({
			            url: 'ControllerRequisicao?codigo='+codigo,
			            type: 'delete',
			            success: function(result) {
			            	alert("Requisição Cancelada com Suceso.");
			            	location.reload();
			            }, error:function(result){
			            	alert("Ocorreu um Erro ao realizar a operação.: "+ result);
			            }
			        });     
				}); 
			  	
			    var $req = $('#table-req tr');
			    
			    console.log($req);
			    
			    $('#filtroReq').keyup(function() {
			        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
			        
			        $req.show().filter(function() {
			            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
			            return !~text.indexOf(val);
			        }).hide();
			    });			  	
		      
		      </script>
		
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

<%-- 
    Document   : point-fiche
    Created on : 22 mars 2024, 09:26:43
    Author     : Angela
--%>

<%@page import="annexe.Point"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="bean.*" %>
<%@ page import="utilitaire.*" %>
<%@ page import="affichage.*" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%
    UserEJB u = (user.UserEJB)session.getValue("u");
    
%>
<%
    Point point = new Point();
    point.setNomTable("POINT");
    PageConsulte pc = new PageConsulte(point, request, u);
    pc.setTitre("Fiche point");
    pc.getBase();
    String id=pc.getBase().getTuppleID();
    pc.getChampByName("id").setLibelle("Id");
    pc.getChampByName("val").setLibelle("D&eacute;signation");
    pc.getChampByName("desce").setLibelle("Description");
    String lien = (String) session.getValue("lien");
    String pageModif = "annexe/point/point-modif.jsp";
    String classe = "annexe.Point";
%>

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="box-fiche">
                <div class="box">
                    <div class="box-title with-border">
                        <h1 class="box-title"><a href=<%= lien + "?but=annexe/point/point-liste.jsp"%> <i class="fa fa-arrow-circle-left"></i></a><%=pc.getTitre()%></h1>
                    </div>
                    <div class="box-body">
                        <%
                            out.println(pc.getHtml());
                        %>
                        <br/>
                        <div class="box-footer">
                            <a class="btn btn-warning pull-right"  href="<%= lien + "?but="+ pageModif +"&id=" + id%>" style="margin-right: 10px">Modifier</a>
                        </div>
                        <br/>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


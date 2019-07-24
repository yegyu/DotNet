<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="result" value="${result }"/>
	<c:if test="${result == 1}">
		<result><![CDATA[
			{
				code : "success",
				message : "사용할 수 없는 아이디입니다.",
			}
		]]></result>
		
	</c:if>
	<c:if test="${result != 1}">
		<result><![CDATA[
			{
				code : "success",
				message : "사용할 수 있는 아이디입니다.",
			}
		]]></result>
	</c:if>

    
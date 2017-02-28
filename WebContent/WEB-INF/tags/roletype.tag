<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="name" type="java.lang.String" required="true" %>
<%@ attribute name="value" type="java.lang.String" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" tagdir="/WEB-INF/tags" %>
<div class="radio-list">
	<!-- 平台 -->
	<c:if test="${curUser.userType==1}">
		<form:field name="userType" label="类型" value="" required="true" useBody="true" >
			<label class="radio-inline">
			<input type="radio" <c:if test="${value==1}">checked=""</c:if> value="1"  name="${name }"> 平台
			</label>
			<label class="radio-inline">
			<input type="radio" <c:if test="${value==2}">checked=""</c:if> value="2"  name="${name }"> 商场
			</label> 
			<label class="radio-inline">
			<input type="radio" <c:if test="${value==3}">checked=""</c:if> value="3"  name="${name }"> 商铺
			</label>
			<label class="radio-inline">
			<input type="radio" <c:if test="${value==4}">checked=""</c:if> value="4"  name="${name }"> 运营
			</label>
		</form:field>
	</c:if>
	<!-- 商场 -->
	<c:if test="${curUser.userType==2}">
		<input type="hidden"  value="2"  name="${name }" />
	</c:if>
	<!-- 商铺 -->
	<c:if test="${curUser.userType==3}">
		<input type="hidden"  value="3"  name="${name }" />
	</c:if>
	<!-- 运营 -->
	<c:if test="${curUser.userType==4}">
		<input type="hidden"  value="4"  name="${name }" />
	</c:if>
	<!-- 系统 -->
	<c:if test="${curUser.userType==5}">
		<form:field name="userType" label="类型" value="" required="true" useBody="true" >
				<label class="radio-inline">
				<input type="radio" <c:if test="${value==1}">checked=""</c:if> value="1"  name="${name }"> 平台
				</label>
				<label class="radio-inline">
				<input type="radio" <c:if test="${value==2}">checked=""</c:if> value="2"  name="${name }"> 商场
				</label> 
				<label class="radio-inline">
				<input type="radio" <c:if test="${value==3}">checked=""</c:if> value="3"  name="${name }"> 商铺
				</label>
				<label class="radio-inline">
				<input type="radio" <c:if test="${value==4}">checked=""</c:if> value="4"  name="${name }"> 运营
				</label>
				<label class="radio-inline">
				<input type="radio" <c:if test="${value==5}">checked=""</c:if> value="5"  name="${name }"> 系统
				</label>
		</form:field>
	</c:if>
</div>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="MSThemeCompatible" content="no" />
<%@ include file="/common/meta.jsp" %>
<link href="${ctx}/static/scripts/widgets/extremecomponents/extremecomponents.css" type="text/css" rel="stylesheet">
<title>travelSelf管理</title>
</head>
<body onload="clearHiddenCheckBox()">
<div class="pageTitle">您所在的位置：系统管理 - travelSelf管理</div>	
<div style="text-align: left;" class="queryForm">
<%@ include file="/common/messages.jsp"%>
<form action="/travelSelf" class="form" method="post" name="searchForm">
     id: <input type="text" name="id" value="${travelSelf.id }" size="10"/>
<input type="image" src="<c:url value="/static/images/icon/16x16/search.gif"/>"  class="nullBorder" onclick="searchForm.submit();" align="middle" />
<A href="<c:url value="${ctx}/travelSelf/toAdd"/>"><img src="<c:url value="/static/images/icon/16x16/new.gif"/>" align="middle"></A>
<A href="javascript:batch_do('删除资源','<c:url value="${ctx}/travelSelf/delete/" />');"><img src="<c:url value="/static/images/icon/16x16/delete.gif"/>" align="middle"></A>
</form>
</div>
	<div id="tableDiv">
	    <ec:table items="travelSelfList" var="travelSelf"
	              action="${ctx}/travelSelf"
			xlsFileName="用户列表.xls" 
			csvFileName="用户列表.csv"			
			useAjax="true"
			minColWidth="80"
			doPreload="false"
			pageSizeList="13,20,50,100,500,all" 
			rowsDisplayed="13" 		
			retrieveRowsCallback="limit" 
			sortRowsCallback="limit"		
			sortable="true" 
			generateScript="true" 		
			resizeColWidth="true" 		
			classic="true" 		
			filterable="flase"	
			width="100%"
			height="420px"
			minHeight="360"
			toolbarContent="navigation|pagejump|pagesize|refresh |export|extend|status"
		>
	        <ec:row>
	            <ec:column property="rowcount" resizeColWidth="false" cell="rowCount" title="序号" sortable="false" width="40px"/>
	            <ec:column property="id" title="登录名" width="120px" sortable="true"/>
	            <ec:column property="createTime" title="创建时间" width="120px" >
	            	<fmt:formatDate value='${travelSelf.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>
	            </ec:column>
	            
            <ec:column property="name" title="名称" width="120px" />
            <ec:column property="priceMarket" title="市场价" width="120px" />
            <ec:column property="priceNow" title="现价" width="120px" />
            <ec:column property="payType" title="支付方式" width="120px" />
            <ec:column property="priceDescription" title="起价说明" width="120px" />
            <ec:column property="activity" title="优惠活动" width="120px" />
            <ec:column property="provinceNum" title="目的省编号" width="120px" />
            <ec:column property="cityNum" title="目的市编号" width="120px" />
            <ec:column property="townshipNum" title="目的区县编号" width="120px" />
            <ec:column property="description" title="简介" width="120px" />
            <ec:column property="scenicFlag" title="是否景点" width="120px" />
            <ec:column property="hotelFlag" title="是否酒店" width="120px" />
            <ec:column property="airTicketFlag" title="是否机票" width="120px" />
            <ec:column property="modifyTime" title="修改时间" width="120px" />
            <ec:column property="createTime" title="创建时间" width="120px" />
            <ec:column property="state" title="状态" width="120px" />
        
	            
	            <ec:column property="edit" title="查看" sortable="false" viewsAllowed="html" width="40px">
	                <A href="<c:url value="/travelSelf/getById/${travelSelf.id}"/>">查看</A>
	            </ec:column>
	            <ec:column property="edit" title="修改" sortable="false" viewsAllowed="html" width="40px">
	                <A href="<c:url value="/travelSelf/toUpdate/${travelSelf.id}"/>">
	                    <img src="<c:url value="/static/images/icon/16x16/modify.gif"/>" border="0"/>
	                </A>
	            </ec:column>
	            <ec:column property="checkbox" resizeColWidth="false" title="选择" sortable="false" viewsAllowed="html" width="40px">
	                <input type="checkbox" name="itemlist" value="${travelSelf.id}" style="border:0px"/>
	            </ec:column>
	        </ec:row>
	    </ec:table>
	    <c:if test="${empty travelSelfList}">
			<font color="red">无符合条件的查询！</font>
		</c:if>
	    
	</div>
</body>
</html>

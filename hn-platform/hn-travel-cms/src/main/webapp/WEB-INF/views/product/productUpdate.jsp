<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>product修改</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/product/update" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${product.id }"/>
		<fieldset>
			<legend><small>product修改</small></legend>
			
			<!--  
			<div class="control-group">
				<label class="control-label">会员名:</label>
				<div class="controls">
					<input type="text" id="userName" name="userName" value="${member.userName }" class="input-large" />
				</div>
			</div>
			-->
			
            <div class="control-group">
                <label class="control-label">时间:</label>
                <div class="controls">
                    <input type="text" id="productTime" name="productTime" value="${product.productTime }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">名称:</label>
                <div class="controls">
                    <input type="text" id="name" name="name" value="${product.name }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">市场价:</label>
                <div class="controls">
                    <input type="text" id="priceMarket" name="priceMarket" value="${product.priceMarket }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">现价:</label>
                <div class="controls">
                    <input type="text" id="priceNow" name="priceNow" value="${product.priceNow }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">是否促销:</label>
                <div class="controls">
                    <input type="text" id="saleFlag" name="saleFlag" value="${product.saleFlag }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">优惠算法:</label>
                <div class="controls">
                    <input type="text" id="method" name="method" value="${product.method }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">总数量:</label>
                <div class="controls">
                    <input type="text" id="countTotal" name="countTotal" value="${product.countTotal }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">已购数量:</label>
                <div class="controls">
                    <input type="text" id="countSale" name="countSale" value="${product.countSale }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">说明:</label>
                <div class="controls">
                    <input type="text" id="description" name="description" value="${product.description }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">类型:</label>
                <div class="controls">
                    <input type="text" id="productType" name="productType" value="${product.productType }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">修改时间:</label>
                <div class="controls">
                    <input type="text" id="modifyTime" name="modifyTime" value="${product.modifyTime }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">创建时间:</label>
                <div class="controls">
                    <input type="text" id="createTime" name="createTime" value="${product.createTime }" class="input-large" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">状态:</label>
                <div class="controls">
                    <input type="text" id="state" name="state" value="${product.state }" class="input-large" />
                </div>
            </div>
	
			
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#userName").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>

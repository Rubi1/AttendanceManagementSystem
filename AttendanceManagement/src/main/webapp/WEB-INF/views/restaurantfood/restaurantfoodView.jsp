<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="three">
	<div class="contenttable">
		<h3>
			<spring:message code="restaurantfood_title" />
		</h3>
		<div class="contenttable1">
			<table class="content" style="width: 99%;" >
				 				<tr>
					<td class="biao_bt3"><spring:message
							code="restaurantfood_headName" /></td>
					<td>${ restaurantfood.headName }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="restaurantfood_message" /></td>
					<td>${ restaurantfood.message }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="restaurantfood_price" /></td>
					<td>${ restaurantfood.price }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="restaurantfood_imagePath" /></td>
					<td>${ restaurantfood.imagePath }</td>
				</tr>
				  				<tr>
					<td class="biao_bt3"><spring:message
							code="restaurantfood_rate" /></td>
					<td>${ restaurantfood.rate }</td>
				</tr>
				   			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
$ .parser.onComplete = function() {
	parent.$ .messager.progress('close');
};
</script>




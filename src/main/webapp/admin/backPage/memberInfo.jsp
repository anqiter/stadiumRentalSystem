
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String bas = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ bas + "/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=bas%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员信息</title>
<link rel="stylesheet" type="text/css"
	href="<%=bas%>/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=bas%>/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=bas%>/easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=bas%>/easyui/demo/demo.css">
<script type="text/javascript" src="<%=bas%>/js/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="<%=bas%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=bas%>/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body class="easyui-layout" onload="pageLoad">
	<form id="stadiumfrom" class="easyui-form" method="post"
		data-options="novalidate:false">
		<input type="text" value="${param.id}" name="id" style="display:none;"></input>
		<table cellpadding="5">
			<tr>
				<td>id:</td>
				<td><input class="easyui-textbox" type="text" value="${param.id}"
					name="stadiumNumber" data-options="required:true" readonly="readonly"></input></td>
			</tr>
			


		</table>
		<div style="text-align: left; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton updateBtn">确认修改</a>
		</div>
	</form>



	<script type="text/javascript">
		$(function() {
			<%-- var a = "<%=session.getAttribute("rowData")%>"; --%>

	       $.ajax({
	            type : "post",
	            url : 'member!gitMemberInfo.action',
	            data : {//设置数据
	                id : ${param.id},
	            },
	            dataType : "json",//设置需要返回的数据类型
	            success : function(data) {
					alert(data.id);
				}
			}); 
			
	    	//alert("1231");
			//var a = ${rowData};
			//alert(a);	
			
			$(".updateBtn").click(function() {
				alert(${param.id});
			 	//submitForm(); 
			});

		});

	/* 	function submitForm() {
			$('#stadiumfrom').form('submit', {
				url : 'stadium!upDateStadium.action',
				onSubmit : function() {
					return $(this).form('validate');
				},
				dataType : "json",
				success : function(data) {
					var json = eval("(" + data + ")");
					if (json.result == "0") {
						alert(json.msg);
					} else if (json.result == "1") {
						alert(json.msg);
						parent.$('#stadiumGrid').datagrid('reload');
					}
				}
			});
		} */
		
		function pageLoad(){
			alert(${param.id});
		}
	</script>
</body>


</html>

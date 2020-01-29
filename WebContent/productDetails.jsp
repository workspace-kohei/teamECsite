<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/productDetails.css">
<title>商品詳細画面</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div id="main">
		<h1>商品詳細画面</h1>

		<s:if test="productInfoDTO != null">
			<s:form action="AddCartAction">

				<div class="contents">
					<div class="left">
						<img src='<s:property value="productInfoDTO.imgFilePath"/>' class="image-box-22"/><br>
					</div>
					<div class="right">
						<table class="productInfoList">
							<tr>
								<th scope="row"><s:label value="商品名" /></th>
								<td><s:property value="productInfoDTO.productName" /></td>
							</tr>
							<tr>
								<th scope="row"><s:label value="商品名ふりがな" /></th>
								<td><s:property value="productInfoDTO.productNameKana" /></td>
							</tr>
							<tr>
								<th scope="row"><s:label value="値段" /></th>
								<td><s:property value="productInfoDTO.price" />円</td>
							</tr>
							<tr>
								<th scope="row"><s:label value="購入個数" /></th>
								<td><s:select name="productCount"
										list="%{productCountList}" />個</td>
							</tr>
							<tr>
								<th scope="row"><s:label value="発売会社名" /></th>
								<td><s:property value="productInfoDTO.releaseCompany" /></td>
							</tr>
							<tr>
								<th scope="row"><s:label value="発売年月日" /></th>
								<td><s:property value="productInfoDTO.releaseDate" /></td>
							</tr>
							<tr>
								<th scope="row"><s:label value="商品詳細情報" /></th>
								<td><s:property value="productInfoDTO.productDescription" /></td>
							</tr>
						</table>

						<div class="addCartBtnBox">
							<s:submit value="カートに追加" class="submit_btn" />
						</div>

					</div>

					<s:hidden name="productId" value="%{productInfoDTO.productId}" />
				</div>

			</s:form>

			<s:if
				test="relatedProductList != null && relatedProductList.size() > 0">
				<div class="box">
					<div class="relatedProductBox">
						<h2>【関連商品】</h2>
						<s:iterator value="relatedProductList">
							<div class="recommendBox">
								<a
									href='<s:url action="ProductDetailsAction">
									<s:param name="productId" value="%{productId}"/>
									</s:url>'>
									<img src='<s:property value="imgFilePath"/>' class="image-box-10"/>
									<s:property value="productName" /><br>
								</a>
							</div>
						</s:iterator>
					</div>
				</div>
			</s:if>
		</s:if>

		<s:else>
			<div class="message">
				<p>商品の詳細情報がありません。</p>
			</div>
		</s:else>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<title>ヘッダー</title>
</head>

<body>

	<header>
	<div id="header-title">espresso</div>
		<ul>
		<s:form action="SearchItemAction">

			<s:if test='#session.mCategoryDTOList!=null && #session.mCategoryDTOList.size()>0'>
				<!-- categoryLsitからcategoryNameを受け取る -->
				<li><s:select name="categoryId" list="#session.mCategoryDTOList" listValue="categoryName" listKey="categoryId" class="categorySelect" id="categoryId"/></li>
			</s:if>

			<li><s:textfield name="searchItemName" placeholder="検索ワード" maxlength="50" class="txt-keywords"/></li>
			<li><s:submit value="商品検索" class="submit_btn" /></li>
		</s:form>

		<!-- ログイン時 -->
		<s:if test="#session.loginFlg==1">
			<s:form action="LogoutAction">
				<li><s:submit value="ログアウト" class="submit_btn"/></li>
			</s:form>
		</s:if>

		<!-- 未ログイン時 -->
		<s:else>
		<s:form  action="GoLoginAction">
			<li><s:submit value="ログイン" class="submit_btn"/></li>
		</s:form>
		</s:else>

		<s:form action="CartAction">
			<li><s:submit value="カート" class="submit_btn"/></li>
		</s:form>

		<s:form action="SearchItemAction">
			<li><s:submit value="商品一覧" class="submit_btn"/></li>
		</s:form>

		<s:if test="#session.loginFlg==1">
		<s:form action="MyPageAction">
			<li><s:submit value="マイページ" class="submit_btn"/></li>
		</s:form>
		</s:if>
		</ul>
	</header>

</body>
</html>


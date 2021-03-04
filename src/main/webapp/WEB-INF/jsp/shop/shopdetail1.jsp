<%@ page import="com.javaweb.clothingstore.entity.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Derrick
  Date: 2019/11/19
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <table>
        <tr><th>店铺名</th><td><input type="text" class="form-control" placeholder="请输入名称" value="${shop.shopName}"></td></tr>
        <tr><th>入驻时间</th><td><input type="text" class="form-control" placeholder="请输入名称" value="${shop.createTime}"></td></tr>
        <tr><th>店铺分类</th><td><input type="text" class="form-control" placeholder="店铺分类" value="${shop.shopCategory.shopCategoryName}"></td></tr>
        <tr><th>所属区域</th><td><select>
            <c:forEach var="Area" items="${areaList}">
                <c:choose>
                <c:when test="${Area.areaId==shop.area.areaId}">
                    <option data-id="${Area.areaId}" selected="selected">${Area.areaName}</option>
                </c:when>
                <c:otherwise>
                    <option data-id="${Area.areaId}">${Area.areaName}</option>
                </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        </td></tr>
        <tr><th>详细电话</th><td><input type="text" class="form-control" placeholder="请输入名称" value="${currentShop.phone}"></td></tr>
        <tr><th>详细地址</th><td><input type="text" class="form-control" placeholder="请输入名称" value="${currentShop.shopAddr}"></td></tr>
        <tr><textarea class="form-control" rows="4" placeholder="店铺简介" value="${currentShop.shopDesc}"></textarea>
        </tr>
        <tr>
            <td> <input type="text" class="form-control" placeholder="请输入验证码" value=""> </div>
            </td>
            <td>
                <img  id="kaptcha_img" alt="点击更换" title="点击更换" onclick="changeVerifyCode(this)" src="../Kaptcha"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
</body>
</html>

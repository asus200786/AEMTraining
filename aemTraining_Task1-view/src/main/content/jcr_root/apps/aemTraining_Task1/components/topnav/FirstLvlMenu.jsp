<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%@page import="java.util.Iterator,com.day.text.Text,com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>

<%@page import="com.company.AEMTraining.taglib.GetNodeChildTag"%>
<%@taglib prefix="nodeTag" uri="http://AEMTraining.company.com/taglibs/aemTraining_Task1-taglib"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cq:includeClientLib categories="task1"/>

<div id="header">
    <div class="navigation_wrapper">
        <div class="header_navigation topnavigation">
            <div class="first_level_wrapper">
                <ul class="first_level">
                    <li class="list_item_first_level">
                        <a class="logo_from_header" href="/content/aemTraining_Task1/english/news.html">
                            <img title="EPAM Systems" src="/etc/designs/aemTraining_Task1/images/logo-white.png">
                        </a>
                    </li>
                     <nodeTag:getChild valueFirstLvl="/content/aemTraining_Task1/english/" />
                    <c:forEach items="${valueFirstLvl}" var="firstLvl">
                          <li class="list_item_first_level current">
                             <a href='${firstLvl.value}.html'>${firstLvl.key}</a>
                          </li>
                         <c:if test="${fn:containsIgnoreCase(currentPage.path, firstLvl.key)}">
                           <c:set var="secondLvlPath" value="${firstLvl.value}" />
                         </c:if>
                    </c:forEach>
                </ul>
            </div>

            <div class="clr" />

            <div class="second_level_wrapper">
                <ul class="ul_second_level">
                    <nodeTag:getChild valueSecondLvl="${secondLvlPath}"/>
                    <c:forEach items="${valueSecondLvl}" var="secondLvl">
                    <li><a href="${secondLvl.value}.html">${secondLvl.key}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>

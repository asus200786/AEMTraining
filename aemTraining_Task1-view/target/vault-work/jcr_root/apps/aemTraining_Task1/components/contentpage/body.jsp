<%@ include file="/apps/aemTraining_Task1/components/global.jspx" %>
<%@page session="false" %>

<body>
    <cq:setContentBundle source="page"/>
    <cq:include path="topnav" resourceType="aemTraining_Task1/components/topnav" />
    <div class="header">
        <h1>Welcome to my project!</h1>
        <cq:include path="par" resourceType="foundation/components/parsys"/>
    </div>
</body>
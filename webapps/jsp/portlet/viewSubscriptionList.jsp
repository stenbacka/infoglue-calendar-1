<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<c:set var="activeNavItem" value="Calendars" scope="page"/>

<%@ include file="adminHeader.jsp" %>
<%@ include file="functionMenu.jsp" %>

<portlet:renderURL var="viewListUrl">
	<portlet:param name="action" value="ViewEventSubscriptionList"/>
</portlet:renderURL>

<portlet:renderURL var="confirmUrl">
	<portlet:param name="action" value="Confirm"/>
</portlet:renderURL>

<script type="text/javascript">
	function submitDelete(okUrl, confirmMessage)
	{
		//alert("okUrl:" + okUrl);
		document.confirmForm.okUrl.value = okUrl;
		document.confirmForm.confirmMessage.value = confirmMessage;
		document.confirmForm.submit();
	}
</script>
<form name="confirmForm" action="<c:out value="${confirmUrl}"/>" method="post">
	<input type="hidden" name="confirmTitle" value="Radera - bekr&#228;fta"/>
	<input type="hidden" name="confirmMessage" value="Fixa detta"/>
	<input type="hidden" name="okUrl" value=""/>
	<input type="hidden" name="cancelUrl" value="<c:out value="${viewListUrl}"/>"/>	
</form>

<div class="subfunctionarea leftCol">
<span class="left"></span>	
<span class="right">
	<a href="<c:out value="${viewSubscriptionsUrl}"/>" title="Skapa ny post"><ww:property value="this.getLabel('labels.internal.calendar.viewSubscriptions')"/></a>
</span>	
<div class="clear"></div>
</div>

<div class="mainCol">

    <div class="columnlabelarea">
        <div class="columnLong"><p><ww:property value="this.getLabel('labels.internal.subscribers')"/></p></div>
        <div class="clear"></div>
    </div>
    
    <ww:iterator value="subscribers" status="rowstatus">
    
        <ww:set name="subscriptionId" value="top.id" scope="page"/>
        <ww:set name="name" value="top.email" scope="page"/>
        
        <portlet:actionURL var="deleteUrl">
            <portlet:param name="action" value="DeleteEventSubscription"/>
            <portlet:param name="subscriptionId" value='<%= pageContext.getAttribute("subscriptionId").toString() %>'/>
        </portlet:actionURL>
        
        <ww:if test="#rowstatus.odd == true">
            <div class="oddrow">
        </ww:if>
        <ww:else>
            <div class="evenrow">
        </ww:else>
    
            <div class="columnLong">
                <p class="portletHeadline"><ww:property value="top.email"/></p>
            </div>
            <div class="columnEnd">
                <a href="javascript:submitDelete('<c:out value="${deleteUrl}"/>', '&#196;r du s&#228;ker p&#229; att du vill radera &quot;<ww:property value="top.email"/>&quot;');" title="Radera '<ww:property value="top.email"/>'" class="delete"></a>
            </div>
            <div class="clear"></div>
        </div>
            
    </ww:iterator>
    
    <ww:if test="subscribers == null || subscribers.size() == 0">
        <div class="oddrow">
            <div class="columnLong"><p class="portletHeadline"><ww:property value="this.getLabel('labels.internal.applicationNoItemsFound')"/></a></p></div>
            <div class="columnMedium"></div>
            <div class="columnEnd"></div>
            <div class="clear"></div>
        </div>
    </ww:if>

</div>

<div style="clear:both"></div>

<%@ include file="adminFooter.jsp" %>

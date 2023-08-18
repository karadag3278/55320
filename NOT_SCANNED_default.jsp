<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/csrfguard.tld" prefix="csrf" %>
<jsp:useBean id="navForm" scope="request" class="com.acxiom.mops.forms.NavForm" />

<csrf:form name="form1" method="post" action="../servlet/DispatcherServlet">
<input type="hidden" name="formName" value="/jsp/.jsp" >
<input type="hidden" name="activity" >
<input type="hidden" name="tabArray" value="1" >
<input type="hidden" name="tabIdx" value="0" >
<input type="hidden" name="formDirty" value="${fn:escapeXml( navForm.getFormDirty() )}" >
</csrf:form>
<script>
function doOnLoad()
{
}
function doSubmit()
{
    document.form1.submit();
}
function navOK(prompt)
{
    return true;
}
</script>


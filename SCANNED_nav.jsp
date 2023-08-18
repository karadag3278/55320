<%@ page language="java" import="com.acxiom.mops.helper.MenuNav,
                                 com.acxiom.mops.helper.Util,
                                 com.acxiom.mops.helper.HttpHelper" %>
  <jsp:useBean id="userSession" scope="session" class="com.acxiom.mops.objects.UserSession" />
  <jsp:useBean id="navForm" scope="request" class="com.acxiom.mops.forms.NavForm" />
  <% if (!userSession.isAuthenticated()) { response.sendRedirect("../jsp/timeOut.jsp"); return; } String
    pageMenuLabel=MenuNav.getPageTitle(navForm.getFormName()); %>
    <html>

    <head>
      <title>
        <%= pageMenuLabel %>
      </title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
      <link href="../css/style.css" rel="stylesheet" type="text/css">
      <link href="../js/jquery-ui.min.css" rel="stylesheet" type="text/css">

    </head>

    <body onkeydown="return checkKey();" onLoad="doOnLoad();" bgcolor="#FFFFFF" text="#000000" leftmargin="0"
      topmargin="0" marginwidth="0" marginheight="0">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20%" rowspan=2>
            <%= MenuNav.getLogo(userSession) %>
          </td>
          <td width="60%" align="center" valign="bottom"><span class="title" style="line-height:30px">
              <%=pageMenuLabel%>
            </span></td>
          <td width='20%'>&nbsp;</td>
        </tr>
        <tr>
          <td width="80%" colspan=2 align="right" valign="bottom">
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align=right>
                  <%= MenuNav.getTopMenu(navForm) %>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr style="line-height:13px">
          <td align="right"><img border=0 src="../images/tab_on_btm_lt_slope.gif" /></td>
          <td width="100%" background="../images/tab_on_btm.gif">&nbsp;</td>
          <td width="4" align="left"><img border=0 width=4 src="../images/tab_on_btm_rt.gif" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100%" align=center style="margin-top:1;margin-left:5;margin-right:5;">
            <table width=100% border=0>
              <tr>
                <td valign=top width="16%">
                  <%=MenuNav.getLeftMenuSections(userSession)%>
                </td>
                <td valign=top>
                  <jsp:include page='<%=Util.apacheEscapeForHtml(navForm.getFormName()) %>' />
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </body>
    <script>
      function doAbortContinue() {
        if (confirm("Changes on the form have not been saved\n\nPress OK to continue without saving\n\nPress Cancel to return to the form")) {
          document.form1.formDirty.value = "false";
          return true;
        }
        return false;
      }
      function doNavigate(act, frm, arr, idx) {

        if (!navOK(true))
          return;

        document.form1.activity.value = act;
        document.form1.formName.value = frm;
        document.form1.tabArray.value = arr;
        document.form1.tabIdx.value = idx;

        doSubmit();
      }
      function checkKey() {

        var BACKSPACE = 8;

        key = window.event.keyCode;

        /*
         * disabling backspace in anything other than approved tags. 
         * prevents a user from deliberately or inadvertently using the 
         * backspace key to go "back" a page. 
         */

        if (navigator.appName.indexOf("Microsoft") != -1) {
          if (key == BACKSPACE) {
            if (!canUseBackspace(window.event.srcElement)) {
              window.event.keyCode = 0;
              return false;
            }
          }
        }
      }
      function canUseBackspace(obj) {
        var validTags = new Array("INPUT", "TEXTAREA");
        var isValid = false;
        var tagName = obj.tagName;
        for (var i = 0; i < validTags.length; i++) {
          if (tagName == "INPUT") {

            if ((obj.type == "checkbox") || (obj.type == "radio"))
              break;
          }
          if (tagName == validTags[i]) {
            isValid = true;
            break;
          }
        }
        return isValid;
      }
    </script>

    </html>
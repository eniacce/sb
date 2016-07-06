<%@ page import="com.model.Staffs" %>
<body class="page-md page-sidebar-closed-hide-logo page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed page-sidebar-closed">
<div id="loader-wrapper">
    <div class="loadertext" style="display: none">LOADING</div>
    <div id="loader"></div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="/">
                <img src="/assets/admin/layout2/img/payguru.png" alt="logo" class="logo-default"/>
            </a>

            <div class="menu-toggler sidebar-toggler">

            </div>
        </div>
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
           data-target=".navbar-collapse">
        </a>

        <div class="page-actions">

        </div>
        <!-- END PAGE ACTIONS -->
        <!-- BEGIN PAGE TOP -->
        <div class="page-top">
            <!-- BEGIN HEADER SEARCH BOX -->
            <form class="search-form search-form-expanded" action="/search" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="SEARCH" name="q">
					<span class="input-group-btn">
					<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
					</span>
                </div>
            </form>
            <!-- END HEADER SEARCH BOX -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-extended quick-sidebar-toggler">
                        <% Staffs staffs= (Staffs) session.getAttribute("staffs");%>
                        <%= staffs.getUsername()%>
                    </li>
                    <li class="dropdown dropdown-language">
                        <a href="/change-lang/" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true" aria-expanded="false">
                            <img alt="" src="/assets/global/img/flags/">
						<span class="langname uppercase">
						</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                
                            </li>
                        </ul>
                    </li>
                    <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                    <li class="dropdown dropdown-extended quick-sidebar-toggler">
                        <span class="sr-only">Toggle Quick Sidebar</span>
                        <i class="icon-logout" onclick="logout()"></i>
                    </li>

                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
        <!-- END PAGE TOP -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <div class="page-container-wrapper">
        <%@include file="sidebar.jsp" %>

        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <div class="page-content">

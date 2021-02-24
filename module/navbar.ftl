<nav class="navbar">
    <div class="navbar-logo">
        <a href="/">${blog_title!}</a>
    </div>
    
    <div class="navbar-item">

        <ul>
            <@menuTag method="tree">
                <#list menus?sort_by('priority') as menu>
                    <li>
                        <#if menu.children?? && menu.children?size gt 0>
                                <#--  <a href="javascript:void(0)" target="${menu.target!}" class="nav-menu-link">${menu.name} <i class="fa fa-angle-down nav-menu-angle" aria-hidden="true"></i></a>  -->
                            <#else>
                                <a href="${menu.url!}" target="${menu.target!}">${menu.name}</a>
                        </#if>
                        <#--  <#if menu.children?? && menu.children?size gt 0>
                            <ul class="nav-sub-menu" style="display: none;">
                                <#list menu.children?sort_by('priority') as child>
                                    <li>
                                        <a href="${child.url!}" data-ajax target="${child.target!}"
                                            onfocus="this.blur();">${child.name}</a>
                                    </li>
                                </#list>
                            </ul>
                        </#if>  -->
                    </li>
                </#list>
            </@menuTag>
        </ul>
        
        <a class="navbar-toggler">
            <span class="navbar-toggler--line navbar-toggler--line-left"></span>
            <span class="navbar-toggler--line"></span>
            <span class="navbar-toggler--line navbar-toggler--line-right"></span>
        </a>
    </div>
    
</nav>
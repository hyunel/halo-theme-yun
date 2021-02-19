<nav class="pagination-wrapper">
    <div class="pagination">

        <#if pagination.hasPrev>
            <a class="prev page-numbers" href="${pagination.prevPageFullPath!}">prev</a>
        <#else>
            <a class="prev page-numbers disable" href="javascript:;">prev</a>
        </#if>

        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <span aria-current="page" class="page-numbers current">${number.page}</span>
            <#else>
                <a class="page-numbers" href="${number.fullPath!}">${number.page}</a>
            </#if>
        </#list>

        <#if pagination.hasNext>
            <a class="next page-numbers" href="${pagination.nextPageFullPath!}">next</a>
        <#else>
            <a class="next page-numbers disable" href="javascript:;">next</a>
        </#if>

        </div>
</nav>
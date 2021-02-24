<div class="float-bar">
    <div class="float-item config-mode switch-theme-color">
        <svg class="icon dark" aria-hidden="true">
            <use xlink:href="#icon-zhuti"></use>
        </svg>
    </div>

    <div class="float-item config-mode toggle-dark-mode">
        <svg class="icon dark" aria-hidden="true">
            <use xlink:href="#icon-yueliang"></use>
        </svg>
        <svg class="icon light" aria-hidden="true">
            <use xlink:href="#icon-taiyang"></use>
        </svg>
    </div>
<#if is_post??>
    <div class="float-item float-bar-hide-xl toggle-sidebar">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-cebianlan"></use>
        </svg>
    </div>
</#if>
    <div class="float-item theme-config">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-shezhi"></use>
        </svg>
    </div>

    <div class="float-item" onclick="toTop()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-shang1"></use>
        </svg>
    </div>
</div>
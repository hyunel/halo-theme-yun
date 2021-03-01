<footer>
        <!-- 请尊重作者，请务必保留版权 -->
        <@global.footer />

        <div>
            <a href="https://github.com/halo-dev/halo" target="_blank">Proudly published with Halo！</a>
        </div>
        
        <div class="footer_text">
            © ${.now?string('yyyy')} ${user.nickname!}<#if settings.icp_beian??> | <a href="https://beian.miit.gov.cn/" target="_blank">${settings.icp_beian}</a></#if>
        </div>

</footer>
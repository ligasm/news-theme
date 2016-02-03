<#assign bContext = request.getServletContext().getAttribute("osgi-bundlecontext")>

<#assign ref = bContext.getServiceReference("com.liferay.journal.service.JournalArticleLocalService")>
<#assign JournalArticleLocalService = bContext.getService(ref)>

<#assign ref = bContext.getServiceReference("com.liferay.portlet.expando.service.ExpandoValueLocalService")>
<#assign ExpandoValueLocalService = bContext.getService(ref)>

<style type="text/css">
    .main-news-wrapper .thumbnail {
        position: relative;
        padding: 0px;
    }

    .main-news-wrapper .caption {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        color: whitesmoke !important;
        background-color: rgba(104, 104, 104, 0.75);
    }

    .main-news-wrapper .top-news-wrapper a {
        color: inherit;
        text-decoration: none;
    }
</style>


<#if entries?has_content>
<div class="main-news-wrapper">
    <#list entries as curEntry>
        <#assign article = JournalArticleLocalService.getLatestArticle(curEntry.getClassPK())>

        <#if article?has_content>
            <#assign value = ExpandoValueLocalService.getValue(entry.getCompanyId(), entry.getClassNameId(), "CUSTOM_FIELDS", "title-picture", article.getId())>
            <a href="${assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry, true)}">
                <div class="thumbnail text-center">
                    <img src="/documents/${article.getGroupId()}/0/-/${value.getString()}" alt="" class="img-responsive">
                    <div class="caption">
                        <h1>${curEntry.getTitle(locale)}</h1>
                        <h4>${curEntry.getSummary(locale)}</h4>
                    </div>
                </div>
            </a>

        </#if>

    </#list>
</div>
</#if>
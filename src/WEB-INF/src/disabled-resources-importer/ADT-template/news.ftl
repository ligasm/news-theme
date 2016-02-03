<#assign bContext = request.getServletContext().getAttribute("osgi-bundlecontext")>

<#assign ref = bContext.getServiceReference("com.liferay.journal.service.JournalArticleLocalService")>
<#assign JournalArticleLocalService = bContext.getService(ref)>

<#assign ref = bContext.getServiceReference("com.liferay.portlet.expando.service.ExpandoValueLocalService")>
<#assign ExpandoValueLocalService = bContext.getService(ref)>

<style type="text/css">
    .news-wrapper a {
        color: inherit;
        text-decoration: none;
    }
</style>

<#if entries?has_content>
<div class="news-wrapper">
    <#assign first = true >
    <#list entries as curEntry>

        <#assign article = JournalArticleLocalService.getLatestArticle(curEntry.getClassPK())>

        <#if article?has_content>

            <a href="${assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry, true)}">

                <div class="card-horizontal">
                    <div class="card-row">
                        <#if article.getArticleImageURL(themeDisplay)??>
                            <div class="card-col-5">
                                <img alt="thumbnail" class="img-responsive"
                                     src="${article.getArticleImageURL(themeDisplay)}">
                            </div>
                        </#if>

                        <div class="card-col-7 card-col-gutters">
                            <h4>${curEntry.getTitle(locale)}</h4>
                        </div>
                    </div>
                </div>

            </a>
        </#if>

    </#list>
</div>
</#if>
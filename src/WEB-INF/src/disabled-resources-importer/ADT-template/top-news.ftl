<#assign bContext = request.getServletContext().getAttribute("osgi-bundlecontext")>

<#assign ref = bContext.getServiceReference("com.liferay.journal.service.JournalArticleLocalService")>
<#assign JournalArticleLocalService = bContext.getService(ref)>

<#assign ref = bContext.getServiceReference("com.liferay.portlet.expando.service.ExpandoValueLocalService")>
<#assign ExpandoValueLocalService = bContext.getService(ref)>

<style type="text/css">
    .top-news-wrapper .thumbnail {
        position: relative;
        padding: 0px;
    }

    .top-news-wrapper .caption {
        width: 100%;
        color: whitesmoke !important;
        background-color: black;
    }

    .top-news-wrapper a {
        color: inherit;
        text-decoration: none;
    }
</style>

<#if entries?has_content>
<div class="top-news-wrapper">
    <#assign first = true >
    <#list entries as curEntry>

        <#assign article = JournalArticleLocalService.getLatestArticle(curEntry.getClassPK())>

        <#if article?has_content>

            <a href="${assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry, true)}">

                <#assign value = ExpandoValueLocalService.getValue(entry.getCompanyId(), entry.getClassNameId(), "CUSTOM_FIELDS", "title-picture", article.getId())>

                <#if first>
                    <div class="thumbnail text-center">
                        <img src="/documents/${article.getGroupId()}/0/-/${value.getString()}" alt="" class="img-responsive">
                        <div class="caption">
                            <h2>${curEntry.getTitle(locale)}</h2>
                        </div>
                    </div>
                    <#assign first = false >
                <#else>

                    <div class="card-horizontal">
                        <div class="card-row">
                            <#if article.getArticleImageURL(themeDisplay)??>
                                <div class="card-col-5">
                                    <img alt="thumbnail" class="img-responsive" src="${article.getArticleImageURL(themeDisplay)}">
                                </div>
                            </#if>

                            <div class="card-col-7 card-col-gutters">
                                <h4>${curEntry.getTitle(locale)}</h4>
                            </div>
                        </div>
                    </div>

                </#if>
            </a>
        </#if>

    </#list>
</div>
</#if>
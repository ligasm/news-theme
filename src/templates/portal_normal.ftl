<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class} nt" id="main-surface">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">

    <header id="banner" role="banner" class="row">
        <div id="heading" class="col-xs-8 col-sm-3 col-md-3">
            <h1 class="site-title">
                <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                    <img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
                </a>

                <#if show_site_name>
                    <span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                        ${site_name}
                    </span>
                </#if>
            </h1>
        </div>

        <div class="hidden-xs col-sm-7 col-md-8">
            <#if has_navigation && is_setup_complete>
                <#include "${full_templates_path}/navigation.ftl" />
            </#if>
        </div>

        <div class="main-controls col-xs-4 col-sm-2 col-md-1">
            <#if !is_signed_in>
                <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
                    <svg class="lexicon-icon">
                        <use xlink:href="$images_folder/lexicon/icons.svg#user"/>
                    </svg>
                </a>
            <#else>
                <a data-redirect="$is_login_redirect_required" href="${sign_out_url}" id="sign-in" rel="nofollow">
                    <svg class="lexicon-icon">
                        <use xlink:href="${images_folder}/lexicon/icons.svg#user"/>
                    </svg>
                </a>
            </#if>

            <a id="overlay-menu-on" href="javascript:void(0)">
                <svg class="lexicon-icon">
                    <use xlink:href="${images_folder}/lexicon/icons.svg#bars"/>
                </svg>
            </a>
        </div>

    </header>

    <div id="content" class="text-center">
    <#if selectable>
                <@liferay_util["include"] page=content_include />
            <#else>
    ${portletDisplay.recycle()}

    ${portletDisplay.setTitle(the_title)}

        <@liferay_theme["wrap-portlet"] page="portlet.ftl">
            <@liferay_util["include"] page=content_include />
        </@>
    </#if>
    </div>

    <footer id="footer" role="contentinfo">

        <div class="btn-row social">
            <span class="icon-3x icon-twitter-sign"></span>
            <span class="icon-3x icon-facebook-sign"></span>
            <span class="icon-3x icon-linkedin-sign"></span>
            <span class="icon-3x icon-google-plus-sign"></span>
        </div>
        <p class="powered-by text-muted">
            <@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
        </p>
    </footer>

</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<#include "${full_templates_path}/dummy-site-menu.ftl" />
</body>

</html>
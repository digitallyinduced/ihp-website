module Web.View.Layout (defaultLayout, fullWidthLayout, postLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()
import qualified Data.Text as Text

defaultLayout :: Html -> Html
defaultLayout inner = layoutWithMeta "default-layout" metaTags inner

-- | Same as defaultLayout but with a bigger container size
fullWidthLayout :: Html -> Html
fullWidthLayout inner = layoutWithMeta "fullwidth-layout" metaTags inner

postLayout :: Post -> Html -> Html
postLayout post inner = layoutWithMeta "" (postMetaTags post) inner

layoutWithMeta :: Text -> Html -> Html -> Html
layoutWithMeta bodyClass metaTags inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    <title>IHP: Integrated Haskell Platform, a batteries-included web framework built on purely functional programming technologies</title>

    <link rel="shortcut icon" type="image/x-icon" href="/ihp-logo.svg"/>

    {stylesheets}
    {scripts}
    
    <script>
    !function(w,d){if(!w.rdt){var p=w.rdt=function(){p.sendEvent?p.sendEvent.apply(p,arguments):p.callQueue.push(arguments)};p.callQueue=[];var t=d.createElement("script");t.src="https://www.redditstatic.com/ads/pixel.js",t.async=!0;var s=d.getElementsByTagName("script")[0];s.parentNode.insertBefore(t,s)}}(window,document);rdt('init','t2_5bziq6mz');rdt('track', 'PageVisit');
    </script>
</head>
<body class={classes ["d-flex flex-column min-vh-100", (bodyClass, True)]}>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="/"><img src="/ihp.svg" class="d-inline-block align-top" style="height: 2rem"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href={PostsAction}>News</a>
                <a class="nav-link" href={PartnersAction}>Partners</a>
                <a class="nav-link" href={ShowcaseAction}>Showcase</a>
                <a class="nav-link" href="https://ihp-community-events.mailchimpsites.com/" target="_blank">Events</a>
            </div>
            <div class="ml-auto navbar-nav">

                <span class="nav-link" id="github-navlink">
                    <a class="github-button" href="https://github.com/digitallyinduced/ihp" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" data-show-count="true" aria-label="Star digitallyinduced/ihp on GitHub">Star</a>
                </span>
                <a class="nav-link" href="https://github.com/digitallyinduced/ihp" target="_blank">GitHub</a>
                <a class="nav-link" href={SlackAction}>Slack</a>
                <a class="nav-link" href="https://twitter.com/digitallyinduce" target="_blank">Twitter</a>
                <a class="nav-link" href="https://www.youtube.com/playlist?list=PLenFm8BWuKlS0IaE31DmKB_PbkMLmwWmG" target="_blank">YouTube</a>
                <a class="nav-link" href="https://ihp.digitallyinduced.com/Guide/" target="_blank">Guide</a>
                <a class="nav-link" href={CommunityAction}>Community</a>
                <a class="nav-link" href="https://ihpcloud.com/" target="_blank">IHP Cloud</a>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        {renderFlashMessages}
        {inner}
    </div>

    <footer class="mt-auto" style="margin-top: 3rem; background-color: #073642; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1)">
        <div class="container" id="footer-nav">
            <a href="https://github.com/digitallyinduced/ihp">GitHub</a>
            <a href="/Guide/">Guide</a>
            <a href="/api-docs/">API</a>
            <a href="https://forum.ihpapp.com/">Forum</a>
            <a href="https://www.digitallyinduced.com/imprint.html">Imprint</a>

            <a href="https://www.digitallyinduced.com/">© 2021, digitally induced GmbH</a>
        </div>

        <div class="container" id="footer-about">
            <p>
                IHP was initially created at <a href="https://www.digitallyinduced.com/">digitally induced</a>. It's now improved and extended by <a href="https://github.com/digitallyinduced/ihp/graphs/contributors">a team of open source contributors</a>.
            </p>

            <a id="ihp-cloud-logo" href="https://ihpcloud.com/" target="_blank"><img src="https://ihpcloud.com/deployed-with-ihp-cloud-white.svg" alt="Deployed with IHP Cloud"></a>
        </div>
    </footer>

    <!-- Twitter universal website tag code -->
    <script>
    !function(e,t,n,s,u,a){e.twq||(s=e.twq=function(){s.exe?s.exe.apply(s,arguments):s.queue.push(arguments);
    },s.version='1.1',s.queue=[],u=t.createElement(n),u.async=!0,u.src='//static.ads-twitter.com/uwt.js',
    a=t.getElementsByTagName(n)[0],a.parentNode.insertBefore(u,a))}(window,document,'script');
    // Insert Twitter Pixel ID and Standard Event data below
    twq('init','o4x0m');
    twq('track','PageView');
    </script>
    <!-- End Twitter universal website tag code -->
</body>
|]

stylesheets :: Html
stylesheets = do
    when isDevelopment [hsx|
        <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when isProduction [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts :: Html
scripts = do
    when isDevelopment [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
    |]
    [hsx|<script async defer src="https://buttons.github.io/buttons.js"></script>|]
    when isProduction [hsx|
        <script src="/prod.js"></script>
    |]


metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta property="og:locale" content="en_EN" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="IHP is a modern batteries-included Web Framework, built on top of Haskell and Nix." />
    <meta property="og:description" content="IHP is a modern batteries-included Web Framework, built on top of Haskell and Nix." />
    <meta property="og:url" content="https://ihp.digitallyinduced.com/" />
    <meta property="og:site_name" content="IHP: Integrated Haskell Platform" />
    <meta name="author" content="digitally induced GmbH">
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:description" content="IHP is a modern batteries-included Web Framework, built on top of Haskell and Nix." />
    <meta name="twitter:title" content="IHP: Integrated Haskell Platform" />
    <meta name="twitter:site" content="@digitallyinduce" />
    <meta property="og:image" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="og:image:secure_url" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="twitter:image" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="og:image:width" content="1500" />
    <meta property="og:image:height" content="1500" />
|]

postMetaTags :: Post -> Html
postMetaTags post = [hsx|
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta property="og:locale" content="en_EN" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content={get #title post} />
    <meta property="og:description" content={get #body post |> stripTags |> Text.take 240} />
    <meta property="og:url" content="https://ihp.digitallyinduced.com/" />
    <meta property="og:site_name" content="IHP: Integrated Haskell Platform" />
    <meta name="author" content="digitally induced GmbH">
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:description" content={get #body post |> stripTags |> Text.take 240} />
    <meta name="twitter:title" content={get #title post} />
    <meta name="twitter:site" content="@digitallyinduce" />
    <meta property="og:image" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="og:image:secure_url" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="twitter:image" content="https://ihp.digitallyinduced.com/Guide/images/first-project/code_gen_3_posts.png" />
    <meta property="og:image:width" content="1500" />
    <meta property="og:image:height" content="1500" />
|]

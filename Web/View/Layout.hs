module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()

type Html = HtmlWithContext ViewContext

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    <title>IHP: Integrated Haskell Platform, a batteries-included web framework built on purely functional programming technologies</title>

    <link rel="shortcut icon" type="image/x-icon" href="/ihp-logo.svg"/>

    {stylesheets}
    {scripts}
</head>
<body>
    {renderFlashMessages}
    {inner}

    <footer style="margin-top: 3rem; background-color: #073642; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1)">
        <div class="container">
            <a href="https://github.com/digitallyinduced/ihp">GitHub</a>
            <a href="/Guide/">Guide</a>
            <a href="/api-docs/">API</a>
            <a href="https://ihp-forum.digitallyinduced.com/">Forum</a>
            <a href="https://www.digitallyinduced.com/imprint.html">Imprint</a>

            <a href="https://www.digitallyinduced.com/">© 2020, digitally induced GmbH</a>
        </div>
    </footer>
</body>
|]

stylesheets = do
    when (isDevelopment FrameworkConfig.environment) [hsx|
        <link rel="stylesheet" href="/normalize.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when (isProduction FrameworkConfig.environment) [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts = do
    when (isDevelopment FrameworkConfig.environment) [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
    |]
    when (isProduction FrameworkConfig.environment) [hsx|
        <script src="/prod.js"></script>
    |]


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

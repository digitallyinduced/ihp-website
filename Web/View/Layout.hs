module Web.View.Layout (defaultLayout, postLayout, Html) where

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
defaultLayout inner = layoutWithMeta metaTags inner

postLayout :: Post -> Html -> Html
postLayout post inner = layoutWithMeta (postMetaTags post) inner

layoutWithMeta :: Html -> Html -> Html
layoutWithMeta metaTags inner = H.docTypeHtml ! A.lang "en" $ [hsx|
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
<body class="d-flex flex-column min-vh-100">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="/">IHP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav" id="right-navigation">
                    <a class="nav-link" href="https://github.com/digitallyinduced/ihp" target="_blank" id="nav-platform" data-show="navigation-dropdown-platform">Platform</a>
                    <a class="nav-link" href="https://github.com/digitallyinduced/ihp" target="_blank" id="nav-platform" data-show="navigation-dropdown-develop">Develop</a>
                    <a class="nav-link" href="https://github.com/digitallyinduced/ihp" target="_blank" id="nav-platform" data-show="navigation-dropdown-community">Community</a>
                    <a class="nav-link" href="https://github.com/digitallyinduced/ihp" target="_blank" id="nav-platform">Company</a>
                </div>
            </div>
        </nav>
    </div>

    <div class="container navigation-dropdown-container">
        <div class="navigation-dropdown">
            <div class="m-4" id="navigation-dropdown-platform">
                <div class="row">
                    <div class="col">
                        <h2>OPEN SOURCE</h2>

                        <a class="product" href="https://github.com/digitallyinduced/ihp">
                            <div class="product-icon">
                                <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1254 581l293-293-107-107-293 293zm447-293q0 27-18 45l-1286 1286q-18 18-45 18t-45-18l-198-198q-18-18-18-45t18-45l1286-1286q18-18 45-18t45 18l198 198q18 18 18 45zm-1351-190l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm350 162l196 60-196 60-60 196-60-196-196-60 196-60 60-196zm930 478l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm-640-640l98 30-98 30-30 98-30-98-98-30 98-30 30-98z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">IHP</div>
                                <div class="product-description">Web Framework</div>
                            </div>
                        </a>
                    </div>

                    <div class="col">
                        <h2>ECOSYSTEM</h2>
                        <a class="product" href="https://ihpcloud.com/">
                            <div class="product-icon">
                                <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M896 128q209 0 385.5 103t279.5 279.5 103 385.5-103 385.5-279.5 279.5-385.5 103-385.5-103-279.5-279.5-103-385.5 103-385.5 279.5-279.5 385.5-103zm274 521q-2 1-9.5 9.5t-13.5 9.5q2 0 4.5-5t5-11 3.5-7q6-7 22-15 14-6 52-12 34-8 51 11-2-2 9.5-13t14.5-12q3-2 15-4.5t15-7.5l2-22q-12 1-17.5-7t-6.5-21q0 2-6 8 0-7-4.5-8t-11.5 1-9 1q-10-3-15-7.5t-8-16.5-4-15q-2-5-9.5-11t-9.5-10q-1-2-2.5-5.5t-3-6.5-4-5.5-5.5-2.5-7 5-7.5 10-4.5 5q-3-2-6-1.5t-4.5 1-4.5 3-5 3.5q-3 2-8.5 3t-8.5 2q15-5-1-11-10-4-16-3 9-4 7.5-12t-8.5-14h5q-1-4-8.5-8.5t-17.5-8.5-13-6q-8-5-34-9.5t-33-.5q-5 6-4.5 10.5t4 14 3.5 12.5q1 6-5.5 13t-6.5 12q0 7 14 15.5t10 21.5q-3 8-16 16t-16 12q-5 8-1.5 18.5t10.5 16.5q2 2 1.5 4t-3.5 4.5-5.5 4-6.5 3.5l-3 2q-11 5-20.5-6t-13.5-26q-7-25-16-30-23-8-29 1-5-13-41-26-25-9-58-4 6-1 0-15-7-15-19-12 3-6 4-17.5t1-13.5q3-13 12-23 1-1 7-8.5t9.5-13.5.5-6q35 4 50-11 5-5 11.5-17t10.5-17q9-6 14-5.5t14.5 5.5 14.5 5q14 1 15.5-11t-7.5-20q12 1 3-17-4-7-8-9-12-4-27 5-8 4 2 8-1-1-9.5 10.5t-16.5 17.5-16-5q-1-1-5.5-13.5t-9.5-13.5q-8 0-16 15 3-8-11-15t-24-8q19-12-8-27-7-4-20.5-5t-19.5 4q-5 7-5.5 11.5t5 8 10.5 5.5 11.5 4 8.5 3q14 10 8 14-2 1-8.5 3.5t-11.5 4.5-6 4q-3 4 0 14t-2 14q-5-5-9-17.5t-7-16.5q7 9-25 6l-10-1q-4 0-16 2t-20.5 1-13.5-8q-4-8 0-20 1-4 4-2-4-3-11-9.5t-10-8.5q-46 15-94 41 6 1 12-1 5-2 13-6.5t10-5.5q34-14 42-7l5-5q14 16 20 25-7-4-30-1-20 6-22 12 7 12 5 18-4-3-11.5-10t-14.5-11-15-5q-16 0-22 1-146 80-235 222 7 7 12 8 4 1 5 9t2.5 11 11.5-3q9 8 3 19 1-1 44 27 19 17 21 21 3 11-10 18-1-2-9-9t-9-4q-3 5 .5 18.5t10.5 12.5q-7 0-9.5 16t-2.5 35.5-1 23.5l2 1q-3 12 5.5 34.5t21.5 19.5q-13 3 20 43 6 8 8 9 3 2 12 7.5t15 10 10 10.5q4 5 10 22.5t14 23.5q-2 6 9.5 20t10.5 23q-1 0-2.5 1t-2.5 1q3 7 15.5 14t15.5 13q1 3 2 10t3 11 8 2q2-20-24-62-15-25-17-29-3-5-5.5-15.5t-4.5-14.5q2 0 6 1.5t8.5 3.5 7.5 4 2 3q-3 7 2 17.5t12 18.5 17 19 12 13q6 6 14 19.5t0 13.5q9 0 20 10.5t17 19.5q5 8 8 26t5 24q2 7 8.5 13.5t12.5 9.5l16 8 13 7q5 2 18.5 10.5t21.5 11.5q10 4 16 4t14.5-2.5 13.5-3.5q15-2 29 15t21 21q36 19 55 11-2 1 .5 7.5t8 15.5 9 14.5 5.5 8.5q5 6 18 15t18 15q6-4 7-9-3 8 7 20t18 10q14-3 14-32-31 15-49-18 0-1-2.5-5.5t-4-8.5-2.5-8.5 0-7.5 5-3q9 0 10-3.5t-2-12.5-4-13q-1-8-11-20t-12-15q-5 9-16 8t-16-9q0 1-1.5 5.5t-1.5 6.5q-13 0-15-1 1-3 2.5-17.5t3.5-22.5q1-4 5.5-12t7.5-14.5 4-12.5-4.5-9.5-17.5-2.5q-19 1-26 20-1 3-3 10.5t-5 11.5-9 7q-7 3-24 2t-24-5q-13-8-22.5-29t-9.5-37q0-10 2.5-26.5t3-25-5.5-24.5q3-2 9-9.5t10-10.5q2-1 4.5-1.5t4.5 0 4-1.5 3-6q-1-1-4-3-3-3-4-3 7 3 28.5-1.5t27.5 1.5q15 11 22-2 0-1-2.5-9.5t-.5-13.5q5 27 29 9 3 3 15.5 5t17.5 5q3 2 7 5.5t5.5 4.5 5-.5 8.5-6.5q10 14 12 24 11 40 19 44 7 3 11 2t4.5-9.5 0-14-1.5-12.5l-1-8v-18l-1-8q-15-3-18.5-12t1.5-18.5 15-18.5q1-1 8-3.5t15.5-6.5 12.5-8q21-19 15-35 7 0 11-9-1 0-5-3t-7.5-5-4.5-2q9-5 2-16 5-3 7.5-11t7.5-10q9 12 21 2 8-8 1-16 5-7 20.5-10.5t18.5-9.5q7 2 8-2t1-12 3-12q4-5 15-9t13-5l17-11q3-4 0-4 18 2 31-11 10-11-6-20 3-6-3-9.5t-15-5.5q3-1 11.5-.5t10.5-1.5q15-10-7-16-17-5-43 12zm-163 877q206-36 351-189-3-3-12.5-4.5t-12.5-3.5q-18-7-24-8 1-7-2.5-13t-8-9-12.5-8-11-7q-2-2-7-6t-7-5.5-7.5-4.5-8.5-2-10 1l-3 1q-3 1-5.5 2.5t-5.5 3-4 3 0 2.5q-21-17-36-22-5-1-11-5.5t-10.5-7-10-1.5-11.5 7q-5 5-6 15t-2 13q-7-5 0-17.5t2-18.5q-3-6-10.5-4.5t-12 4.5-11.5 8.5-9 6.5-8.5 5.5-8.5 7.5q-3 4-6 12t-5 11q-2-4-11.5-6.5t-9.5-5.5q2 10 4 35t5 38q7 31-12 48-27 25-29 40-4 22 12 26 0 7-8 20.5t-7 21.5q0 6 2 16z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">IHP Cloud</div>
                                <div class="product-description">Serverless Hosting</div>
                            </div>
                        </a>
                        <a class="product" href="https://ihpcasts.com/">
                            <div class="product-icon">
                                <svg viewBox="0 0 2304 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1774 836l18 316q4 69-82 128t-235 93.5-323 34.5-323-34.5-235-93.5-82-128l18-316 574 181q22 7 48 7t48-7zm530-324q0 23-22 31l-1120 352q-4 1-10 1t-10-1l-652-206q-43 34-71 111.5t-34 178.5q63 36 63 109 0 69-58 107l58 433q2 14-8 25-9 11-24 11h-192q-15 0-24-11-10-11-8-25l58-433q-58-38-58-107 0-73 65-111 11-207 98-330l-333-104q-22-8-22-31t22-31l1120-352q4-1 10-1t10 1l1120 352q22 8 22 31z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">IHP Casts</div>
                                <div class="product-description">Learn Haskell & IHP</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="m-4" id="navigation-dropdown-develop">

                <a class="product" href="https://ihp.digitallyinduced.com/Guide/index.html" target="_blank">
                    <div class="product-icon">
                        <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1703 478q40 57 18 129l-275 906q-19 64-76.5 107.5t-122.5 43.5h-923q-77 0-148.5-53.5t-99.5-131.5q-24-67-2-127 0-4 3-27t4-37q1-8-3-21.5t-3-19.5q2-11 8-21t16.5-23.5 16.5-23.5q23-38 45-91.5t30-91.5q3-10 .5-30t-.5-28q3-11 17-28t17-23q21-36 42-92t25-90q1-9-2.5-32t.5-28q4-13 22-30.5t22-22.5q19-26 42.5-84.5t27.5-96.5q1-8-3-25.5t-2-26.5q2-8 9-18t18-23 17-21q8-12 16.5-30.5t15-35 16-36 19.5-32 26.5-23.5 36-11.5 47.5 5.5l-1 3q38-9 51-9h761q74 0 114 56t18 130l-274 906q-36 119-71.5 153.5t-128.5 34.5h-869q-27 0-38 15-11 16-1 43 24 70 144 70h923q29 0 56-15.5t35-41.5l300-987q7-22 5-57 38 15 59 43zm-1064 2q-4 13 2 22.5t20 9.5h608q13 0 25.5-9.5t16.5-22.5l21-64q4-13-2-22.5t-20-9.5h-608q-13 0-25.5 9.5t-16.5 22.5zm-83 256q-4 13 2 22.5t20 9.5h608q13 0 25.5-9.5t16.5-22.5l21-64q4-13-2-22.5t-20-9.5h-608q-13 0-25.5 9.5t-16.5 22.5z" fill="currentColor"/></svg>
                    </div>
                    <div>
                        <div class="product-name">Documentation</div>
                        <div class="product-description">Start building web apps with IHP</div>
                    </div>
                </a>

                <div class="docu-more-links">
                    <div class="row">
                        <div class="col">
                            <h3>Start</h3>
                            <a href="https://ihp.digitallyinduced.com/Guide/installation.html" target="_blank">Installing IHP</a>
                            <a href="https://ihp.digitallyinduced.com/Guide/your-first-project.html" target="_blank">Your First Project</a>
                            <a href="https://ihpcasts.com/" target="_blank">IHP Casts</a>
                            
                        </div>

                        <div class="col">
                            <h3>Advanced</h3>
                            <a href="#">Troubleshooting</a>
                            <a href="#">Recipes</a>
                            <a href="#">API Reference</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="m-4" id="navigation-dropdown-community">

                <div class="row">
                    <div class="col">
                        <a class="product" href="https://join.slack.com/t/ihpframework/shared_invite/zt-js1xo46t-4MdSvMQVoLYvxRz8rvGYig" target="_blank">
                            <div class="product-icon">
                                <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1254 581l293-293-107-107-293 293zm447-293q0 27-18 45l-1286 1286q-18 18-45 18t-45-18l-198-198q-18-18-18-45t18-45l1286-1286q18-18 45-18t45 18l198 198q18 18 18 45zm-1351-190l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm350 162l196 60-196 60-60 196-60-196-196-60 196-60 60-196zm930 478l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm-640-640l98 30-98 30-30 98-30-98-98-30 98-30 30-98z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">Slack</div>
                                <div class="product-description">Find help with IHP related topics, or just discuss things about coding with like minded people</div>
                            </div>
                        </a>

                        <a class="product" href="https://gitter.im/digitallyinduced/ihp?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge" target="_blank">
                            <div class="product-icon">
                                <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1254 581l293-293-107-107-293 293zm447-293q0 27-18 45l-1286 1286q-18 18-45 18t-45-18l-198-198q-18-18-18-45t18-45l1286-1286q18-18 45-18t45 18l198 198q18 18 18 45zm-1351-190l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm350 162l196 60-196 60-60 196-60-196-196-60 196-60 60-196zm930 478l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm-640-640l98 30-98 30-30 98-30-98-98-30 98-30 30-98z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">Gitter</div>
                                <div class="product-description">Quickly find help for your IHP and haskell questions</div>
                            </div>
                        </a>

                        <a class="product" href="https://stackoverflow.com/questions/tagged/ihp" target="_blank">
                            <div class="product-icon">
                                <svg viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1254 581l293-293-107-107-293 293zm447-293q0 27-18 45l-1286 1286q-18 18-45 18t-45-18l-198-198q-18-18-18-45t18-45l1286-1286q18-18 45-18t45 18l198 198q18 18 18 45zm-1351-190l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm350 162l196 60-196 60-60 196-60-196-196-60 196-60 60-196zm930 478l98 30-98 30-30 98-30-98-98-30 98-30 30-98zm-640-640l98 30-98 30-30 98-30-98-98-30 98-30 30-98z" fill="currentColor"/></svg>
                            </div>
                            <div>
                                <div class="product-name">StackOverflow</div>
                                <div class="product-description">Questions, or need help with haskell type errors? You can find help for IHP errors on StackOverflow by using the <q>ihp</q> tag.</div>
                            </div>
                        </a>


                    </div>
                </div>


                <div class="mt-3">
                    <a class="community" href="https://twitter.com/digitallyinduce">Twitter</a>
                    <a class="community" href="https://www.reddit.com/r/IHPFramework/">GitHub</a>
                    <a class="community" href="https://www.youtube.com/playlist?list=PLenFm8BWuKlS0IaE31DmKB_PbkMLmwWmG">YouTube</a>
                    <a class="community" href="https://forum.ihpapp.com/">IHP Forum</a>
                    <a class="community" href="https://www.reddit.com/r/IHPFramework/">Reddit</a>
                </div>
            </div>


        </div>
    </div>

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

            <a href="https://www.digitallyinduced.com/">© 2020, digitally induced GmbH</a>
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
        <script src="/navigation.js"></script>
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

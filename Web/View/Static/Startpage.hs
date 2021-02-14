module Web.View.Static.Startpage where
import Web.View.Prelude

data StartpageView = StartpageView

instance View StartpageView where
    html StartpageView = [hsx|
<div id="startpage">
    <div class="mb-5">
        <p>
            <img src="/ihp.svg" style="height: 4rem"/>
        </p>
        <h1>The fastest way to build <br/> type safe web apps 🔥</h1>
        <p class="lead">
            IHP is a new batteries-included web framework optimized for longterm productivity and programmer happiness.
        </p>

        <p class="lead">
            With IHP all your application code is written in Haskell - a functional programming with an incredible type system, used by giants such as <a href="https://github.com/github/semantic" target="_blank">GitHub</a> and <a href="https://engineering.fb.com/security/fighting-spam-with-haskell/" target="_blank">Facebook</a>.
        </p>

        <p class="lead">
            Thanks to Haskell's impressive type system you can write code that is far more robust than you have seen before. 
        </p>

        <p class="lead text-muted">
            <small>(Don't worry, you don't need to know much about Haskell to get started, you'll learn it along the way)</small>
        </p>
    </div>

    <div class="my-5">
        <h2 class="mb-4">Watch the Demo-Video:</h2>
        <iframe id="demo-video" width="100%" height="400" src="https://www.youtube.com/embed/UbDtS_mUMpI"></iframe>
    </div>

    <p class="my-5">
        <a class="btn btn-primary btn-lg mr-3" href="/Guide/" role="button">Get Started with IHP Now</a>
    </p>

    <hr/>

    {mailchimpSignup}

    <hr/>


    <div class="mb-5">
        <h5>IHP is right for you if:</h5>
        <ul>
            <li>you believe software engineering should be fun</li>
            <li>you think the future is in type-safety and functional programming</li>
            <li>you want clear and beautiful documentation with lot's of code examples</li>
            <li>you want a vibrant and friendly community of other developers</li>
        </ul>
    </div>

    <blockquote class="blockquote">
        <q>IHP is the best web framework experience I have had.</q>
        <footer class="blockquote-footer">Henry Lambert</footer>
    </blockquote>


    <blockquote class="blockquote">
        <q>IHP is ridiculously good. I hope it makes Haskell a bigger part of the web dev industry because wow</q>
        <footer class="blockquote-footer">James Foster</footer>
    </blockquote>

    <blockquote class="blockquote">
        <q>I have been learning Haskell through IHP. It's the best and actually simplest web framework I have ever tried. The developer experience is the best I ever had for a MVC-style framework. And I got to learn Haskell without banging my head too much against the wall. Really enjoyed it :)</q>
        <footer class="blockquote-footer">Lars Lillo Ulvestad</footer>
    </blockquote>


    <blockquote class="blockquote">
        <q>I think in Open Source projects two things are important among other: community and documentation. I found them in IHP.</q>
        <footer class="blockquote-footer">Max Bertinetti</footer>
    </blockquote>

    <a class="text-muted" href={QuotesAction}>See More Quotes</a>



    <h2 class="my-5">Features:</h2>

    <div class="container">
        <div>



            <ul class="features">
                <li>
                    <strong>Instant Live Reloading:</strong>

                    <p>While haskell is a compiled language, the built-in dev server automatically reloads your code changes using the fastest way possible. Changes are reflected instantly. Just like good old PHP.</p>

                    <p>
                        <img class="w-100" style="border-radius: 4px" src="https://github.com/digitallyinduced/ihp/raw/master/Guide/images/IHP%20Live%20Reloading%20Demo.gif?raw=true"/>
                    </p>
                </li>


                <li>
                    <strong>HSX:</strong>

                    <p>Like React's JSX. Write html code in your haskell files. This will be transformed to actual type-checked haskell code at compile time.</p>

                    <p>
                        <img src="img/hsx-example.png" style="width: 75%; border-radius: 4px; padding: 1rem; background-color: #002b36;"/>
                    </p>
                </li>

                <li>
                    <strong>Accessible:</strong>

                    <p>Setup of the fully-managed dev environment takes just 5 minutes. All  dependencies (even database and compiler) are managed using the nix package manager. This means dependency problems just cannot occur anymore. Also everything is guaranteed to be same for all developers in your team.</p>
                </li>

                <li>
                    <strong>Productive & Fun:</strong>

                    <p>IHP comes with everything you need to build great web applications out of the box. Combined with the unique mix of technologies and a fast development process, IHP makes it very pleasant to build applications.</p>
                </li>

                <li>
                    <strong>Type-safe and reliable:</strong>

                    <p>With Haskell and Nix we use the most reliable technologies available, to make sure your application will never crash because of Null Pointer Exceptions.</p>

                    <p>If you like TypeScript, you will love IHP.</p>
                </li>





                <li>
                    <strong>No Haskell Experience required:</strong>

                    <p>Code Generators will help you to quickly build things even when you have no professional haskell experience yet. Pick up haskell by building real world applications.</p>

                </li>

                <li>
                    <strong>Productive Dev Tooling:</strong>

                    <p>
                        To speed up your development process, IHP comes with a full set of web
                        based dev tools. Including: a database schema designer, 
                        a web-based code generator, a web-based repl, ...
                    </p>


                    <p>
                        <img src="https://ihp.digitallyinduced.com/Guide/images/first-project/first_table.png" style="width: 100%" />
                    </p>

                </li>

                <li>
                    <strong>Major Operating Systems Supported:</strong>

                    <p>Windows (via Linux Subsystem), macOS, NixOS, Debian, Ubuntu</p>
                </li>
            </ul>


        </div>

        
        <div class="featured-showcase py-5">
            <h1>Built with IHP:</h1>
            <p class="mb-5 lead">
                The IHP community is a community full of digital builders and makers. Here are some awesome projects made with IHP:
            </p>

            <div class="showcase-project">
                <div class="description">
                    <h2 class="name">attics.io</h2>
                    <p>
                        Attics is a fast, simple, and reliable app that lets you stream and download thousands of live Grateful Dead, Dead & Company, JRAD, Tedeschi Trucks Band, and many more concert recordings hosted on the Internet Archive's Live Music Archive. The app has over 10,000 downloads on the app store.
                    </p>
                    <p>
                        <a href="https://attics.io/" target="_blank" class="btn btn-primary">Open attics.io</a>
                    </p>
                </div>
                <img src="/showcase/attics.png" alt="attics.io"/>
            </div>


            <div class="showcase-project">
                <div class="description">
                    <h2 class="name">Dill - Vegan Product Finder</h2>
                    <p>
                        Scan products and make better choices. Scan a barcode and find out if a product is vegan or not. An active community collaborates to make sure products are as updated as possible.
                    </p>
                    <p>
                        <a href="https://dill.network/" target="_blank" class="btn btn-primary">Open dill.network</a>
                    </p>
                </div>
                <img src="/showcase/dill.png" alt="dill.network"/>
            </div>

            <div class="text-center">
                <a href={ShowcaseAction}>View more projects built with IHP</a>
            </div>

        </div>


        <p class="my-5">
            <a class="btn btn-primary btn-lg mr-3" href="/Guide/" role="button">Get Started with IHP Now</a>

            {mailchimpSignup}
        </p>


    </div>

</div>
    |]


mailchimpSignup :: Html
mailchimpSignup = [hsx|
<div class="py-5">
    <h1 class="mb-4 text-center">Subscribe to the IHP Newsletter</h1>
    <p class="text-center lead">Be the first to hear about great new stuff from us! 🔥</p>
    <form action="https://digitallyinduced.us10.list-manage.com/subscribe/post?u=03763c34fa6aaa4c52edfe6ce&amp;id=a09e22a2d3" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
        <div class="d-flex mx-auto" style="max-width: 400px">
            <input type="email" value="" name="EMAIL" class="form-control form-control-lg" id="mce-EMAIL" placeholder="Enter your email address" required autocomplete="email">


            <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
            <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_03763c34fa6aaa4c52edfe6ce_a09e22a2d3" tabindex="-1" value=""></div>
            <div>
                <input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="btn btn-primary btn-lg">
            </div>
        </div>
    </form>
</div>
|]
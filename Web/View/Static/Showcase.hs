module Web.View.Static.Showcase where
import Web.View.Prelude

data ShowcaseView = ShowcaseView

instance View ShowcaseView where
    beforeRender _ = do
        setLayout fullWidthLayout

    html ShowcaseView = [hsx|
        <div id="showcase">
            <h1>Built with IHP</h1>

            <p class="mb-5">
                The IHP community is a community full of digital builders and makers. Here are some awesome projects made with IHP:
            </p>

            <div class="grid">
                <div class="project">
                    <img src="/showcase/mrdusseldorfwallet.jpeg" alt="Mr. Düsseldorf Wallet"/>
                    <div class="description">
                        <h2 class="name">Mr. Düsseldorf Digital Wallet Card</h2>
                        <p>
                            An Apple Wallet bonus card system with location-based push notifications, e.g. when you walk by a near a partner shop, it gives you special offers.
                        </p>
                        <p>
                            <a href="https://www.mrduesseldorf.de/ueber-die-karte/" target="_blank">Open Mr. Düsseldorf Card</a>
                        </p>
                    </div>
                </div>
                
                <div class="project">
                    <img src="/showcase/attics.png" alt="attics.io"/>
                    <div class="description">
                        <h2 class="name">attics.io</h2>
                        <p>
                            Attics is a fast, simple, and reliable app that lets you stream and download thousands of live Grateful Dead, Dead & Company, JRAD, Tedeschi Trucks Band, and many more concert recordings hosted on the Internet Archive's Live Music Archive. The app has over 10,000 downloads on the app store.
                        </p>
                        <p>
                            <a href="https://attics.io/" target="_blank">Open attics.io</a>
                        </p>
                    </div>
                    
                </div>


                <div class="project">
                    <img src="/showcase/dill.png" alt="dill.network"/>
                    <div class="description">
                        <h2 class="name">Dill - Vegan Product Finder</h2>
                        <p>
                            Scan products and make better choices. Scan a barcode and find out if a product is vegan or not. An active community collaborates to make sure products are as updated as possible.
                        </p>
                        <p>
                            <a href="https://dill.network/" target="_blank">Open dill.network</a>
                        </p>
                    </div>
                </div>

                <div class="project">
                    <img src="/showcase/focusreader.png" alt="Focus Reader"/>
                    <div class="description">
                        <h2 class="name">Focus Reader</h2>
                        <p>
                            A Twitter reader client that shows you one tweet at a time, and remembers where you left off so you never miss a tweet!
                        </p>
                        <p>
                            <a href="https://focusreader.ihpapp.com/" target="_blank">Open Focus Reader</a>
                        </p>
                    </div>
                </div>

                <div class="project">
                    <img src="/showcase/fidelio.png" alt="Fidelio"/>
                    <div class="description">
                        <h2 class="name">Fidelio</h2>
                        <p>
                            Don't send a password or other form of sensitive information to someone over IM or email. These methods are not secure as anyone with little knowledge can intercept this information during transmission. Using Fidelio you can encrypt your secrets and generate self-destructing links which can be safely transferred to your recipient.
                        </p>
                        <p>
                            <a href="https://fidelio.ihpapp.com/" target="_blank">Open Fidelio</a>
                        </p>
                    </div>
                </div>


            </div>
        </div>
    |]


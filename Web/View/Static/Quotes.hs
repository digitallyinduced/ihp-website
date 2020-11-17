module Web.View.Static.Quotes where
import Web.View.Prelude

data QuotesView = QuotesView

instance View QuotesView where
    html QuotesView = [hsx|
        <div id="quotes">
            <h1>Quotes</h1>
            <p>What people are saying about IHP.</p>

            <a class="quote-link" target="_blank" href="https://twitter.com/smdiehl/status/1275343470962651142"><img src="img/quotes/quote-1.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/willricketts/status/1298969263638638592"><img src="img/quotes/quote-6.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/ratherforky/status/1303804712651812864"><img src="img/quotes/quote-7.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/larsparsfromage/status/1297578999607164928"><img src="img/quotes/quote-10.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/yeongsheng/status/1287958308016410625"><img src="img/quotes/quote-11.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/luctielen/status/1275363481907322880"><img src="img/quotes/quote-4.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/evertedsphere/status/1275398188736757760"><img src="img/quotes/quote-5.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://lobste.rs/s/8pieht/ihp_modern_batteries_included_web#c_6lroyn"><img src="img/quotes/quote-9.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/martinmcwhorter/status/1284063627725725696"><img src="img/quotes/quote-12.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/dmlvianna/status/1277212534416658433"><img src="img/quotes/quote-13.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/mattoflambda/status/1275469470559907840"><img src="img/quotes/quote-2.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/TechnoEmpress/status/1275369320063909888"><img src="img/quotes/quote-3.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://news.ycombinator.com/item?id=23613486"><img src="img/quotes/quote-8.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/avi_press/status/1276203673207504896"><img src="img/quotes/quote-14.png" class="quote"></a>
            <a class="quote-link" target="_blank" href="https://twitter.com/larsparsfromage/status/1298710944516698114"><img src="img/quotes/quote-15.png" class="quote"></a>
        </div>
    |]


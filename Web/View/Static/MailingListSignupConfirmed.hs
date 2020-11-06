module Web.View.Static.MailingListSignupConfirmed where
import Web.View.Prelude

data MailingListSignupConfirmedView = MailingListSignupConfirmedView

instance View MailingListSignupConfirmedView ViewContext where
    html MailingListSignupConfirmedView = [hsx|
        <div id="quotes">
            <h1>Thanks for signing up!</h1>

            <p>
                Check out the IHP Guide to get started right away!
            </p>

            <a href="/Guide/" class="btn btn-primary">Open Guide</a>
        </div>

        <!-- Twitter single-event website tag code -->
        <script src="//platform.twitter.com/oct.js" type="text/javascript"></script>
        <script type="text/javascript">twttr.conversion.trackPid('o4x0t', { tw_sale_amount: 0, tw_order_quantity: 0 });</script>
        <noscript>
        <img height="1" width="1" style="display:none;" alt="" src="https://analytics.twitter.com/i/adsct?txn_id=o4x0t&p_id=Twitter&tw_sale_amount=0&tw_order_quantity=0" />
        <img height="1" width="1" style="display:none;" alt="" src="//t.co/i/adsct?txn_id=o4x0t&p_id=Twitter&tw_sale_amount=0&tw_order_quantity=0" />
        </noscript>
        <!-- End Twitter single-event website tag code -->

        <script>rdt('track', 'SignUp')</script>
    |]


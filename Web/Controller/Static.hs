module Web.Controller.Static where

import Web.Controller.Prelude
import Web.View.Static.Startpage
import Web.View.Static.Community
import Web.View.Static.Quotes
import Web.View.Static.MailingListSignupConfirmed
import Web.View.Static.Partners

instance Controller StaticController where
    action StartpageAction = render StartpageView
    action CommunityAction = render CommunityView
    action QuotesAction = render QuotesView
    action MailingListSignupConfirmedAction = render MailingListSignupConfirmedView
    action PartnersAction = render PartnersView
    action SlackAction = do
        -- This slack link expires every 30 days. To avoid updating 20 links everywhere we have this
        -- central endpoint at http://ihp.digitallyinduced.com/Slack that just redirects to the current
        -- active slack invite url.
        redirectToUrl "https://join.slack.com/t/ihpframework/shared_invite/zt-kswhw782-NEzDDVJsAEkQK7UXCFfp4w"

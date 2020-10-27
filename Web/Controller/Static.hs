module Web.Controller.Static where

import Web.Controller.Prelude
import Web.View.Static.Startpage
import Web.View.Static.Community
import Web.View.Static.Quotes

instance Controller StaticController where
    action StartpageAction = render StartpageView
    action CommunityAction = render CommunityView
    action QuotesAction = render QuotesView

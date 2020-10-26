module Web.Controller.Static where

import Web.Controller.Prelude
import Web.View.Static.Startpage

instance Controller StaticController where
    action StartpageAction = do
        render StartpageView

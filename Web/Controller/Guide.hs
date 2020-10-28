module Web.Controller.Guide where

import Web.Controller.Prelude
import Config

instance Controller GuideController where
    action GuideAction = redirectToPath "/Guide/index.html"

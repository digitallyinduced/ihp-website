module Web.FrontController where
import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Posts
import Web.Controller.Static
import Web.Controller.Guide
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage StartpageAction
        -- Generator Marker
        , parseRoute @PostsController
        , parseRoute @StaticController
        , parseRoute @GuideController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
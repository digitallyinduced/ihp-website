module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Posts
import Web.Controller.Static
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage StartpageAction
        -- Generator Marker
        , parseRoute @PostsController
        , parseRoute @StaticController
        ]

instance InitControllerContext WebApplication

module Admin.FrontController where

import IHP.RouterPrelude
import Admin.Controller.Prelude
import Admin.View.Layout (defaultLayout)
import IHP.LoginSupport.Middleware
import Admin.Controller.Sessions

-- Controller Imports
import Admin.Controller.Admins
import Admin.Controller.Posts

instance FrontController AdminApplication where
    controllers = 
        [ parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @AdminsController
        , parseRoute @PostsController
        ]

instance InitControllerContext AdminApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @Admin
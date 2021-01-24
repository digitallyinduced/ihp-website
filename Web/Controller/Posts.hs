module Web.Controller.Posts where

import Web.Controller.Prelude
import Web.View.Posts.Index
import Web.View.Posts.Show
import Config
import qualified IHP.FrameworkConfig as Config
import qualified IHP.Environment as Config

instance Controller PostsController where
    action PostsAction = do
        posts <- query @Post
            |> orderByDesc #createdAt
            |> fetch
        render IndexView { .. }
    
    action ShowPostAction { postId } = do
        post <- fetch postId
        render ShowView { .. }

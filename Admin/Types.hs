module Admin.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

data AdminApplication = AdminApplication deriving (Eq, Show)

instance HasNewSessionUrl Admin where
    newSessionUrl _ = "/admin/NewSession"

type instance CurrentAdminRecord = Admin

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)
data PostsController
    = PostsAction
    | NewPostAction
    | ShowPostAction { postId :: !(Id Post) }
    | CreatePostAction
    | EditPostAction { postId :: !(Id Post) }
    | UpdatePostAction { postId :: !(Id Post) }
    | DeletePostAction { postId :: !(Id Post) }
    deriving (Eq, Show, Data)

data AdminsController
    = AdminsAction
    | NewAdminAction
    | ShowAdminAction { adminId :: !(Id Admin) }
    | CreateAdminAction
    | EditAdminAction { adminId :: !(Id Admin) }
    | UpdateAdminAction { adminId :: !(Id Admin) }
    | DeleteAdminAction { adminId :: !(Id Admin) }
    deriving (Eq, Show, Data)

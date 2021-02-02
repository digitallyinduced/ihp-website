module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)

data StaticController
    = StartpageAction
    | CommunityAction
    | QuotesAction
    | MailingListSignupConfirmedAction
    | SlackAction
    | PartnersAction
    deriving (Eq, Show, Data)

data GuideController
    = GuideAction -- Redirect /Guide/ and /Guide to /Guide/index.html
    | ApiDocsAction -- Redirect /api-docs and /api-docs/ to /api-docs/index.html
    deriving (Eq, Show, Data)

data PostsController
    = PostsAction
    | ShowPostAction { postId :: !(Id Post) }
    deriving (Eq, Show, Data)

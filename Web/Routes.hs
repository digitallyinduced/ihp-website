module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute StaticController

instance AutoRoute PostsController

instance HasPath GuideController where
    pathTo GuideAction = "/Guide/index.html"

instance CanRoute GuideController where
    parseRoute' = do
        let guide = do
                string "/Guide"
                optional "/"
                endOfInput
                pure GuideAction
        let apiDocs = do
                string "/api-docs"
                optional "/"
                endOfInput
                pure ApiDocsAction

        guide <|> apiDocs

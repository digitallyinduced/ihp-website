module Admin.View.Posts.Index where
import Admin.View.Prelude

import qualified Web.Types as Web
import qualified Web.Routes as Web

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>Posts <a href={pathTo NewPostAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Post</th>
                        <th>Date</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach posts renderPost}</tbody>
            </table>
        </div>
    |]


renderPost post = [hsx|
    <tr>
        <td>
            <a href={Web.ShowPostAction (get #id post)} target="_blank">
                {get #title post}
            </a>
            {when (get #isExternal post) externalBadge}
            {when (get #isCommunity post) communityBadge}
        </td>
        <td>{get #createdAt post |> date}</td>
        <td><a href={EditPostAction (get #id post)} class="text-muted">Edit</a></td>
    </tr>
|]

externalBadge = [hsx|<span class="ml-2 badge badge-secondary">External</span>|]
communityBadge = [hsx|<span class="ml-2 badge badge-primary">Community</span>|]
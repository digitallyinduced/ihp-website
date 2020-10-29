module Web.View.Posts.Show where
import Web.View.Prelude

data ShowView = ShowView { post :: Post }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <h1>{get #title post}</h1>
        <div class="post-body">
            {get #body post |> preEscapedToHtml}
        </div>
    |]

module Web.View.Posts.Show where
import Web.View.Prelude

data ShowView = ShowView { post :: Post }

instance View ShowView where
    beforeRender view = setLayout (postLayout (get #post view))
    html ShowView { .. } = [hsx|
        <div id="post">
            <a href={PostsAction}>← Back to News</a>
            <h1>{get #title post}</h1>
            <p class="text-muted">{get #createdAt post |> date}</p>
            <div class="post-body">
                {get #body post |> preEscapedToHtml}
            </div>


            <div class="text-center mb-5">
                <a href="/" class="btn btn-primary btn-lg">Get Started with IHP Today!</a>
            </div>
        </div>
    |]

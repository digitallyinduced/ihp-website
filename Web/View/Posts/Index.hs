module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        {forEach posts renderPost}
    |]


renderPost post = [hsx|
    <a class="post mb-4 d-block" href={postUrl}>
        <small>{get #createdAt post |> date}</small>
        <strong class="h3 d-block">{get #title post}</strong>
    </a>
|]
    where
        postUrl = if get #isExternal post
            then get #body post
            else pathTo $ ShowPostAction (get #id post)
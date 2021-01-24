module Admin.View.Posts.New where
import Admin.View.Prelude

data NewView = NewView { post :: Post }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">New Post</li>
            </ol>
        </nav>
        <h1>New Post</h1>
        {renderForm post}
    |]

renderForm :: Post -> Html
renderForm post = formFor post [hsx|
    {(textField #title)}
    {(textareaField #body) { placeholder = "Text or URL (if external)"} }
    {(checkboxField #isExternal) { fieldLabel = "External Post", helpText = "An external post is hosted on a different website. This means a user is redirect to the URL given in the post body when opened."}}
    {(checkboxField #isCommunity) { fieldLabel = "Community Post", helpText = "If the post is by someone from the IHP community. Enables the Community badge."}}
    {unless (isNew post) (toHtml $ dateTimeField #createdAt)}
    {submitButton}
|]

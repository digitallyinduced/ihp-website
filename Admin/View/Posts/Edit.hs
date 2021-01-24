module Admin.View.Posts.Edit where
import Admin.View.Prelude
import Admin.View.Posts.New (renderForm)

data EditView = EditView { post :: Post }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Edit Post</li>
            </ol>
        </nav>
        <h1>
            Edit Post

            <a href={DeletePostAction (get #id post)} class="js-delete btn btn-sm btn-danger ml-4">Delete Post</a>
        </h1>

        {renderForm post}
    |]
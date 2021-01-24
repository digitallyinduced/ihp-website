module Admin.View.Admins.Index where
import Admin.View.Prelude

data IndexView = IndexView { admins :: [Admin] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>Admins <a href={pathTo NewAdminAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Admin</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach admins renderAdmin}</tbody>
            </table>
        </div>
    |]


renderAdmin admin = [hsx|
    <tr>
        <td>{get #email admin}</td>
        <td><a href={ShowAdminAction (get #id admin)}>Show</a></td>
        <td><a href={EditAdminAction (get #id admin)} class="text-muted">Edit</a></td>
        <td><a href={DeleteAdminAction (get #id admin)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]

module Web.View.Static.Partners where
import Web.View.Prelude

data PartnersView = PartnersView

instance View PartnersView where
    html PartnersView = [hsx|
        <h1 style="font-size: 3rem; font-weight: 600">
            Build production IHP apps with selected digitally induced partners
        </h1>

        <p class="lead" style="color: hsla(192, 81%, 26%, 0.8); font-weight: 500">
            digitally induced partners are top-notch IHP development and consulting companies.
            Each of our partners can help you build fast and well-architected projects.
        </p>

        <p>
            <a class="btn btn-primary" href="https://www.digitallyinduced.com/NewContactRequest" target="_blank">Get connected with a partner</a>
            <a class="btn btn-link" href="mailto:partners@digitallyinduced.com">Become a partner ➜</a>
        </p>

        <p class="text-muted">
            No matter what your needs are in terms of resources, skills, solutions and products for the realization of your IHP
            and Haskell projects, the digitally induced Partner Network can help you everywhere in the world.
        </p>


        <h2 class="mb-4 mt-5">Platinum Partners</h2>

        <div class="partner">
            <img src="/partners/systor-vest-logo.png" alt="Systor Vest"/>
            <p class="description">
                With over 20 years of experience in developing specialised software applications Systor Vest has
                extensive knowledge in top-notch web applications.

                Developers of Systor Vest are active contributors to IHP and have extensive experience with IHP applications in production.
            </p>


            <p>
                <img src="/partners/platinum.svg" class="partner-badge">
            </p>
        </div>
    |]

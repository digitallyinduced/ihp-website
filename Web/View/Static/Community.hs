module Web.View.Static.Community where
import Web.View.Prelude

data CommunityView = CommunityView

instance View CommunityView where
    html CommunityView = [hsx|
        <div id="community">
            <h1>Community</h1>

            <p>
                IHP has a very active and vibrant community.
            </p>

            <h2>Slack</h2>

            <p>
                Join our Slack Community! Here you can find help with IHP related topics, or just discuss things about coding with like minded people.

                <a href="https://join.slack.com/t/ihpframework/shared_invite/zt-im0do3yv-iryDNyvpwW~py40kvl_cpQ">Join the IHP Slack.</a>
            </p>


            <h2>Gitter</h2>

            <p>
                Our Gitter Chat room can help you when you need to discuss something IHP related. We're over 130 people in Gitter.

                <a href="https://gitter.im/digitallyinduced/ihp?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge">You can find us here.</a>
            </p>


            <h2>IHP Forum</h2>

            <p>
                The forum is a bit more async than the Gitter chat. 

                <a href="https://forum.ihpapp.com/">You can find the forum at forum.ihpapp.com.</a>
            </p>

            <h2>StackOverflow</h2>

            <p>
                Questions, or need help with haskell type errors?
                You can find help for IHP errors on StackOverflow by using the <q><strong>ihp</strong></q> tag. <a href="https://stackoverflow.com/questions/tagged/ihp">Click here to find IHP on StackOverflow</a>
            </p>

            <h2>Reddit</h2>

            <p>
                We're on reddit as well. Find us at <a href="https://www.reddit.com/r/IHPFramework/">r/IHPFramework</a>.
            </p>
        </div>
    |]


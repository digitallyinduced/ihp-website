

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('876a211d-73bc-4052-a571-50676414edcc', 'IHP has been released to the public', '/release.html', '2020-06-23 20:01:16.599718+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('4be282b1-3dca-4d71-b71f-8bf1fc27b088', 'v10072020 released 🎉', '/releases/v10072020.html', '2020-07-10 20:10:21.648014+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('e24d1526-864e-4f8e-bd15-15d4e83203f3', 'Why IHP is Using The Nix Package Manager', '/blog/2020-07-22-why-ihp-is-using-nix.html', '2020-07-22 20:12:47.290777+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('da464ab8-a55b-445c-b5d2-948e31bad4fd', 'v24072020 released 🎉', '/releases/v24072020.html', '2020-07-24 20:15:14.719633+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('b210c5d8-e36e-4a0b-a5b6-fd17fe16f2a5', '"Haskell Web Framework IHP Aims to Make Web Development Type-Safe and Easy" on InfoQ.com', 'https://www.infoq.com/news/2020/07/ihp-haskell-web-framework/', '2020-07-13 20:12:07.48603+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('fe4fbb58-3534-4e78-b168-dee96e42fcc2', 'v07082020 released 🎉', '/releases/v07082020.html', '2020-08-07 20:17:15.052193+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('bd52baa2-0141-4a74-b5b8-0fbbc0450e53', 'IHP Live Reloading: How it works', '/blog/2020-08-10-ihp-live-reloading.html', '2020-08-10 20:17:48.324949+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('8c422b24-64cd-49dd-bfac-32b548db870b', 'v21082020 released', 'https://ihp-forum.digitallyinduced.com/ShowThread?threadId=2bb08d60-3e96-476f-9fdd-d48559fe8b39', '2020-08-21 20:18:23.115202+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('666a9659-0dae-4ad5-8bb8-7fc26906eb8c', 'v20200904 released', 'https://forum.ihpapp.com/ShowThread?threadId=53a7475e-e123-4f60-a363-fdde5071ed42', '2020-09-04 20:18:55.584307+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('1abd13e8-9b09-4e4f-8189-950ab5b89ef5', 'v20200918 released', 'https://forum.ihpapp.com/ShowThread?threadId=33902f52-4fc9-4ec1-b007-cfaabd5b700d', '2020-09-18 20:19:49.046957+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('975a77b7-9d76-4710-a061-c7a4303c8500', 'v20201002 released', 'https://forum.ihpapp.com/ShowThread?threadId=1c9021f7-11f5-48f4-aa23-a4ba915ba727', '2020-10-02 20:20:16.175029+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('62bd5d0c-3cf9-441b-9ef9-747d1ed852c0', 'v20201016 released', 'https://forum.ihpapp.com/ShowThread?threadId=e22a120b-be4d-4c95-9761-95ed145877cb', '2020-10-16 20:20:35.420527+02', true);
INSERT INTO public.posts (id, title, body, created_at, is_external) VALUES ('14ed1d41-5ea4-4608-9c96-465443cd6e55', 'Haskell: The Good Parts', '<p><em>by Marc Scholten, 29.10.2020</em></p>

<p>
There’s been a recent blog post <a href="https://www.snoyman.com/blog/2020/10/haskell-bad-parts-1" target="_blank"><q>Haskell: The Bad Parts</q></a> in the haskell community. To keep things in balance and to spread some positive vibes we should also talk about the good parts of the haskell programming language and it’s ecosystem.
</p>

<p>
Here are some of the best parts we encountered while using Haskell at digitally induced. We focus on the advantages in the web dev space because that is what we are currently working on.
</p>

<h2>Type Safety</h2>
<p>
Haskell has one of the most impressive type systems of any programming language in practical use. If you have used TypeScript or other type safe languages in the past, you should be aware of the great advantages of having a type-checked codebase. Now think TypeScript - but 10x better. That’s how Haskell feels like.
</p>

<p>
You save a lot of time debugging runtime errors. Once the compiler approved your code, you can be pretty sure that it is working. This kind of development process is usually a lot more fun than debugging why something is <code>null</code> or <code>undefined</code>.
</p>

<p>
Once your system has hit a certain size and when new feature requests are rolling in you will want to make changes and refactor some parts of your code base. With Haskell you feel empowered to make changes to any part of your codebase.
</p>

<p>
Compare this to the ruby ecosystem: When working with rails you usually need to have lots of tests or otherwise you cannot confidently refactor code after things are running in production. And even then things will break. With the power of the type safety provided by Haskell, we can make refactorings whenever we want.
</p>

<p>
It’s really a blessing.
</p>

<h2>Performance</h2>
<p>
Out of the box the performance of Haskell based web applications is great. It just feels faster than your typical Rails or PHP application. Thanks to it’s highly optimized runtime system it can also <a href="https://www.yesodweb.com/blog/2011/03/preliminary-warp-cross-language-benchmarks" target="_blank">handle way more requests than a nodejs application</a>.
</p>

<p>
And you get all that without ever thinking about performance at all. 
</p>

<h2>Tooling</h2>
<p>In 2020 it’s finally good. Thanks to <a href="https://github.com/haskell/haskell-language-server" target="_blank">Haskell Language Server</a> there’s now an easy way to have type information, documentation on hover and smart refactorings inside your text editor.</p>

<p>
With nix, cabal and stack we have the best tools for managing Haskell dependencies. Cabal hell is a thing of the past.
</p>

<p>
Great things are also happening to the Haskell compiler itself. <a href="https://github.com/ghc-proposals/ghc-proposals/pull/282" target="_blank">We soon can write dot expressions as you know from most other programming languages:</a> <code>project.name</code> instead of <code>name project</code>.
</p>

<h2>Hiring Haskell Developers</h2>
<p>
Haskell is a secret super power in that regard. The Haskell community consists of many very smart and talented software engineers. Haskell developers usually learn about Haskell because they care about their craft and about building high quality software products instead of learning about it to get a high paying job. Exactly the kind of people you want in your team.
</p>

<h2>2020 Haskell is Ready for Prime Time</h2>
<p>
For years there has been this trend of growing use of type safety as well as the growing use of functional programming techniques. What language could fill this space better than Haskell. Haskell has really matured in the last years and in 2020 it feels like it’s finally ready to conquer the world.
</p>

<p>
If this post made you interested, <a href="https://ihp.digitallyinduced.com/" target="_blank">check out IHP, our batteries-included haskell web framework.</a>
</p>', '2020-10-29 14:34:15.131598+01', false);


ALTER TABLE public.posts ENABLE TRIGGER ALL;



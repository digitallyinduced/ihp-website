

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


ALTER TABLE public.posts ENABLE TRIGGER ALL;



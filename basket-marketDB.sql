PGDMP                         w            basket-market    10.10    10.10 @    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            >           1262    57380    basket-market    DATABASE     �   CREATE DATABASE "basket-market" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE "basket-market";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            @           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    57390 
   categories    TABLE     \   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50)
);
    DROP TABLE public.categories;
       public         postgres    false    3            �            1259    57393    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       postgres    false    196    3            A           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
            public       postgres    false    197            �            1259    57395 
   deliveries    TABLE     }   CREATE TABLE public.deliveries (
    id integer NOT NULL,
    name character varying(25),
    email character varying(30)
);
    DROP TABLE public.deliveries;
       public         postgres    false    3            �            1259    57398    deliveries_id_seq    SEQUENCE     z   CREATE SEQUENCE public.deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.deliveries_id_seq;
       public       postgres    false    3    198            B           0    0    deliveries_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;
            public       postgres    false    199            �            1259    57400    ingredients    TABLE     ]   CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying(25)
);
    DROP TABLE public.ingredients;
       public         postgres    false    3            �            1259    57403    ingredients_id_seq    SEQUENCE     {   CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ingredients_id_seq;
       public       postgres    false    3    200            C           0    0    ingredients_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
            public       postgres    false    201            �            1259    57405    order_items    TABLE     x   CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer
);
    DROP TABLE public.order_items;
       public         postgres    false    3            �            1259    57408    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    date timestamp without time zone,
    address character varying(100),
    user_id integer,
    delivery_id integer
);
    DROP TABLE public.orders;
       public         postgres    false    3            �            1259    57411    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    3    203            D           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    204            �            1259    57413    product_compositions    TABLE     r   CREATE TABLE public.product_compositions (
    product_id integer NOT NULL,
    ingredient_id integer NOT NULL
);
 (   DROP TABLE public.product_compositions;
       public         postgres    false    3            �            1259    57416    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(25),
    price real,
    category_id integer,
    weight integer
);
    DROP TABLE public.products;
       public         postgres    false    3            �            1259    57419    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    206    3            E           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    207            �            1259    57421    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(25),
    password character varying(25),
    email character varying(30),
    address character varying(100)
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    57424    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3    208            F           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    209            �
           2604    57426    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    57427    deliveries id    DEFAULT     n   ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);
 <   ALTER TABLE public.deliveries ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    57428    ingredients id    DEFAULT     p   ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
 =   ALTER TABLE public.ingredients ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            �
           2604    57429 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            �
           2604    57430    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �
           2604    57431    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            +          0    57390 
   categories 
   TABLE DATA               .   COPY public.categories (id, name) FROM stdin;
    public       postgres    false    196   zE       -          0    57395 
   deliveries 
   TABLE DATA               5   COPY public.deliveries (id, name, email) FROM stdin;
    public       postgres    false    198   F       /          0    57400    ingredients 
   TABLE DATA               /   COPY public.ingredients (id, name) FROM stdin;
    public       postgres    false    200   GF       1          0    57405    order_items 
   TABLE DATA               C   COPY public.order_items (order_id, product_id, amount) FROM stdin;
    public       postgres    false    202   CG       2          0    57408    orders 
   TABLE DATA               I   COPY public.orders (id, date, address, user_id, delivery_id) FROM stdin;
    public       postgres    false    203   `G       4          0    57413    product_compositions 
   TABLE DATA               I   COPY public.product_compositions (product_id, ingredient_id) FROM stdin;
    public       postgres    false    205   }G       5          0    57416    products 
   TABLE DATA               H   COPY public.products (id, name, price, category_id, weight) FROM stdin;
    public       postgres    false    206   �G       7          0    57421    users 
   TABLE DATA               G   COPY public.users (id, username, password, email, address) FROM stdin;
    public       postgres    false    208   KH       G           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 7, true);
            public       postgres    false    197            H           0    0    deliveries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.deliveries_id_seq', 1, true);
            public       postgres    false    199            I           0    0    ingredients_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ingredients_id_seq', 24, true);
            public       postgres    false    201            J           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
            public       postgres    false    204            K           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 3, true);
            public       postgres    false    207            L           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
            public       postgres    false    209            �
           2606    57433    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    196            �
           2606    57435    deliveries deliveries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_pkey;
       public         postgres    false    198            �
           2606    57437    ingredients ingredients_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public         postgres    false    200            �
           2606    57439    order_items order_items_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, product_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public         postgres    false    202    202            �
           2606    57441    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    203            �
           2606    57442    products price    CHECK CONSTRAINT     h   ALTER TABLE public.products
    ADD CONSTRAINT price CHECK ((price > (0)::double precision)) NOT VALID;
 3   ALTER TABLE public.products DROP CONSTRAINT price;
       public       postgres    false    206    206            �
           2606    57444 .   product_compositions product_compositions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_pkey PRIMARY KEY (product_id, ingredient_id);
 X   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_pkey;
       public         postgres    false    205    205            �
           2606    57446    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         postgres    false    206            �
           2606    57448    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    208            �
           2606    57449 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_order_id_fkey;
       public       postgres    false    203    2724    202            �
           2606    57454 '   order_items order_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_product_id_fkey;
       public       postgres    false    206    202    2728            �
           2606    57459    orders orders_delivery_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_delivery_id_fkey;
       public       postgres    false    2718    198    203            �
           2606    57464    orders orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public       postgres    false    203    208    2730            �
           2606    57469 <   product_compositions product_compositions_ingredient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_ingredient_id_fkey;
       public       postgres    false    205    200    2720            �
           2606    57474 9   product_compositions product_compositions_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_product_id_fkey;
       public       postgres    false    205    206    2728            �
           2606    57479 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public       postgres    false    2716    206    196            +   }   x�%�;�0D��S�"$�=�D�*-�bƎeK^��c��ӛ��E�*:?���xG#�I���[���ޟ0�S���� �?t`��ډ�6�z��44�Hג];��o�y>S_✌of� E&,      -   0   x�3�tI��,K-�T�/�I�L�r�A<CK��������\�=... ��      /   �   x�5�Ar�0E��)|�NlH�ܥ��`lƖC���P��K��'��$��cIh K	(!����>�Z�:p�:�\�g��9ǁ����8/�s���7l�PD��O������G}�6����'�oI�j+I���"��1��Di'��Q_��R��31��)�HA�2�����I���ʍ�����R���\��h4t�~	��:eU�3�v�V��Qg����#]s�      1      x������ � �      2      x������ � �      4   R   x���� �3[L�m~�%�בY��Bђ�MZ���Kэ_F*�ce�	3����Q���ݧKz�E�S�K�#��:�      5   \   x��1�  ��}� J�u�.��@@4R����r
�p�+[&�l"0�@��ܘ��"q6�c��t�R����X����w,������;�      7   ;   x�3�,I-.AI��٩%���E@J/9?,�\���)��y�$�N_�W� *"�     
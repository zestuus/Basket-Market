PGDMP                          w            Basket Market    10.7    10.7 @    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            >           1262    33425    Basket Market    DATABASE     �   CREATE DATABASE "Basket Market" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE "Basket Market";
             basket_market_admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            @           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33426 
   categories    TABLE     \   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50)
);
    DROP TABLE public.categories;
       public         postgres    false    3            �            1259    33429    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       postgres    false    196    3            A           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
            public       postgres    false    197            �            1259    33431 
   deliveries    TABLE     }   CREATE TABLE public.deliveries (
    id integer NOT NULL,
    name character varying(25),
    email character varying(30)
);
    DROP TABLE public.deliveries;
       public         postgres    false    3            �            1259    33434    deliveries_id_seq    SEQUENCE     z   CREATE SEQUENCE public.deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.deliveries_id_seq;
       public       postgres    false    198    3            B           0    0    deliveries_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;
            public       postgres    false    199            �            1259    33436    ingredients    TABLE     ]   CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying(25)
);
    DROP TABLE public.ingredients;
       public         postgres    false    3            �            1259    33439    ingredients_id_seq    SEQUENCE     {   CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ingredients_id_seq;
       public       postgres    false    3    200            C           0    0    ingredients_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
            public       postgres    false    201            �            1259    33441    order_items    TABLE     x   CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer
);
    DROP TABLE public.order_items;
       public         postgres    false    3            �            1259    33444    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    date timestamp without time zone,
    address character varying(100),
    user_id integer,
    delivery_id integer
);
    DROP TABLE public.orders;
       public         postgres    false    3            �            1259    33447    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    3    203            D           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    204            �            1259    33449    product_compositions    TABLE     r   CREATE TABLE public.product_compositions (
    product_id integer NOT NULL,
    ingredient_id integer NOT NULL
);
 (   DROP TABLE public.product_compositions;
       public         postgres    false    3            �            1259    33452    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(25),
    price real,
    category_id integer,
    weight integer
);
    DROP TABLE public.products;
       public         postgres    false    3            �            1259    33455    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    3    206            E           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    207            �            1259    33457    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(25),
    password character varying(25),
    email character varying(30),
    address character varying(100)
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    33460    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3    208            F           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    209            �
           2604    33462    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    33463    deliveries id    DEFAULT     n   ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);
 <   ALTER TABLE public.deliveries ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    33464    ingredients id    DEFAULT     p   ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
 =   ALTER TABLE public.ingredients ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            �
           2604    33465 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            �
           2604    33466    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �
           2604    33467    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            +          0    33426 
   categories 
   TABLE DATA               .   COPY public.categories (id, name) FROM stdin;
    public       postgres    false    196   �E       -          0    33431 
   deliveries 
   TABLE DATA               5   COPY public.deliveries (id, name, email) FROM stdin;
    public       postgres    false    198   F       /          0    33436    ingredients 
   TABLE DATA               /   COPY public.ingredients (id, name) FROM stdin;
    public       postgres    false    200   QF       1          0    33441    order_items 
   TABLE DATA               C   COPY public.order_items (order_id, product_id, amount) FROM stdin;
    public       postgres    false    202   �H       2          0    33444    orders 
   TABLE DATA               I   COPY public.orders (id, date, address, user_id, delivery_id) FROM stdin;
    public       postgres    false    203    I       4          0    33449    product_compositions 
   TABLE DATA               I   COPY public.product_compositions (product_id, ingredient_id) FROM stdin;
    public       postgres    false    205   I       5          0    33452    products 
   TABLE DATA               H   COPY public.products (id, name, price, category_id, weight) FROM stdin;
    public       postgres    false    206   �I       7          0    33457    users 
   TABLE DATA               G   COPY public.users (id, username, password, email, address) FROM stdin;
    public       postgres    false    208   EK       G           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 7, true);
            public       postgres    false    197            H           0    0    deliveries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.deliveries_id_seq', 1, true);
            public       postgres    false    199            I           0    0    ingredients_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ingredients_id_seq', 84, true);
            public       postgres    false    201            J           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
            public       postgres    false    204            K           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 19, true);
            public       postgres    false    207            L           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
            public       postgres    false    209            �
           2606    33469    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    196            �
           2606    33471    deliveries deliveries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.deliveries DROP CONSTRAINT deliveries_pkey;
       public         postgres    false    198            �
           2606    33473    ingredients ingredients_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public         postgres    false    200            �
           2606    33475    order_items order_items_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, product_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public         postgres    false    202    202            �
           2606    33477    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    203            �
           2606    33478    products price    CHECK CONSTRAINT     h   ALTER TABLE public.products
    ADD CONSTRAINT price CHECK ((price > (0)::double precision)) NOT VALID;
 3   ALTER TABLE public.products DROP CONSTRAINT price;
       public       postgres    false    206    206            �
           2606    33480 .   product_compositions product_compositions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_pkey PRIMARY KEY (product_id, ingredient_id);
 X   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_pkey;
       public         postgres    false    205    205            �
           2606    33482    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         postgres    false    206            �
           2606    33484    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    208            �
           2606    33485 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_order_id_fkey;
       public       postgres    false    203    202    2724            �
           2606    33490 '   order_items order_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_product_id_fkey;
       public       postgres    false    2728    206    202            �
           2606    33495    orders orders_delivery_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_delivery_id_fkey;
       public       postgres    false    198    203    2718            �
           2606    33500    orders orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public       postgres    false    208    2730    203            �
           2606    33505 <   product_compositions product_compositions_ingredient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_ingredient_id_fkey;
       public       postgres    false    200    205    2720            �
           2606    33510 9   product_compositions product_compositions_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_compositions
    ADD CONSTRAINT product_compositions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.product_compositions DROP CONSTRAINT product_compositions_product_id_fkey;
       public       postgres    false    205    206    2728            �
           2606    33515 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public       postgres    false    206    2716    196            +   }   x�%�;�0D��S�"$�=�D�*-�bƎeK^��c��ӛ��E�*:?���xG#�I���[���ޟ0�S���� �?t`��ډ�6�z��44�Hג];��o�y>S_✌of� E&,      -   0   x�3�tI��,K-�T�/�I�L�r�A<CK��������\�=... ��      /   �  x�USۑ�0�����Z�� ��̂
!a=no�CqH�Qw��X$��[�=��T=��k�y��.>�9��я^W�N��A���׺���O%Dm*����_e=�..�j3v�;ld�G��Eq��B��v�Z]�{
zL(jx��}DCN�u�m!��N�6�f��x�D�޵K�v՜7
V
��V0��yXF����L�q7N�ַD���~k�k�S��yĺ��L�r
�U%��䉏:8���0�1oC�`�!��u����e���àgA����F��k65�}�\��Nū��6�I�0r#�)�o��]����^�0�`����ylX���þ�ms��m������|Jn�ƥ:�\�����v6���i����&��f_�_g���tt��c7��Ǳn�`tݩt'/K:�Lb_�Α�������a�������H�(oL+=L\P
�P�ph�f��8L�CDٖDo~CY�5�Z��٤�R�i{��R��'ɹҎcu�[���Ca.	�6����(�%����>�:��W�U�F��P�׬��xF�I%W]E��W�O��Ň�k��Þ���������e�� 6���w	�^~�lh��c3�������� 9�`      1      x������ � �      2      x������ � �      4   �   x��ۑ�0�o�����^n�u���1�����D
id��,r���G��i�@�&A��#],�^��@~�D�7RS���r��%�<P	�$E�9d��c�@$H�"M����%�<0�_� IʟM�!��Yy%JBk���$jM;#�ĳ��?;W>�e��D�тΰ[�!��-��y��K/^=v��w�	�s�ݖE�?w�2�K�      5   :  x�U��R�0���S���?���������s��le��ޞ��t��f��V)�:�8�	E�{)�J&<ىp\�QSۚ1@�4�2�a�C�$.�:�f�ME��-�OH��(
2�%���dhV�\�?�F�7��H�H+����J	y�'�5��E��@�8j�"�y���_B�G��S���Z���j�g�T�?��&tK��#�~<���^5M^�f�p�y��鋨���<��n�>�������PƋ��p>���;�B0t���+��	k�|\����_��ݐ����9�>�7\#}�%I�a˄:      7   ;   x�3�,I-.AI��٩%���E@J/9?,�\���)��y�$�N_�W� *"�     
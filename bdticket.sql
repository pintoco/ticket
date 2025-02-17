PGDMP     #                    z           ticket    14.3    14.3 O    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    17030    ticket    DATABASE     b   CREATE DATABASE ticket WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE ticket;
                postgres    false            �            1255    17031    f_est()    FUNCTION     �   CREATE FUNCTION public.f_est() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin
UPDATE public.ticket 
set estado_ticket = new.estado_ac, fecha=new.fecha_ac
where id_ticket = new.id_ticket;
return new;
end;
$$;
    DROP FUNCTION public.f_est();
       public          postgres    false            �            1259    17032    Acciones    TABLE     �   CREATE TABLE public."Acciones" (
    id_ac integer NOT NULL,
    rut_user character varying(10) NOT NULL,
    id_ticket integer NOT NULL,
    mensaje text NOT NULL,
    fecha_ac timestamp without time zone NOT NULL,
    estado_ac integer NOT NULL
);
    DROP TABLE public."Acciones";
       public         heap    postgres    false            �            1259    17037    Acciones_id_ac_seq    SEQUENCE     �   CREATE SEQUENCE public."Acciones_id_ac_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Acciones_id_ac_seq";
       public          postgres    false    209            S           0    0    Acciones_id_ac_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Acciones_id_ac_seq" OWNED BY public."Acciones".id_ac;
          public          postgres    false    210            �            1259    17038 	   Categoria    TABLE     �   CREATE TABLE public."Categoria" (
    id_cat integer NOT NULL,
    nom_cat character varying(20) NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE public."Categoria";
       public         heap    postgres    false            �            1259    17043    Categoria_id_cat_seq    SEQUENCE     �   CREATE SEQUENCE public."Categoria_id_cat_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Categoria_id_cat_seq";
       public          postgres    false    211            T           0    0    Categoria_id_cat_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Categoria_id_cat_seq" OWNED BY public."Categoria".id_cat;
          public          postgres    false    212            �            1259    17044    Establecimiento    TABLE     �   CREATE TABLE public."Establecimiento" (
    id_estable integer NOT NULL,
    cod_estable numeric NOT NULL,
    nom_estable character varying(100) NOT NULL,
    descripcion text NOT NULL
);
 %   DROP TABLE public."Establecimiento";
       public         heap    postgres    false            �            1259    17049    Establecimiento_id_estable_seq    SEQUENCE     �   CREATE SEQUENCE public."Establecimiento_id_estable_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."Establecimiento_id_estable_seq";
       public          postgres    false    213            U           0    0    Establecimiento_id_estable_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Establecimiento_id_estable_seq" OWNED BY public."Establecimiento".id_estable;
          public          postgres    false    214            �            1259    17050    Perfil    TABLE     �   CREATE TABLE public."Perfil" (
    id_perfil integer NOT NULL,
    nom_perfil character varying(20) NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE public."Perfil";
       public         heap    postgres    false            �            1259    17055    Perfil_id_perfil_seq    SEQUENCE     �   CREATE SEQUENCE public."Perfil_id_perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Perfil_id_perfil_seq";
       public          postgres    false    215            V           0    0    Perfil_id_perfil_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Perfil_id_perfil_seq" OWNED BY public."Perfil".id_perfil;
          public          postgres    false    216            �            1259    17056    Subcategoria    TABLE     �   CREATE TABLE public."Subcategoria" (
    id_subcat integer NOT NULL,
    id_cat integer NOT NULL,
    nom_subcat character varying(30) NOT NULL,
    descripcion text NOT NULL
);
 "   DROP TABLE public."Subcategoria";
       public         heap    postgres    false            �            1259    17061    Subcategoria_id_subcat_seq    SEQUENCE     �   CREATE SEQUENCE public."Subcategoria_id_subcat_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Subcategoria_id_subcat_seq";
       public          postgres    false    217            W           0    0    Subcategoria_id_subcat_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Subcategoria_id_subcat_seq" OWNED BY public."Subcategoria".id_subcat;
          public          postgres    false    218            �            1259    17062    Usuario    TABLE     \  CREATE TABLE public."Usuario" (
    rut_user character varying(10) NOT NULL,
    nombres character varying(30) NOT NULL,
    apaterno character varying(20) NOT NULL,
    amaterno character varying(20) NOT NULL,
    nom_user character varying(20) NOT NULL,
    passw text NOT NULL,
    id_perfil integer NOT NULL,
    id_estable integer NOT NULL
);
    DROP TABLE public."Usuario";
       public         heap    postgres    false            �            1259    17067 	   mansubcat    TABLE     �   CREATE TABLE public.mansubcat (
    id_mansub integer NOT NULL,
    id_cat integer NOT NULL,
    id_subcat integer NOT NULL,
    id_perfil integer NOT NULL,
    activo boolean NOT NULL
);
    DROP TABLE public.mansubcat;
       public         heap    postgres    false            �            1259    17070    mansubcat_id_mansub_seq    SEQUENCE     �   CREATE SEQUENCE public.mansubcat_id_mansub_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.mansubcat_id_mansub_seq;
       public          postgres    false    220            X           0    0    mansubcat_id_mansub_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.mansubcat_id_mansub_seq OWNED BY public.mansubcat.id_mansub;
          public          postgres    false    221            �            1259    17071    mnt_estado_ticket    TABLE     �   CREATE TABLE public.mnt_estado_ticket (
    id numeric NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text
);
 %   DROP TABLE public.mnt_estado_ticket;
       public         heap    postgres    false            �            1259    17076    ticket    TABLE     �  CREATE TABLE public.ticket (
    id_ticket integer NOT NULL,
    id_cat integer NOT NULL,
    id_subcat integer NOT NULL,
    rut_user character varying(10) NOT NULL,
    id_estable integer NOT NULL,
    descripcion text NOT NULL,
    ip character varying(15),
    ip_sugerida character varying(15),
    fono bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    estado_ticket integer NOT NULL,
    id_mansub integer NOT NULL,
    num_inventario character varying(10)
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            �            1259    17081    ticket_id_ticket_seq    SEQUENCE     �   CREATE SEQUENCE public.ticket_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ticket_id_ticket_seq;
       public          postgres    false    223            Y           0    0    ticket_id_ticket_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ticket_id_ticket_seq OWNED BY public.ticket.id_ticket;
          public          postgres    false    224            �           2604    17082    Acciones id_ac    DEFAULT     t   ALTER TABLE ONLY public."Acciones" ALTER COLUMN id_ac SET DEFAULT nextval('public."Acciones_id_ac_seq"'::regclass);
 ?   ALTER TABLE public."Acciones" ALTER COLUMN id_ac DROP DEFAULT;
       public          postgres    false    210    209            �           2604    17083    Categoria id_cat    DEFAULT     x   ALTER TABLE ONLY public."Categoria" ALTER COLUMN id_cat SET DEFAULT nextval('public."Categoria_id_cat_seq"'::regclass);
 A   ALTER TABLE public."Categoria" ALTER COLUMN id_cat DROP DEFAULT;
       public          postgres    false    212    211            �           2604    17084    Establecimiento id_estable    DEFAULT     �   ALTER TABLE ONLY public."Establecimiento" ALTER COLUMN id_estable SET DEFAULT nextval('public."Establecimiento_id_estable_seq"'::regclass);
 K   ALTER TABLE public."Establecimiento" ALTER COLUMN id_estable DROP DEFAULT;
       public          postgres    false    214    213            �           2604    17085    Perfil id_perfil    DEFAULT     x   ALTER TABLE ONLY public."Perfil" ALTER COLUMN id_perfil SET DEFAULT nextval('public."Perfil_id_perfil_seq"'::regclass);
 A   ALTER TABLE public."Perfil" ALTER COLUMN id_perfil DROP DEFAULT;
       public          postgres    false    216    215            �           2604    17086    Subcategoria id_subcat    DEFAULT     �   ALTER TABLE ONLY public."Subcategoria" ALTER COLUMN id_subcat SET DEFAULT nextval('public."Subcategoria_id_subcat_seq"'::regclass);
 G   ALTER TABLE public."Subcategoria" ALTER COLUMN id_subcat DROP DEFAULT;
       public          postgres    false    218    217            �           2604    17087    mansubcat id_mansub    DEFAULT     z   ALTER TABLE ONLY public.mansubcat ALTER COLUMN id_mansub SET DEFAULT nextval('public.mansubcat_id_mansub_seq'::regclass);
 B   ALTER TABLE public.mansubcat ALTER COLUMN id_mansub DROP DEFAULT;
       public          postgres    false    221    220            �           2604    17088    ticket id_ticket    DEFAULT     t   ALTER TABLE ONLY public.ticket ALTER COLUMN id_ticket SET DEFAULT nextval('public.ticket_id_ticket_seq'::regclass);
 ?   ALTER TABLE public.ticket ALTER COLUMN id_ticket DROP DEFAULT;
       public          postgres    false    224    223            =          0    17032    Acciones 
   TABLE DATA           ^   COPY public."Acciones" (id_ac, rut_user, id_ticket, mensaje, fecha_ac, estado_ac) FROM stdin;
    public          postgres    false    209   �b       ?          0    17038 	   Categoria 
   TABLE DATA           C   COPY public."Categoria" (id_cat, nom_cat, descripcion) FROM stdin;
    public          postgres    false    211   �d       A          0    17044    Establecimiento 
   TABLE DATA           ^   COPY public."Establecimiento" (id_estable, cod_estable, nom_estable, descripcion) FROM stdin;
    public          postgres    false    213   9e       C          0    17050    Perfil 
   TABLE DATA           F   COPY public."Perfil" (id_perfil, nom_perfil, descripcion) FROM stdin;
    public          postgres    false    215   �f       E          0    17056    Subcategoria 
   TABLE DATA           T   COPY public."Subcategoria" (id_subcat, id_cat, nom_subcat, descripcion) FROM stdin;
    public          postgres    false    217   bg       G          0    17062    Usuario 
   TABLE DATA           r   COPY public."Usuario" (rut_user, nombres, apaterno, amaterno, nom_user, passw, id_perfil, id_estable) FROM stdin;
    public          postgres    false    219   i       H          0    17067 	   mansubcat 
   TABLE DATA           T   COPY public.mansubcat (id_mansub, id_cat, id_subcat, id_perfil, activo) FROM stdin;
    public          postgres    false    220   �j       J          0    17071    mnt_estado_ticket 
   TABLE DATA           D   COPY public.mnt_estado_ticket (id, nombre, descripcion) FROM stdin;
    public          postgres    false    222   Yk       K          0    17076    ticket 
   TABLE DATA           �   COPY public.ticket (id_ticket, id_cat, id_subcat, rut_user, id_estable, descripcion, ip, ip_sugerida, fono, fecha, estado_ticket, id_mansub, num_inventario) FROM stdin;
    public          postgres    false    223   l       Z           0    0    Acciones_id_ac_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Acciones_id_ac_seq"', 22, true);
          public          postgres    false    210            [           0    0    Categoria_id_cat_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Categoria_id_cat_seq"', 8, true);
          public          postgres    false    212            \           0    0    Establecimiento_id_estable_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Establecimiento_id_estable_seq"', 16, true);
          public          postgres    false    214            ]           0    0    Perfil_id_perfil_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Perfil_id_perfil_seq"', 4, true);
          public          postgres    false    216            ^           0    0    Subcategoria_id_subcat_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Subcategoria_id_subcat_seq"', 28, true);
          public          postgres    false    218            _           0    0    mansubcat_id_mansub_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.mansubcat_id_mansub_seq', 28, true);
          public          postgres    false    221            `           0    0    ticket_id_ticket_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ticket_id_ticket_seq', 53, true);
          public          postgres    false    224            �           2606    17090    Acciones Acciones_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Acciones"
    ADD CONSTRAINT "Acciones_pkey" PRIMARY KEY (id_ac);
 D   ALTER TABLE ONLY public."Acciones" DROP CONSTRAINT "Acciones_pkey";
       public            postgres    false    209            �           2606    17092    Categoria Categoria_nombre_key 
   CONSTRAINT     `   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_nombre_key" UNIQUE (nom_cat);
 L   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_nombre_key";
       public            postgres    false    211            �           2606    17094    Categoria Categoria_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY (id_cat);
 F   ALTER TABLE ONLY public."Categoria" DROP CONSTRAINT "Categoria_pkey";
       public            postgres    false    211            �           2606    17096 /   Establecimiento Establecimiento_cod_estable_key 
   CONSTRAINT     u   ALTER TABLE ONLY public."Establecimiento"
    ADD CONSTRAINT "Establecimiento_cod_estable_key" UNIQUE (cod_estable);
 ]   ALTER TABLE ONLY public."Establecimiento" DROP CONSTRAINT "Establecimiento_cod_estable_key";
       public            postgres    false    213            �           2606    17098 $   Establecimiento Establecimiento_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Establecimiento"
    ADD CONSTRAINT "Establecimiento_pkey" PRIMARY KEY (id_estable);
 R   ALTER TABLE ONLY public."Establecimiento" DROP CONSTRAINT "Establecimiento_pkey";
       public            postgres    false    213            �           2606    17100    Perfil Perfil_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY (id_perfil);
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    215            �           2606    17102    Subcategoria Subcategoria_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Subcategoria"
    ADD CONSTRAINT "Subcategoria_pkey" PRIMARY KEY (id_subcat);
 L   ALTER TABLE ONLY public."Subcategoria" DROP CONSTRAINT "Subcategoria_pkey";
       public            postgres    false    217            �           2606    17104    Usuario Usuario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (rut_user);
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    219            �           2606    17106    Usuario Usuario_rut_user_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_rut_user_key" UNIQUE (rut_user);
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_rut_user_key";
       public            postgres    false    219            �           2606    17108    mansubcat mansubcat_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.mansubcat
    ADD CONSTRAINT mansubcat_pkey PRIMARY KEY (id_mansub);
 B   ALTER TABLE ONLY public.mansubcat DROP CONSTRAINT mansubcat_pkey;
       public            postgres    false    220            �           2606    17110 !   mnt_estado_ticket mnt_estado_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.mnt_estado_ticket
    ADD CONSTRAINT mnt_estado_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.mnt_estado_ticket DROP CONSTRAINT mnt_estado_pkey;
       public            postgres    false    222            �           2606    17112    ticket ticket_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id_ticket);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    223            �           2620    17113    Acciones tr_update    TRIGGER     j   CREATE TRIGGER tr_update BEFORE INSERT ON public."Acciones" FOR EACH ROW EXECUTE FUNCTION public.f_est();
 -   DROP TRIGGER tr_update ON public."Acciones";
       public          postgres    false    209    225            �           2606    17114     Acciones Acciones_estado_ac_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Acciones"
    ADD CONSTRAINT "Acciones_estado_ac_fkey" FOREIGN KEY (estado_ac) REFERENCES public.mnt_estado_ticket(id);
 N   ALTER TABLE ONLY public."Acciones" DROP CONSTRAINT "Acciones_estado_ac_fkey";
       public          postgres    false    222    209    3231            �           2606    17119     Acciones Acciones_id_ticket_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Acciones"
    ADD CONSTRAINT "Acciones_id_ticket_fkey" FOREIGN KEY (id_ticket) REFERENCES public.ticket(id_ticket);
 N   ALTER TABLE ONLY public."Acciones" DROP CONSTRAINT "Acciones_id_ticket_fkey";
       public          postgres    false    3233    223    209            �           2606    17124    Acciones Acciones_rut_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Acciones"
    ADD CONSTRAINT "Acciones_rut_user_fkey" FOREIGN KEY (rut_user) REFERENCES public."Usuario"(rut_user);
 M   ALTER TABLE ONLY public."Acciones" DROP CONSTRAINT "Acciones_rut_user_fkey";
       public          postgres    false    209    3225    219            �           2606    17129 %   Subcategoria Subcategoria_id_cat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Subcategoria"
    ADD CONSTRAINT "Subcategoria_id_cat_fkey" FOREIGN KEY (id_cat) REFERENCES public."Categoria"(id_cat);
 S   ALTER TABLE ONLY public."Subcategoria" DROP CONSTRAINT "Subcategoria_id_cat_fkey";
       public          postgres    false    217    3215    211            �           2606    17134    Usuario Usuario_id_estable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_id_estable_fkey" FOREIGN KEY (id_estable) REFERENCES public."Establecimiento"(id_estable);
 M   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_id_estable_fkey";
       public          postgres    false    219    213    3219            �           2606    17139    Usuario Usuario_id_perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_id_perfil_fkey" FOREIGN KEY (id_perfil) REFERENCES public."Perfil"(id_perfil);
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_id_perfil_fkey";
       public          postgres    false    3221    219    215            �           2606    17144    mansubcat mansubcat_id_cat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mansubcat
    ADD CONSTRAINT mansubcat_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public."Categoria"(id_cat);
 I   ALTER TABLE ONLY public.mansubcat DROP CONSTRAINT mansubcat_id_cat_fkey;
       public          postgres    false    211    220    3215            �           2606    17149 "   mansubcat mansubcat_id_perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mansubcat
    ADD CONSTRAINT mansubcat_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES public."Perfil"(id_perfil);
 L   ALTER TABLE ONLY public.mansubcat DROP CONSTRAINT mansubcat_id_perfil_fkey;
       public          postgres    false    3221    220    215            �           2606    17154 "   mansubcat mansubcat_id_subcat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mansubcat
    ADD CONSTRAINT mansubcat_id_subcat_fkey FOREIGN KEY (id_subcat) REFERENCES public."Subcategoria"(id_subcat);
 L   ALTER TABLE ONLY public.mansubcat DROP CONSTRAINT mansubcat_id_subcat_fkey;
       public          postgres    false    217    220    3223            �           2606    17159     ticket ticket_estado_ticket_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_estado_ticket_fkey FOREIGN KEY (estado_ticket) REFERENCES public.mnt_estado_ticket(id);
 J   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_estado_ticket_fkey;
       public          postgres    false    3231    223    222            �           2606    17164    ticket ticket_id_cat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public."Categoria"(id_cat);
 C   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_cat_fkey;
       public          postgres    false    223    3215    211            �           2606    17169    ticket ticket_id_estable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_estable_fkey FOREIGN KEY (id_estable) REFERENCES public."Establecimiento"(id_estable);
 G   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_estable_fkey;
       public          postgres    false    223    213    3219            �           2606    17174    ticket ticket_id_mansub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_mansub_fkey FOREIGN KEY (id_mansub) REFERENCES public.mansubcat(id_mansub);
 F   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_mansub_fkey;
       public          postgres    false    220    223    3229            �           2606    17179    ticket ticket_id_subcat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_id_subcat_fkey FOREIGN KEY (id_subcat) REFERENCES public."Subcategoria"(id_subcat);
 F   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_id_subcat_fkey;
       public          postgres    false    223    217    3223            �           2606    17184    ticket ticket_rut_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_rut_user_fkey FOREIGN KEY (rut_user) REFERENCES public."Usuario"(rut_user);
 E   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_rut_user_fkey;
       public          postgres    false    223    3225    219            =   �  x��TIr�0<��������Ϲ��A&2��r�W~C>@^*v),rn�L�A+PkK�Tk��~�E�鰆!��.ɷG�`[�kb�	l� ��i�V��i8�1Mr������3���Z݉Z6>K���8.�F�bݱ����h�h'��rL&�j�Z�»P��x��ؽ���%�qi$d�yi�ڷ}�<�c��Lp#�R�AUô?n��g�����z�����'�}Q&ǆ�aS+w_
�y���|��hYFW,ؚ(��$�(�k&�b���Br���!>���h]�ؔN��I�cT\BlpS;�?ׇ�Q���W.2�-��.��������v�k_N����C�k��c����2ʗ�B�-��$(%̊�n(H��~Q���Ș�4M1,�H�Eh	J9�{���Q��.H/Q��y��i�����      ?   �   x��K1C��)r$~'��Hf�&�E�4�i�ܞ���g�^�E�K�����s���J�F_*���=�q�b��;����'�5�۽��n�,Q��ӱx��kK��;��Oܒ�I���(ԼqQ����%Y�&�-��Q�Z�i��`هu��
��E�      A   g  x���AR�0����t�KD�q�v�u�&���L ����6.{�\̐�֪t\f���/��8���h�H%��p]BN*��p'T��+&j���T5�UKM��0�T(p��=����=:&91Ws3.uCd)`)��s�O,�q<#�ORo6Yj�z���궒����a�8��V�u�}p�lҳQ���0�Ѕ��Ì�-����M{ir�"���ٞ�	��qN�r(�����хu���8Hx��]����5!�����Լ�H�˳���c'��q�hsD8p�����J���SӨU����)�
��r��|�O��mh3�f��&�s��3���`��y9G}_���      C   �   x�E��	A��w����D� �|����D��ږ%ؘ�S�q��ff�U�U�X��,��@�z�+�q�¨�H�U����/�
�z#��N;��n#tg��$@��0$��Zȯ�xNsRiВ�|������ �}N5��[xp1�DvT}D�����,����K�      E   �  x�u��n�0�����t���^�
X� ٰ��0��EW?���<������y������{qB?�&V�P;�\�b��Qdk.F3T�UDm��-��P����Dw`1�R+��DzOAY8�5�;���:�}`��3�6E]�6i,�[�r+��i�<d���_a�V�"�^Oj�Fvڠ��8$Y��M��^-��J���e�OSiY,�9E.�w�F��������:��%k-�C��s�
���W�F��ґb2ʍSe�bo��l%����F�Gs!����D�e���XN����\C�Oa�bYWB�ِ�a|^������H��E����-v�>�ćұI�e��;���g��P�[tF442���9�����$^�Z��$T���H�[��dX�3���\�[a�H��Җ��??�e��e,�      G   �  x�m�An�1FיS�Ŏ�$ˢ�
�Y!�b�$��vF�ө4�g�b�������P�0I�A�]�pھ?�/��i9?�Χpwy\l]�9��|y:���,�1T�R�G�ɚW���&XlDsm�D:�D�!��� ��!����z�������?������s8�Js
�R;��h�f,�uE���� 	��x�ָ�n�Z��^����>��^�e�n��j����.�.���;*�J\1��A���d���[�H
��\c�Z���Y1�Mf�@-)Cܥ�n�1�ۛ{��Ǳ���[�ګ����v�4�<p�f�l��Qr�$�zi��F��A��Ƚ��\���I�$q��Nۺؽ�A��|�v}���C�����3�$#�Yƹ��Z�<D���5"����+���f�^q�1      H   �   x�%���  D�o)f㌠�˖��g�8��w�A͌���4�-ie������miG��F8E��F;����OMhN�=8��ڄ����$���+��\�Cڬ/=��rڳ^v���v���r�}��3��+�0S      J   �   x�U�K�0��)|� `��.�X�)��R��'�-����<����@�d�.c��A�{��hP��e�)!x�AbvAX��=&��:�g�0hB/iݒ���n͉RKf�	|˵>e�7��ٟ7X��W��S�u����z|^��y��6�.3���Z���Z	      K   /  x���]��0���*��D��Ы��/nD���8T��;1�RQa?�̙3#]�����y�2�ޚ�ޗM`��CӇ*d� m(�/�(�Bq�!G�s��b`<h�*��~�����"#+�ac�U���5*Ǖ2�p���W���#;�FG�8z��Wg:���@
)���]v��7eӱ�zױxde�;�Pu����e�99��+�A��R;f�l6a���/>�)l��6�s�a���,
�9J��zi	�zc��!��Ŀ�5C��Ox��W�����/��3ډ+����0c�|)�����MH���K��ƞ�Jd�П�U�Nx���'�ԧ�F�[�}o�]��=k���jʡ�(}�⥱�6�e=��F��=����;���{oT�P��X�з�7���[�ce�ymKS�,J���R5>������^*f���b|�k�����vK���i��7�z ���U�=ŅR2���v�L&G�2r���[�)3��@_��0��L
s��G�nFY�����r�c�����s��sհ�W�6���^�V�?i���     
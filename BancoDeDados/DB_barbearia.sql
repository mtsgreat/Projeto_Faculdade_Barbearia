toc.dat                                                                                             0000600 0004000 0002000 00000043262 13666035571 0014462 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           x         	   Barbearia    12.2    12.2 :    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         T           1262    24971 	   Barbearia    DATABASE     �   CREATE DATABASE "Barbearia" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Barbearia";
                postgres    false         �            1259    24985    barbeiro    TABLE       CREATE TABLE public.barbeiro (
    cod_barbeiro integer NOT NULL,
    nome_barbeiro character varying(100) NOT NULL,
    telefone_barbeiro character varying NOT NULL,
    cpf_barbeiro character varying NOT NULL,
    login character varying,
    senha character varying
);
    DROP TABLE public.barbeiro;
       public         heap    postgres    false         �            1259    24983    barbeiro_cod_barbeiro_seq    SEQUENCE     �   CREATE SEQUENCE public.barbeiro_cod_barbeiro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.barbeiro_cod_barbeiro_seq;
       public          postgres    false    203         U           0    0    barbeiro_cod_barbeiro_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.barbeiro_cod_barbeiro_seq OWNED BY public.barbeiro.cod_barbeiro;
          public          postgres    false    202         �            1259    25038    cartao_fidelidade    TABLE     �   CREATE TABLE public.cartao_fidelidade (
    cod_cartao integer NOT NULL,
    data_vencimento date NOT NULL,
    data_emissao date NOT NULL,
    qtd_cartao integer NOT NULL,
    cod_cliente_fk integer NOT NULL
);
 %   DROP TABLE public.cartao_fidelidade;
       public         heap    postgres    false         �            1259    25034     cartao_fidelidade_cod_cartao_seq    SEQUENCE     �   CREATE SEQUENCE public.cartao_fidelidade_cod_cartao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cartao_fidelidade_cod_cartao_seq;
       public          postgres    false    209         V           0    0     cartao_fidelidade_cod_cartao_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.cartao_fidelidade_cod_cartao_seq OWNED BY public.cartao_fidelidade.cod_cartao;
          public          postgres    false    207         �            1259    25036 $   cartao_fidelidade_cod_cliente_fk_seq    SEQUENCE     �   CREATE SEQUENCE public.cartao_fidelidade_cod_cliente_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.cartao_fidelidade_cod_cliente_fk_seq;
       public          postgres    false    209         W           0    0 $   cartao_fidelidade_cod_cliente_fk_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.cartao_fidelidade_cod_cliente_fk_seq OWNED BY public.cartao_fidelidade.cod_cliente_fk;
          public          postgres    false    208         �            1259    25019    cliente    TABLE     �   CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    nome_cliente character varying(100) NOT NULL,
    cpf_cliente character varying NOT NULL,
    telefone_cliente character varying,
    cod_barbeiro_fk integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false         �            1259    33348 #   cartoes_clientes_emissao_vencimento    VIEW     �   CREATE VIEW public.cartoes_clientes_emissao_vencimento AS
 SELECT cli.nome_cliente,
    c.data_vencimento,
    c.data_emissao
   FROM public.cliente cli,
    public.cartao_fidelidade c
  WHERE (cli.cod_cliente = c.cod_cliente_fk);
 6   DROP VIEW public.cartoes_clientes_emissao_vencimento;
       public          postgres    false    206    206    209    209    209         �            1259    25017    cliente_cod_barbeiro_fk_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_cod_barbeiro_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.cliente_cod_barbeiro_fk_seq;
       public          postgres    false    206         X           0    0    cliente_cod_barbeiro_fk_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.cliente_cod_barbeiro_fk_seq OWNED BY public.cliente.cod_barbeiro_fk;
          public          postgres    false    205         �            1259    25015    cliente_cod_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_cod_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.cliente_cod_cliente_seq;
       public          postgres    false    206         Y           0    0    cliente_cod_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.cliente_cod_cliente_seq OWNED BY public.cliente.cod_cliente;
          public          postgres    false    204         �            1259    25058    funcao    TABLE     n   CREATE TABLE public.funcao (
    cod_funcao integer NOT NULL,
    descricao character varying(50) NOT NULL
);
    DROP TABLE public.funcao;
       public         heap    postgres    false         �            1259    33322    usuario    TABLE     �   CREATE TABLE public.usuario (
    cod_usuario integer NOT NULL,
    cod_barbeiro_fk integer NOT NULL,
    cod_funcao_fk integer NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false         �            1259    33344    funcoes_barbeiro    VIEW     �   CREATE VIEW public.funcoes_barbeiro AS
 SELECT a.cod_barbeiro_fk,
    b.nome_barbeiro,
    a.cod_funcao_fk,
    f.descricao
   FROM public.usuario a,
    public.funcao f,
    public.barbeiro b
  WHERE (a.cod_usuario = f.cod_funcao);
 #   DROP VIEW public.funcoes_barbeiro;
       public          postgres    false    203    214    214    214    210    210         �            1259    33356    listar_todos_cadastrados    VIEW       CREATE VIEW public.listar_todos_cadastrados AS
 SELECT cliente.cod_cliente AS "código",
    cliente.nome_cliente AS nomes
   FROM public.cliente
UNION
 SELECT barbeiro.cod_barbeiro AS "código",
    barbeiro.nome_barbeiro AS nomes
   FROM public.barbeiro
  ORDER BY 1;
 +   DROP VIEW public.listar_todos_cadastrados;
       public          postgres    false    206    203    203    206         �            1259    33318    usuario_cod_barbeiro_fk_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_cod_barbeiro_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.usuario_cod_barbeiro_fk_seq;
       public          postgres    false    214         Z           0    0    usuario_cod_barbeiro_fk_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.usuario_cod_barbeiro_fk_seq OWNED BY public.usuario.cod_barbeiro_fk;
          public          postgres    false    212         �            1259    33320    usuario_cod_funcao_fk_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_cod_funcao_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.usuario_cod_funcao_fk_seq;
       public          postgres    false    214         [           0    0    usuario_cod_funcao_fk_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.usuario_cod_funcao_fk_seq OWNED BY public.usuario.cod_funcao_fk;
          public          postgres    false    213         �            1259    33316    usuario_cod_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuario_cod_usuario_seq;
       public          postgres    false    214         \           0    0    usuario_cod_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuario_cod_usuario_seq OWNED BY public.usuario.cod_usuario;
          public          postgres    false    211         �
           2604    24988    barbeiro cod_barbeiro    DEFAULT     ~   ALTER TABLE ONLY public.barbeiro ALTER COLUMN cod_barbeiro SET DEFAULT nextval('public.barbeiro_cod_barbeiro_seq'::regclass);
 D   ALTER TABLE public.barbeiro ALTER COLUMN cod_barbeiro DROP DEFAULT;
       public          postgres    false    203    202    203         �
           2604    25041    cartao_fidelidade cod_cartao    DEFAULT     �   ALTER TABLE ONLY public.cartao_fidelidade ALTER COLUMN cod_cartao SET DEFAULT nextval('public.cartao_fidelidade_cod_cartao_seq'::regclass);
 K   ALTER TABLE public.cartao_fidelidade ALTER COLUMN cod_cartao DROP DEFAULT;
       public          postgres    false    207    209    209         �
           2604    25042     cartao_fidelidade cod_cliente_fk    DEFAULT     �   ALTER TABLE ONLY public.cartao_fidelidade ALTER COLUMN cod_cliente_fk SET DEFAULT nextval('public.cartao_fidelidade_cod_cliente_fk_seq'::regclass);
 O   ALTER TABLE public.cartao_fidelidade ALTER COLUMN cod_cliente_fk DROP DEFAULT;
       public          postgres    false    208    209    209         �
           2604    25022    cliente cod_cliente    DEFAULT     z   ALTER TABLE ONLY public.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('public.cliente_cod_cliente_seq'::regclass);
 B   ALTER TABLE public.cliente ALTER COLUMN cod_cliente DROP DEFAULT;
       public          postgres    false    206    204    206         �
           2604    25023    cliente cod_barbeiro_fk    DEFAULT     �   ALTER TABLE ONLY public.cliente ALTER COLUMN cod_barbeiro_fk SET DEFAULT nextval('public.cliente_cod_barbeiro_fk_seq'::regclass);
 F   ALTER TABLE public.cliente ALTER COLUMN cod_barbeiro_fk DROP DEFAULT;
       public          postgres    false    205    206    206         �
           2604    33325    usuario cod_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuario ALTER COLUMN cod_usuario SET DEFAULT nextval('public.usuario_cod_usuario_seq'::regclass);
 B   ALTER TABLE public.usuario ALTER COLUMN cod_usuario DROP DEFAULT;
       public          postgres    false    211    214    214         �
           2604    33326    usuario cod_barbeiro_fk    DEFAULT     �   ALTER TABLE ONLY public.usuario ALTER COLUMN cod_barbeiro_fk SET DEFAULT nextval('public.usuario_cod_barbeiro_fk_seq'::regclass);
 F   ALTER TABLE public.usuario ALTER COLUMN cod_barbeiro_fk DROP DEFAULT;
       public          postgres    false    214    212    214         �
           2604    33327    usuario cod_funcao_fk    DEFAULT     ~   ALTER TABLE ONLY public.usuario ALTER COLUMN cod_funcao_fk SET DEFAULT nextval('public.usuario_cod_funcao_fk_seq'::regclass);
 D   ALTER TABLE public.usuario ALTER COLUMN cod_funcao_fk DROP DEFAULT;
       public          postgres    false    214    213    214         C          0    24985    barbeiro 
   TABLE DATA           n   COPY public.barbeiro (cod_barbeiro, nome_barbeiro, telefone_barbeiro, cpf_barbeiro, login, senha) FROM stdin;
    public          postgres    false    203       2883.dat I          0    25038    cartao_fidelidade 
   TABLE DATA           r   COPY public.cartao_fidelidade (cod_cartao, data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk) FROM stdin;
    public          postgres    false    209       2889.dat F          0    25019    cliente 
   TABLE DATA           l   COPY public.cliente (cod_cliente, nome_cliente, cpf_cliente, telefone_cliente, cod_barbeiro_fk) FROM stdin;
    public          postgres    false    206       2886.dat J          0    25058    funcao 
   TABLE DATA           7   COPY public.funcao (cod_funcao, descricao) FROM stdin;
    public          postgres    false    210       2890.dat N          0    33322    usuario 
   TABLE DATA           N   COPY public.usuario (cod_usuario, cod_barbeiro_fk, cod_funcao_fk) FROM stdin;
    public          postgres    false    214       2894.dat ]           0    0    barbeiro_cod_barbeiro_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.barbeiro_cod_barbeiro_seq', 35, true);
          public          postgres    false    202         ^           0    0     cartao_fidelidade_cod_cartao_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.cartao_fidelidade_cod_cartao_seq', 28, true);
          public          postgres    false    207         _           0    0 $   cartao_fidelidade_cod_cliente_fk_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.cartao_fidelidade_cod_cliente_fk_seq', 1, false);
          public          postgres    false    208         `           0    0    cliente_cod_barbeiro_fk_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cliente_cod_barbeiro_fk_seq', 1, false);
          public          postgres    false    205         a           0    0    cliente_cod_cliente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.cliente_cod_cliente_seq', 45, true);
          public          postgres    false    204         b           0    0    usuario_cod_barbeiro_fk_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.usuario_cod_barbeiro_fk_seq', 1, false);
          public          postgres    false    212         c           0    0    usuario_cod_funcao_fk_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.usuario_cod_funcao_fk_seq', 1, false);
          public          postgres    false    213         d           0    0    usuario_cod_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_cod_usuario_seq', 8, true);
          public          postgres    false    211         �
           2606    24993    barbeiro barbeiro_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.barbeiro
    ADD CONSTRAINT barbeiro_pkey PRIMARY KEY (cod_barbeiro);
 @   ALTER TABLE ONLY public.barbeiro DROP CONSTRAINT barbeiro_pkey;
       public            postgres    false    203         �
           2606    25044 (   cartao_fidelidade cartao_fidelidade_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.cartao_fidelidade
    ADD CONSTRAINT cartao_fidelidade_pkey PRIMARY KEY (cod_cartao);
 R   ALTER TABLE ONLY public.cartao_fidelidade DROP CONSTRAINT cartao_fidelidade_pkey;
       public            postgres    false    209         �
           2606    25028    cliente cliente_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    206         �
           2606    25062    funcao funcao_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.funcao
    ADD CONSTRAINT funcao_pkey PRIMARY KEY (cod_funcao);
 <   ALTER TABLE ONLY public.funcao DROP CONSTRAINT funcao_pkey;
       public            postgres    false    210         �
           2606    33329    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cod_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    214         �
           2606    25045 7   cartao_fidelidade cartao_fidelidade_cod_cliente_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cartao_fidelidade
    ADD CONSTRAINT cartao_fidelidade_cod_cliente_fk_fkey FOREIGN KEY (cod_cliente_fk) REFERENCES public.cliente(cod_cliente);
 a   ALTER TABLE ONLY public.cartao_fidelidade DROP CONSTRAINT cartao_fidelidade_cod_cliente_fk_fkey;
       public          postgres    false    209    206    2742         �
           2606    25029 $   cliente cliente_cod_barbeiro_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cod_barbeiro_fk_fkey FOREIGN KEY (cod_barbeiro_fk) REFERENCES public.barbeiro(cod_barbeiro);
 N   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cod_barbeiro_fk_fkey;
       public          postgres    false    206    203    2740         �
           2606    33330 $   usuario usuario_cod_barbeiro_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cod_barbeiro_fk_fkey FOREIGN KEY (cod_barbeiro_fk) REFERENCES public.barbeiro(cod_barbeiro);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_cod_barbeiro_fk_fkey;
       public          postgres    false    203    2740    214         �
           2606    33335 "   usuario usuario_cod_funcao_fk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cod_funcao_fk_fkey FOREIGN KEY (cod_funcao_fk) REFERENCES public.funcao(cod_funcao);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_cod_funcao_fk_fkey;
       public          postgres    false    210    2746    214                                                                                                                                                                                                                                                                                                                                                      2883.dat                                                                                            0000600 0004000 0002000 00000000513 13666035571 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Jose	(81)99566-9800	987.132.567-99	Jose01	001
28	Marcelo	(81)98766-2233	111.876.000-99	marcelo01	marcelo01
31	Mateus	(81)99877-9977	117.897.098-00	mtsgreat	12345
32	João	(81)98877-7799	123.987.000-99	joao2010	joao123
33	Diego	(81)99877-4311	987.132.098-33	diego@	@diego
34	Thiago	(81)99766-0099	113.987.987-00	thiago#	01th
\.


                                                                                                                                                                                     2889.dat                                                                                            0000600 0004000 0002000 00000001313 13666035571 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	2050-10-13	2020-05-23	1	1
6	2021-10-13	2019-02-01	1	6
7	2022-03-02	2018-09-07	1	7
8	2023-01-01	2020-05-23	1	8
9	2023-10-04	2020-05-23	1	9
10	2022-03-02	2017-01-01	1	16
11	2050-05-05	2020-05-23	1	17
12	2020-07-04	2016-01-01	1	18
13	2022-11-09	2020-08-08	1	20
14	2022-10-13	2020-05-23	1	21
15	2022-10-13	2020-05-23	1	22
16	2022-10-13	2020-05-23	1	23
17	2021-01-07	2020-05-23	1	30
18	2021-01-07	2020-05-23	1	31
19	2021-01-07	2017-05-09	1	32
20	2021-01-07	2020-05-23	1	33
21	2050-10-13	2017-05-09	1	34
22	2050-10-13	2020-05-23	1	35
23	2030-06-01	2017-05-09	1	36
24	2030-06-01	2020-05-23	1	37
25	2030-06-01	2017-05-09	1	38
26	2020-08-13	2020-05-23	1	43
27	2027-10-02	2017-05-09	1	44
28	2028-07-13	2020-05-23	1	45
\.


                                                                                                                                                                                                                                                                                                                     2886.dat                                                                                            0000600 0004000 0002000 00000003404 13666035571 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Lucas	987.876.123-98	(81)99877-0087	1
6	Samuel	987.888.765-00	(81)91234-0098	1
7	Davi	654.987.987-00	(81)99766-3344	1
8	Enzo	123.874.980-88	(81)9876-5544	28
9	Rafael	876.098.00-00	(81)96655-1235	28
10	Bernardo	123.987.987-88	(81)96655-4466	28
11	Vanderli	234.987.345-88	(81)98755-3344	28
12	Lorenzo	888.777.777-99	(81)96655-9977	28
13	Eduardo	222.765.543-11	(81)98877-6611	28
14	Noah	123.987.444-99	(81)98877-0065	31
15	Nicolas	937.559.661-31	(87) 92376-4818	31
16	Thiago	381.417.376-78	(13) 96242-9765	31
17	José	468.159.517-90	(80) 92148-1436	31
18	André	328.677.251-86	(31) 98805-9078	31
19	Alexandre	184.311.285-00	(81)98877-0065	31
20	Vitor	169.382.876-60	(23) 92367-0736	31
21	Carlos	1578.247.192-19	(30) 91648-7550	31
22	Caleb	713.321.597-70	(46) 99965-0229	31
23	Paulo	568.451.377-81	(52) 93691-2991	31
24	Kayki	123.958.877-14	(87) 92376-4818	32
25	Fewu	378.883.194-40	(13) 96242-9765	32
26	Isray	377.478.628-30	(80) 92148-1436	32
27	Wetos	665.755.354-45	(31) 98805-9078	32
28	Wyawu	184.311.285-00	(81)98877-0065	32
29	Roramika	343.747.949-05	(23) 92367-0736	32
30	Silan	771.865.597-00	(30) 91648-7550	32
31	Zidihipo	115.652.462-84	(46) 99965-0229	32
32	Beikoenl	187.838.337-06	(52) 93691-2991	32
33	Ruoli	292.317.493-31	(52) 93691-2991	32
34	Huihour	292.317.493-31	(52) 93691-2991	32
35	Nouca	244.291.824-26	(52) 93691-2991	32
36	Zosoakin	283.325.664-79	(52) 93691-2991	32
37	Rodrigo 	511.142.376-12	(84) 92528-3343	33
38	Luiz 	683.931.217-87	(25) 90478-0317	33
39	Samuel 	388.757.552-05	(67) 98132-7604	33
40	Tiago 	336.899.284-86	(81) 93509-4470	33
41	Cauã 	384.119.212-20	(82) 97261-5979	33
42	Otávio 	511.424.183-40	(70) 93678-6971	33
43	Nicolash	258.287.849-94	(88) 94451-3378	33
44	Erick 	574.923.795-87	(19) 93361-2916	33
45	Antônio 	958.736.777-43	(73) 98399-3960	33
\.


                                                                                                                                                                                                                                                            2890.dat                                                                                            0000600 0004000 0002000 00000000264 13666035571 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Cadastrar Cliente
2	Remover Cliente
3	Alterar Cliente
4	Agendar Cliente
5	Desagendar Cliente
6	Remover Cliente
11	Cadastrar Barbeiro
12	Alterar Barbeiro
13	Remover Barbeiro
\.


                                                                                                                                                                                                                                                                                                                                            2894.dat                                                                                            0000600 0004000 0002000 00000000074 13666035571 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
2	1	2
3	28	4
4	28	5
5	31	3
6	32	6
7	33	1
8	33	12
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000034740 13666035571 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

DROP DATABASE "Barbearia";
--
-- Name: Barbearia; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Barbearia" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE "Barbearia" OWNER TO postgres;

\connect "Barbearia"

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: barbeiro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barbeiro (
    cod_barbeiro integer NOT NULL,
    nome_barbeiro character varying(100) NOT NULL,
    telefone_barbeiro character varying NOT NULL,
    cpf_barbeiro character varying NOT NULL,
    login character varying,
    senha character varying
);


ALTER TABLE public.barbeiro OWNER TO postgres;

--
-- Name: barbeiro_cod_barbeiro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.barbeiro_cod_barbeiro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barbeiro_cod_barbeiro_seq OWNER TO postgres;

--
-- Name: barbeiro_cod_barbeiro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barbeiro_cod_barbeiro_seq OWNED BY public.barbeiro.cod_barbeiro;


--
-- Name: cartao_fidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cartao_fidelidade (
    cod_cartao integer NOT NULL,
    data_vencimento date NOT NULL,
    data_emissao date NOT NULL,
    qtd_cartao integer NOT NULL,
    cod_cliente_fk integer NOT NULL
);


ALTER TABLE public.cartao_fidelidade OWNER TO postgres;

--
-- Name: cartao_fidelidade_cod_cartao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartao_fidelidade_cod_cartao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartao_fidelidade_cod_cartao_seq OWNER TO postgres;

--
-- Name: cartao_fidelidade_cod_cartao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartao_fidelidade_cod_cartao_seq OWNED BY public.cartao_fidelidade.cod_cartao;


--
-- Name: cartao_fidelidade_cod_cliente_fk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cartao_fidelidade_cod_cliente_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cartao_fidelidade_cod_cliente_fk_seq OWNER TO postgres;

--
-- Name: cartao_fidelidade_cod_cliente_fk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cartao_fidelidade_cod_cliente_fk_seq OWNED BY public.cartao_fidelidade.cod_cliente_fk;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    nome_cliente character varying(100) NOT NULL,
    cpf_cliente character varying NOT NULL,
    telefone_cliente character varying,
    cod_barbeiro_fk integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cartoes_clientes_emissao_vencimento; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.cartoes_clientes_emissao_vencimento AS
 SELECT cli.nome_cliente,
    c.data_vencimento,
    c.data_emissao
   FROM public.cliente cli,
    public.cartao_fidelidade c
  WHERE (cli.cod_cliente = c.cod_cliente_fk);


ALTER TABLE public.cartoes_clientes_emissao_vencimento OWNER TO postgres;

--
-- Name: cliente_cod_barbeiro_fk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cod_barbeiro_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cod_barbeiro_fk_seq OWNER TO postgres;

--
-- Name: cliente_cod_barbeiro_fk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cod_barbeiro_fk_seq OWNED BY public.cliente.cod_barbeiro_fk;


--
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cod_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cod_cliente_seq OWNER TO postgres;

--
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cod_cliente_seq OWNED BY public.cliente.cod_cliente;


--
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcao (
    cod_funcao integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.funcao OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    cod_usuario integer NOT NULL,
    cod_barbeiro_fk integer NOT NULL,
    cod_funcao_fk integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: funcoes_barbeiro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.funcoes_barbeiro AS
 SELECT a.cod_barbeiro_fk,
    b.nome_barbeiro,
    a.cod_funcao_fk,
    f.descricao
   FROM public.usuario a,
    public.funcao f,
    public.barbeiro b
  WHERE (a.cod_usuario = f.cod_funcao);


ALTER TABLE public.funcoes_barbeiro OWNER TO postgres;

--
-- Name: listar_todos_cadastrados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.listar_todos_cadastrados AS
 SELECT cliente.cod_cliente AS "código",
    cliente.nome_cliente AS nomes
   FROM public.cliente
UNION
 SELECT barbeiro.cod_barbeiro AS "código",
    barbeiro.nome_barbeiro AS nomes
   FROM public.barbeiro
  ORDER BY 1;


ALTER TABLE public.listar_todos_cadastrados OWNER TO postgres;

--
-- Name: usuario_cod_barbeiro_fk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_cod_barbeiro_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_cod_barbeiro_fk_seq OWNER TO postgres;

--
-- Name: usuario_cod_barbeiro_fk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_cod_barbeiro_fk_seq OWNED BY public.usuario.cod_barbeiro_fk;


--
-- Name: usuario_cod_funcao_fk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_cod_funcao_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_cod_funcao_fk_seq OWNER TO postgres;

--
-- Name: usuario_cod_funcao_fk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_cod_funcao_fk_seq OWNED BY public.usuario.cod_funcao_fk;


--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_cod_usuario_seq OWNER TO postgres;

--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_cod_usuario_seq OWNED BY public.usuario.cod_usuario;


--
-- Name: barbeiro cod_barbeiro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barbeiro ALTER COLUMN cod_barbeiro SET DEFAULT nextval('public.barbeiro_cod_barbeiro_seq'::regclass);


--
-- Name: cartao_fidelidade cod_cartao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_fidelidade ALTER COLUMN cod_cartao SET DEFAULT nextval('public.cartao_fidelidade_cod_cartao_seq'::regclass);


--
-- Name: cartao_fidelidade cod_cliente_fk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_fidelidade ALTER COLUMN cod_cliente_fk SET DEFAULT nextval('public.cartao_fidelidade_cod_cliente_fk_seq'::regclass);


--
-- Name: cliente cod_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('public.cliente_cod_cliente_seq'::regclass);


--
-- Name: cliente cod_barbeiro_fk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cod_barbeiro_fk SET DEFAULT nextval('public.cliente_cod_barbeiro_fk_seq'::regclass);


--
-- Name: usuario cod_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN cod_usuario SET DEFAULT nextval('public.usuario_cod_usuario_seq'::regclass);


--
-- Name: usuario cod_barbeiro_fk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN cod_barbeiro_fk SET DEFAULT nextval('public.usuario_cod_barbeiro_fk_seq'::regclass);


--
-- Name: usuario cod_funcao_fk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN cod_funcao_fk SET DEFAULT nextval('public.usuario_cod_funcao_fk_seq'::regclass);


--
-- Data for Name: barbeiro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.barbeiro (cod_barbeiro, nome_barbeiro, telefone_barbeiro, cpf_barbeiro, login, senha) FROM stdin;
\.
COPY public.barbeiro (cod_barbeiro, nome_barbeiro, telefone_barbeiro, cpf_barbeiro, login, senha) FROM '$$PATH$$/2883.dat';

--
-- Data for Name: cartao_fidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cartao_fidelidade (cod_cartao, data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk) FROM stdin;
\.
COPY public.cartao_fidelidade (cod_cartao, data_vencimento, data_emissao, qtd_cartao, cod_cliente_fk) FROM '$$PATH$$/2889.dat';

--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cod_cliente, nome_cliente, cpf_cliente, telefone_cliente, cod_barbeiro_fk) FROM stdin;
\.
COPY public.cliente (cod_cliente, nome_cliente, cpf_cliente, telefone_cliente, cod_barbeiro_fk) FROM '$$PATH$$/2886.dat';

--
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcao (cod_funcao, descricao) FROM stdin;
\.
COPY public.funcao (cod_funcao, descricao) FROM '$$PATH$$/2890.dat';

--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (cod_usuario, cod_barbeiro_fk, cod_funcao_fk) FROM stdin;
\.
COPY public.usuario (cod_usuario, cod_barbeiro_fk, cod_funcao_fk) FROM '$$PATH$$/2894.dat';

--
-- Name: barbeiro_cod_barbeiro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barbeiro_cod_barbeiro_seq', 35, true);


--
-- Name: cartao_fidelidade_cod_cartao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartao_fidelidade_cod_cartao_seq', 28, true);


--
-- Name: cartao_fidelidade_cod_cliente_fk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cartao_fidelidade_cod_cliente_fk_seq', 1, false);


--
-- Name: cliente_cod_barbeiro_fk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cod_barbeiro_fk_seq', 1, false);


--
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cod_cliente_seq', 45, true);


--
-- Name: usuario_cod_barbeiro_fk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_cod_barbeiro_fk_seq', 1, false);


--
-- Name: usuario_cod_funcao_fk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_cod_funcao_fk_seq', 1, false);


--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_cod_usuario_seq', 8, true);


--
-- Name: barbeiro barbeiro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barbeiro
    ADD CONSTRAINT barbeiro_pkey PRIMARY KEY (cod_barbeiro);


--
-- Name: cartao_fidelidade cartao_fidelidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_fidelidade
    ADD CONSTRAINT cartao_fidelidade_pkey PRIMARY KEY (cod_cartao);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- Name: funcao funcao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcao
    ADD CONSTRAINT funcao_pkey PRIMARY KEY (cod_funcao);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cod_usuario);


--
-- Name: cartao_fidelidade cartao_fidelidade_cod_cliente_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cartao_fidelidade
    ADD CONSTRAINT cartao_fidelidade_cod_cliente_fk_fkey FOREIGN KEY (cod_cliente_fk) REFERENCES public.cliente(cod_cliente);


--
-- Name: cliente cliente_cod_barbeiro_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cod_barbeiro_fk_fkey FOREIGN KEY (cod_barbeiro_fk) REFERENCES public.barbeiro(cod_barbeiro);


--
-- Name: usuario usuario_cod_barbeiro_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cod_barbeiro_fk_fkey FOREIGN KEY (cod_barbeiro_fk) REFERENCES public.barbeiro(cod_barbeiro);


--
-- Name: usuario usuario_cod_funcao_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cod_funcao_fk_fkey FOREIGN KEY (cod_funcao_fk) REFERENCES public.funcao(cod_funcao);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
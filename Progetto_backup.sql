PGDMP     '                    y        
   games_stop    13.2    13.3 d    E           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            F           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            G           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            H           1262    16394 
   games_stop    DATABASE     f   CREATE DATABASE games_stop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Italian_Italy.utf8';
    DROP DATABASE games_stop;
                postgres    false            I           0    0    DATABASE games_stop    ACL     i   REVOKE CONNECT,TEMPORARY ON DATABASE games_stop FROM PUBLIC;
GRANT ALL ON DATABASE games_stop TO PUBLIC;
                   postgres    false    3144            ?            1259    17537    acquisti    TABLE     ?   CREATE TABLE public.acquisti (
    num_scontrino integer NOT NULL,
    giorno date,
    importo numeric(7,2),
    codice_carta integer,
    codice_spedizione integer
);
    DROP TABLE public.acquisti;
       public         heap    postgres    false            ?            1259    17511    carte    TABLE     ?   CREATE TABLE public.carte (
    codice_carta integer NOT NULL,
    anno integer,
    punti integer,
    cf character(16),
    CONSTRAINT carte_anno_check CHECK ((anno > 1990))
);
    DROP TABLE public.carte;
       public         heap    postgres    false            ?            1259    17552 	   categorie    TABLE     ?   CREATE TABLE public.categorie (
    codice_categoria integer NOT NULL,
    nome character varying(10),
    descrizione character varying(50)
);
    DROP TABLE public.categorie;
       public         heap    postgres    false            ?            1259    17580    citta    TABLE     _   CREATE TABLE public.citta (
    sigla character(2) NOT NULL,
    nome character varying(10)
);
    DROP TABLE public.citta;
       public         heap    postgres    false            ?            1259    17501    clienti    TABLE       CREATE TABLE public.clienti (
    cf character(16) NOT NULL,
    nome character varying(15),
    cognome character varying(15),
    indirizzo character varying(30),
    telefono character(10),
    email character varying(50),
    anni_abbonamento integer,
    invitante character(16)
);
    DROP TABLE public.clienti;
       public         heap    postgres    false            ?            1259    17557    prodotti    TABLE     ?   CREATE TABLE public.prodotti (
    codice_barre integer NOT NULL,
    nome character varying(10),
    pegi integer,
    prezzo numeric(6,2),
    codice_categoria integer
);
    DROP TABLE public.prodotti;
       public         heap    postgres    false            ?            1259    24601    cod_bar    SEQUENCE     ?   CREATE SEQUENCE public.cod_bar
    START WITH 809290020900
    INCREMENT BY 318
    MINVALUE 809290020900
    MAXVALUE 900000000000
    CACHE 1;
    DROP SEQUENCE public.cod_bar;
       public          postgres    false    206            J           0    0    cod_bar    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cod_bar OWNED BY public.prodotti.codice_barre;
          public          postgres    false    220            ?            1259    24607    cod_bar1    SEQUENCE        CREATE SEQUENCE public.cod_bar1
    START WITH 800890
    INCREMENT BY 31
    MINVALUE 800890
    MAXVALUE 900000
    CACHE 1;
    DROP SEQUENCE public.cod_bar1;
       public          postgres    false    206            K           0    0    cod_bar1    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.cod_bar1 OWNED BY public.prodotti.codice_barre;
          public          postgres    false    221            ?            1259    24593    cod_cart    SEQUENCE     y   CREATE SEQUENCE public.cod_cart
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 1000
    MAXVALUE 10000
    CACHE 1;
    DROP SEQUENCE public.cod_cart;
       public          postgres    false    201            L           0    0    cod_cart    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cod_cart OWNED BY public.carte.codice_carta;
          public          postgres    false    218            ?            1259    24599    cod_cat    SEQUENCE     p   CREATE SEQUENCE public.cod_cat
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.cod_cat;
       public          postgres    false    205            M           0    0    cod_cat    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.cod_cat OWNED BY public.categorie.codice_categoria;
          public          postgres    false    219            ?            1259    17618    filiali    TABLE     ?   CREATE TABLE public.filiali (
    codice_filiale integer NOT NULL,
    nome character varying(10),
    sigla character(2),
    cf character(16)
);
    DROP TABLE public.filiali;
       public         heap    postgres    false            ?            1259    24621    cod_fil    SEQUENCE     p   CREATE SEQUENCE public.cod_fil
    START WITH 1
    INCREMENT BY 2
    NO MINVALUE
    MAXVALUE 20
    CACHE 1;
    DROP SEQUENCE public.cod_fil;
       public          postgres    false    212            N           0    0    cod_fil    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.cod_fil OWNED BY public.filiali.codice_filiale;
          public          postgres    false    224            ?            1259    17590 	   magazzini    TABLE     ?   CREATE TABLE public.magazzini (
    codice_magazzino integer NOT NULL,
    nome character varying(10),
    sigla character(2),
    cf character(16)
);
    DROP TABLE public.magazzini;
       public         heap    postgres    false            ?            1259    24615    cod_mag    SEQUENCE     p   CREATE SEQUENCE public.cod_mag
    START WITH 1
    INCREMENT BY 2
    NO MINVALUE
    MAXVALUE 20
    CACHE 1;
    DROP SEQUENCE public.cod_mag;
       public          postgres    false    210            O           0    0    cod_mag    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.cod_mag OWNED BY public.magazzini.codice_magazzino;
          public          postgres    false    223            ?            1259    17527 
   spedizioni    TABLE     ?   CREATE TABLE public.spedizioni (
    codice_spedizione integer NOT NULL,
    tipo character varying(20),
    destinazione character varying(20),
    cf character(16)
);
    DROP TABLE public.spedizioni;
       public         heap    postgres    false            ?            1259    24611    cod_sped    SEQUENCE     y   CREATE SEQUENCE public.cod_sped
    START WITH 2000
    INCREMENT BY 34
    MINVALUE 2000
    MAXVALUE 4000
    CACHE 1;
    DROP SEQUENCE public.cod_sped;
       public          postgres    false    203            P           0    0    cod_sped    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.cod_sped OWNED BY public.spedizioni.codice_spedizione;
          public          postgres    false    222            ?            1259    17651    commessi    TABLE     &  CREATE TABLE public.commessi (
    cf character(16) NOT NULL,
    nome character varying(10),
    cognome character varying(10),
    indirizzo character varying(20),
    telefono character(10),
    email character varying(50),
    mansione character varying(10),
    anni_esperienza integer
);
    DROP TABLE public.commessi;
       public         heap    postgres    false            ?            1259    17567    compra    TABLE     p   CREATE TABLE public.compra (
    numero_scontrino integer,
    codice_barre integer,
    "quantità" integer
);
    DROP TABLE public.compra;
       public         heap    postgres    false            ?            1259    17605 	   contenuto    TABLE     s   CREATE TABLE public.contenuto (
    codice_barre integer,
    codice_magazzino integer,
    "quantità" integer
);
    DROP TABLE public.contenuto;
       public         heap    postgres    false            ?            1259    17522    corrieri    TABLE       CREATE TABLE public.corrieri (
    cf character(16) NOT NULL,
    nome character varying(15),
    cognome character varying(20),
    indirizzo character varying(30),
    telefono character(10),
    email character varying(50),
    azienda character varying(20)
);
    DROP TABLE public.corrieri;
       public         heap    postgres    false            ?            1259    17585 	   dirigenti    TABLE     (  CREATE TABLE public.dirigenti (
    cf character(16) NOT NULL,
    nome character varying(10),
    cognome character varying(10),
    indirizzo character varying(20),
    telefono character(10),
    email character varying(50),
    qualifica character varying(10),
    anni_esperienza integer
);
    DROP TABLE public.dirigenti;
       public         heap    postgres    false            ?            1259    17633    disponibile    TABLE     s   CREATE TABLE public.disponibile (
    codice_barre integer,
    codice_filiale integer,
    "quantità" integer
);
    DROP TABLE public.disponibile;
       public         heap    postgres    false            ?            1259    17646    magazzinieri    TABLE     2  CREATE TABLE public.magazzinieri (
    cf character(16) NOT NULL,
    nome character varying(10),
    cognome character varying(10),
    indirizzo character varying(20),
    telefono character(10),
    email character varying(50),
    specializzazione character varying(10),
    anni_esperienza integer
);
     DROP TABLE public.magazzinieri;
       public         heap    postgres    false            ?            1259    17671 	   rotazioni    TABLE     ?   CREATE TABLE public.rotazioni (
    data_ora timestamp without time zone NOT NULL,
    cf character(16) NOT NULL,
    codice_magazzino integer
);
    DROP TABLE public.rotazioni;
       public         heap    postgres    false            ?            1259    24625 	   scontrino    SEQUENCE     y   CREATE SEQUENCE public.scontrino
    START WITH 100
    INCREMENT BY 11
    MINVALUE 100
    MAXVALUE 10000
    CACHE 1;
     DROP SEQUENCE public.scontrino;
       public          postgres    false    204            Q           0    0 	   scontrino    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.scontrino OWNED BY public.acquisti.num_scontrino;
          public          postgres    false    225            ?            1259    17656    turni    TABLE     ?   CREATE TABLE public.turni (
    data_ora timestamp without time zone NOT NULL,
    cf character(16) NOT NULL,
    codice_filiale integer
);
    DROP TABLE public.turni;
       public         heap    postgres    false            -          0    17537    acquisti 
   TABLE DATA           c   COPY public.acquisti (num_scontrino, giorno, importo, codice_carta, codice_spedizione) FROM stdin;
    public          postgres    false    204   ?s       *          0    17511    carte 
   TABLE DATA           >   COPY public.carte (codice_carta, anno, punti, cf) FROM stdin;
    public          postgres    false    201   t       .          0    17552 	   categorie 
   TABLE DATA           H   COPY public.categorie (codice_categoria, nome, descrizione) FROM stdin;
    public          postgres    false    205   ?t       1          0    17580    citta 
   TABLE DATA           ,   COPY public.citta (sigla, nome) FROM stdin;
    public          postgres    false    208   ?u       )          0    17501    clienti 
   TABLE DATA           m   COPY public.clienti (cf, nome, cognome, indirizzo, telefono, email, anni_abbonamento, invitante) FROM stdin;
    public          postgres    false    200   v       8          0    17651    commessi 
   TABLE DATA           l   COPY public.commessi (cf, nome, cognome, indirizzo, telefono, email, mansione, anni_esperienza) FROM stdin;
    public          postgres    false    215   &x       0          0    17567    compra 
   TABLE DATA           M   COPY public.compra (numero_scontrino, codice_barre, "quantità") FROM stdin;
    public          postgres    false    207   ?z       4          0    17605 	   contenuto 
   TABLE DATA           P   COPY public.contenuto (codice_barre, codice_magazzino, "quantità") FROM stdin;
    public          postgres    false    211   ?z       +          0    17522    corrieri 
   TABLE DATA           Z   COPY public.corrieri (cf, nome, cognome, indirizzo, telefono, email, azienda) FROM stdin;
    public          postgres    false    202   }       2          0    17585 	   dirigenti 
   TABLE DATA           n   COPY public.dirigenti (cf, nome, cognome, indirizzo, telefono, email, qualifica, anni_esperienza) FROM stdin;
    public          postgres    false    209   2~       6          0    17633    disponibile 
   TABLE DATA           P   COPY public.disponibile (codice_barre, codice_filiale, "quantità") FROM stdin;
    public          postgres    false    213          5          0    17618    filiali 
   TABLE DATA           B   COPY public.filiali (codice_filiale, nome, sigla, cf) FROM stdin;
    public          postgres    false    212   ?       3          0    17590 	   magazzini 
   TABLE DATA           F   COPY public.magazzini (codice_magazzino, nome, sigla, cf) FROM stdin;
    public          postgres    false    210   ??       7          0    17646    magazzinieri 
   TABLE DATA           x   COPY public.magazzinieri (cf, nome, cognome, indirizzo, telefono, email, specializzazione, anni_esperienza) FROM stdin;
    public          postgres    false    214   ;?       /          0    17557    prodotti 
   TABLE DATA           V   COPY public.prodotti (codice_barre, nome, pegi, prezzo, codice_categoria) FROM stdin;
    public          postgres    false    206   ??       :          0    17671 	   rotazioni 
   TABLE DATA           C   COPY public.rotazioni (data_ora, cf, codice_magazzino) FROM stdin;
    public          postgres    false    217   ??       ,          0    17527 
   spedizioni 
   TABLE DATA           O   COPY public.spedizioni (codice_spedizione, tipo, destinazione, cf) FROM stdin;
    public          postgres    false    203   x?       9          0    17656    turni 
   TABLE DATA           =   COPY public.turni (data_ora, cf, codice_filiale) FROM stdin;
    public          postgres    false    216   ;?       R           0    0    cod_bar    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cod_bar', 809290021218, true);
          public          postgres    false    220            S           0    0    cod_bar1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cod_bar1', 801541, true);
          public          postgres    false    221            T           0    0    cod_cart    SEQUENCE SET     9   SELECT pg_catalog.setval('public.cod_cart', 1009, true);
          public          postgres    false    218            U           0    0    cod_cat    SEQUENCE SET     5   SELECT pg_catalog.setval('public.cod_cat', 5, true);
          public          postgres    false    219            V           0    0    cod_fil    SEQUENCE SET     6   SELECT pg_catalog.setval('public.cod_fil', 17, true);
          public          postgres    false    224            W           0    0    cod_mag    SEQUENCE SET     6   SELECT pg_catalog.setval('public.cod_mag', 15, true);
          public          postgres    false    223            X           0    0    cod_sped    SEQUENCE SET     9   SELECT pg_catalog.setval('public.cod_sped', 2204, true);
          public          postgres    false    222            Y           0    0 	   scontrino    SEQUENCE SET     9   SELECT pg_catalog.setval('public.scontrino', 166, true);
          public          postgres    false    225            ~           2606    17541    acquisti acquisti_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.acquisti
    ADD CONSTRAINT acquisti_pkey PRIMARY KEY (num_scontrino);
 @   ALTER TABLE ONLY public.acquisti DROP CONSTRAINT acquisti_pkey;
       public            postgres    false    204            x           2606    24587    carte carte_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.carte
    ADD CONSTRAINT carte_pkey PRIMARY KEY (codice_carta);
 :   ALTER TABLE ONLY public.carte DROP CONSTRAINT carte_pkey;
       public            postgres    false    201            ?           2606    17556    categorie categorie_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (codice_categoria);
 B   ALTER TABLE ONLY public.categorie DROP CONSTRAINT categorie_pkey;
       public            postgres    false    205            ?           2606    17584    citta citta_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.citta
    ADD CONSTRAINT citta_pkey PRIMARY KEY (sigla);
 :   ALTER TABLE ONLY public.citta DROP CONSTRAINT citta_pkey;
       public            postgres    false    208            v           2606    17505    clienti clienti_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clienti
    ADD CONSTRAINT clienti_pkey PRIMARY KEY (cf);
 >   ALTER TABLE ONLY public.clienti DROP CONSTRAINT clienti_pkey;
       public            postgres    false    200            ?           2606    17655    commessi commessi_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.commessi
    ADD CONSTRAINT commessi_pkey PRIMARY KEY (cf);
 @   ALTER TABLE ONLY public.commessi DROP CONSTRAINT commessi_pkey;
       public            postgres    false    215            z           2606    17526    corrieri corrieri_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.corrieri
    ADD CONSTRAINT corrieri_pkey PRIMARY KEY (cf);
 @   ALTER TABLE ONLY public.corrieri DROP CONSTRAINT corrieri_pkey;
       public            postgres    false    202            ?           2606    17589    dirigenti dirigenti_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.dirigenti
    ADD CONSTRAINT dirigenti_pkey PRIMARY KEY (cf);
 B   ALTER TABLE ONLY public.dirigenti DROP CONSTRAINT dirigenti_pkey;
       public            postgres    false    209            ?           2606    17622    filiali filiali_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.filiali
    ADD CONSTRAINT filiali_pkey PRIMARY KEY (codice_filiale);
 >   ALTER TABLE ONLY public.filiali DROP CONSTRAINT filiali_pkey;
       public            postgres    false    212            ?           2606    17594    magazzini magazzini_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.magazzini
    ADD CONSTRAINT magazzini_pkey PRIMARY KEY (codice_magazzino);
 B   ALTER TABLE ONLY public.magazzini DROP CONSTRAINT magazzini_pkey;
       public            postgres    false    210            ?           2606    17650    magazzinieri magazzinieri_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.magazzinieri
    ADD CONSTRAINT magazzinieri_pkey PRIMARY KEY (cf);
 H   ALTER TABLE ONLY public.magazzinieri DROP CONSTRAINT magazzinieri_pkey;
       public            postgres    false    214            ?           2606    17561    prodotti prodotti_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.prodotti
    ADD CONSTRAINT prodotti_pkey PRIMARY KEY (codice_barre);
 @   ALTER TABLE ONLY public.prodotti DROP CONSTRAINT prodotti_pkey;
       public            postgres    false    206            ?           2606    17675    rotazioni rotazioni_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.rotazioni
    ADD CONSTRAINT rotazioni_pkey PRIMARY KEY (data_ora, cf);
 B   ALTER TABLE ONLY public.rotazioni DROP CONSTRAINT rotazioni_pkey;
       public            postgres    false    217    217            |           2606    17531    spedizioni spedizioni_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.spedizioni
    ADD CONSTRAINT spedizioni_pkey PRIMARY KEY (codice_spedizione);
 D   ALTER TABLE ONLY public.spedizioni DROP CONSTRAINT spedizioni_pkey;
       public            postgres    false    203            ?           2606    17660    turni turni_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.turni
    ADD CONSTRAINT turni_pkey PRIMARY KEY (data_ora, cf);
 :   ALTER TABLE ONLY public.turni DROP CONSTRAINT turni_pkey;
       public            postgres    false    216    216            ?           2606    24588 #   acquisti acquisti_codice_carta_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acquisti
    ADD CONSTRAINT acquisti_codice_carta_fkey FOREIGN KEY (codice_carta) REFERENCES public.carte(codice_carta);
 M   ALTER TABLE ONLY public.acquisti DROP CONSTRAINT acquisti_codice_carta_fkey;
       public          postgres    false    204    2936    201            ?           2606    17547 (   acquisti acquisti_codice_spedizione_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acquisti
    ADD CONSTRAINT acquisti_codice_spedizione_fkey FOREIGN KEY (codice_spedizione) REFERENCES public.spedizioni(codice_spedizione);
 R   ALTER TABLE ONLY public.acquisti DROP CONSTRAINT acquisti_codice_spedizione_fkey;
       public          postgres    false    2940    203    204            ?           2606    17517    carte carte_cf_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY public.carte
    ADD CONSTRAINT carte_cf_fkey FOREIGN KEY (cf) REFERENCES public.clienti(cf);
 =   ALTER TABLE ONLY public.carte DROP CONSTRAINT carte_cf_fkey;
       public          postgres    false    200    201    2934            ?           2606    17506    clienti clienti_invitante_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.clienti
    ADD CONSTRAINT clienti_invitante_fkey FOREIGN KEY (invitante) REFERENCES public.clienti(cf);
 H   ALTER TABLE ONLY public.clienti DROP CONSTRAINT clienti_invitante_fkey;
       public          postgres    false    200    2934    200            ?           2606    17575    compra compra_codice_barre_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_codice_barre_fkey FOREIGN KEY (codice_barre) REFERENCES public.prodotti(codice_barre);
 I   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_codice_barre_fkey;
       public          postgres    false    206    2946    207            ?           2606    17570 #   compra compra_numero_scontrino_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_numero_scontrino_fkey FOREIGN KEY (numero_scontrino) REFERENCES public.acquisti(num_scontrino);
 M   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_numero_scontrino_fkey;
       public          postgres    false    204    2942    207            ?           2606    17608 %   contenuto contenuto_codice_barre_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.contenuto
    ADD CONSTRAINT contenuto_codice_barre_fkey FOREIGN KEY (codice_barre) REFERENCES public.prodotti(codice_barre);
 O   ALTER TABLE ONLY public.contenuto DROP CONSTRAINT contenuto_codice_barre_fkey;
       public          postgres    false    211    2946    206            ?           2606    17613 )   contenuto contenuto_codice_magazzino_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.contenuto
    ADD CONSTRAINT contenuto_codice_magazzino_fkey FOREIGN KEY (codice_magazzino) REFERENCES public.magazzini(codice_magazzino);
 S   ALTER TABLE ONLY public.contenuto DROP CONSTRAINT contenuto_codice_magazzino_fkey;
       public          postgres    false    210    2952    211            ?           2606    17636 )   disponibile disponibile_codice_barre_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.disponibile
    ADD CONSTRAINT disponibile_codice_barre_fkey FOREIGN KEY (codice_barre) REFERENCES public.prodotti(codice_barre);
 S   ALTER TABLE ONLY public.disponibile DROP CONSTRAINT disponibile_codice_barre_fkey;
       public          postgres    false    206    2946    213            ?           2606    17641 +   disponibile disponibile_codice_filiale_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.disponibile
    ADD CONSTRAINT disponibile_codice_filiale_fkey FOREIGN KEY (codice_filiale) REFERENCES public.filiali(codice_filiale);
 U   ALTER TABLE ONLY public.disponibile DROP CONSTRAINT disponibile_codice_filiale_fkey;
       public          postgres    false    212    213    2954            ?           2606    17628    filiali filiali_cf_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.filiali
    ADD CONSTRAINT filiali_cf_fkey FOREIGN KEY (cf) REFERENCES public.dirigenti(cf);
 A   ALTER TABLE ONLY public.filiali DROP CONSTRAINT filiali_cf_fkey;
       public          postgres    false    209    2950    212            ?           2606    17623    filiali filiali_sigla_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.filiali
    ADD CONSTRAINT filiali_sigla_fkey FOREIGN KEY (sigla) REFERENCES public.citta(sigla);
 D   ALTER TABLE ONLY public.filiali DROP CONSTRAINT filiali_sigla_fkey;
       public          postgres    false    212    2948    208            ?           2606    17600    magazzini magazzini_cf_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.magazzini
    ADD CONSTRAINT magazzini_cf_fkey FOREIGN KEY (cf) REFERENCES public.dirigenti(cf);
 E   ALTER TABLE ONLY public.magazzini DROP CONSTRAINT magazzini_cf_fkey;
       public          postgres    false    2950    209    210            ?           2606    17595    magazzini magazzini_sigla_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.magazzini
    ADD CONSTRAINT magazzini_sigla_fkey FOREIGN KEY (sigla) REFERENCES public.citta(sigla);
 H   ALTER TABLE ONLY public.magazzini DROP CONSTRAINT magazzini_sigla_fkey;
       public          postgres    false    208    210    2948            ?           2606    17562 '   prodotti prodotti_codice_categoria_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prodotti
    ADD CONSTRAINT prodotti_codice_categoria_fkey FOREIGN KEY (codice_categoria) REFERENCES public.categorie(codice_categoria);
 Q   ALTER TABLE ONLY public.prodotti DROP CONSTRAINT prodotti_codice_categoria_fkey;
       public          postgres    false    2944    205    206            ?           2606    17676    rotazioni rotazioni_cf_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.rotazioni
    ADD CONSTRAINT rotazioni_cf_fkey FOREIGN KEY (cf) REFERENCES public.magazzinieri(cf);
 E   ALTER TABLE ONLY public.rotazioni DROP CONSTRAINT rotazioni_cf_fkey;
       public          postgres    false    214    217    2956            ?           2606    17681 )   rotazioni rotazioni_codice_magazzino_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.rotazioni
    ADD CONSTRAINT rotazioni_codice_magazzino_fkey FOREIGN KEY (codice_magazzino) REFERENCES public.magazzini(codice_magazzino);
 S   ALTER TABLE ONLY public.rotazioni DROP CONSTRAINT rotazioni_codice_magazzino_fkey;
       public          postgres    false    2952    217    210            ?           2606    17532    spedizioni spedizioni_cf_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.spedizioni
    ADD CONSTRAINT spedizioni_cf_fkey FOREIGN KEY (cf) REFERENCES public.corrieri(cf);
 G   ALTER TABLE ONLY public.spedizioni DROP CONSTRAINT spedizioni_cf_fkey;
       public          postgres    false    2938    203    202            ?           2606    17661    turni turni_cf_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY public.turni
    ADD CONSTRAINT turni_cf_fkey FOREIGN KEY (cf) REFERENCES public.commessi(cf);
 =   ALTER TABLE ONLY public.turni DROP CONSTRAINT turni_cf_fkey;
       public          postgres    false    216    215    2958            ?           2606    17666    turni turni_codice_filiale_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.turni
    ADD CONSTRAINT turni_codice_filiale_fkey FOREIGN KEY (codice_filiale) REFERENCES public.filiali(codice_filiale);
 I   ALTER TABLE ONLY public.turni DROP CONSTRAINT turni_codice_filiale_fkey;
       public          postgres    false    212    216    2954            -   e   x?M???0Dѳ?h??$??ׁ???????@p?ؐ&`?B??8??a<>??Jg?:?????)M???r-%9y<Ww??;aj?w?]??e+ү??o?R%?      *   ?   x?%?Kn? ??9Le?xIH!?4???]??B"!o>~l?jC???n?#o?8??T????;Z???S?T!???3?	S?P?@p?t^%?(?uf???0?К[??]???-M?W _?????C>???'KPb?W,?3??'??c?????K????>?).m?b??l??I??Aj??u~??nsV?})??{,=?      .   ?   x?=?K?@D??)? j?;?[7?I??C6?^L?US4ݏS?ںV?)??F?M?]?Qe8'??I?S}G,,??
??y????&.;??m????U?u?Z????????`!_???C?}?(k??Ǝ???V?`??J???+??!TfA?p??x???8 ??WVV      1   a   x??1
?0?z????(???l<B ????כn?? ???adL?~YS?	?WϝqE,U?S?o?pX??(??Ś??}®՞?6??O??H????      )     x?e??r?0???S?	RB??cֆÖM??? -?0hK6[??ߑaS$???n??=Y????B???r?.?`ll???8??Lr6a?/.I?q!U?SE?DaoCx??ƵO;??pT?y?*?fD??PET?r?w~??m[??PRq?28?t????VH\u?(?h?T??2?????;ھ?A?5?;?ɘ ?BR4????]?,???u??.f\?\??z2?s2?4??*&?&?P?EQ??I??6??{~Y|??릞?h(?s? wh??c???z????5?0?3?Y3!U??????[?&?n?E^fU?j|J\*N??v]?'???x????R]kt}?b??G????b???ū??B????m?־?>?<?TP.?????!a=?YV??R?B?3?	??????l8,??Z
8D6?????FE??n?s%?u?,?ݫ????M?|?X~??(R*?¤??-?>]??	/y6???%?^???w???c֊b?R%??Q???1????h??>      8   V  x?m??n?0?????T??sW?Ԅ?$T?????ʛ??%??!}??'E????ә3gT?ܔ?JE??'?Ԡ???Nws????l?lm?{???
?"??qxږTw?V??f?ZX辷???M?ȷ????8???r??u???B?{<?v&ù?Y?@^???v[l?kpe˪Z<??xE?Yw?FChp7?κY
?S?E*P?*o?w??g???uaf??(???U.???W??????i?*??????\?N???N???Fٮ\E?&*?-?
&{???>?h̑? ǌ3?G?G??k[????Ve?-??W??|?`?4?R?)?G3Q?V??y?d=)?Nnӵ?UF?.?*??????????l?`???L.XoAә???h1Ze????+?????>k6?K_?:O???Cs^z?c~??fW?H?s?B?USц/f????z?*?HXB???v?@?HU?&V?d??7??p??Ǐ?.??;]?]?`??ƞh???^?E?V??!M?@?LQC|?@9?AÉ?zKf9?[q?????T!%??x)?oھ?R?D0?O??(????Q???*?En?(?q???      0   ^   x?M???0D?s(??%?I/?_??Q???g m c?QX??@f?? h??PM(???h*?=?Gdy??Ŭ??f)ԝU????"j???\??ܩ?       4   ?  x?M?Q?$!C????)
-e/o???D???I???y?=M????ڔ8?K?͈ք(??a-????+=???#?????M?X.?Ggyo?đ
ǁ???N??]>?~3z??v????y????????????G:????????m??7??tv?l5Q?8 v???7?mRb?ʐ????Xݑ
G?v???Ҋ?أ?ZД??@?сH ?6?".#"??bd?y??Na?|??>џ??=?@ES??X ?a?:>]c ??mL?܈?K0w?@???6t???????U???N??w???ӆ?M?R????????m? ?h??"?$2P?b"?M?%`?)}?mZѦ?k};W&??Q???@?L??b????t$??q?1p?????6\c???D???x|????????]??-??$Mu??:P?7?v ??N???zš??׉??	u???8??a ?Zj?O?5??i'zډ??kL?\z1??p??сs?k?]6)?????????j{-?      +     x?m??n?0???)x?*??[?Xi5??l=??v??DJ?}??2?PM???????ݷz?E??(bZ@e?uк?????????P?Ɣ%?`????<ۯNn??F勚]	ב?)?@y;?E5.2??.6L??)g??)?=?2?'?cSP??*?\???M??8?l???:_??ǁ
I??2Jf
?uo??w??:?ڭ&1f?g??|g C?e?5?~?a?qS?
*F??(???M????N]??N?@W???{?rKD?-h;????}?1"r>????c?? ??{?      2   ?   x?]α?0????<?Qڣt?H?? 	D?R	?&?%??Oo?A???????n???/պ???ڒ,Ae?Ogk?>:M??y?$p?Ȕ?????l??WMP????'? ˏy?\j????J5??l??>jF{{?
x?c??X?l???????m??C?M??x??tf??GGІh??rK]????Ŗ(?mv'?|??>Fv]1?^˼R      6   ?  x?M?Q?? ????bn	?2?_??????~?t??޷??????^7Ү?\׃tN%?w+?;???F3?`"?D??tN??V??L6?W??	&L?s?L???f??Fny???1;?f???tN??ZyF1_?y??H0?`"?D:??d+?h&̚?D??	&?9m&[yF3???`2??,&??L??n?`v?ѷ?H0?`"?D:??d+?h&??f"?D????6??<???b?}??,&???b2?S0??g??F??fT?QiF?2*dTȨ????9????9????9??Af2s???$V{??????mr?G;???:0?ʬř?;;?9?c?f?G?ӨY3???D,. cF?x?6?O??-?H<͛?@?b?y'?w?l;??H????3??\?b?6?8??m?0O?????-?k?z{[???z??3????xi?????<?z???4??,??,o???Y??L??^Z?3E???n;???u0;?i??t????(??????????f?Vg      5   ?   x?m?A? ???pӁ"e?c?3$]4????_?Ҹ*?//?G??o`	)??\?%???v ??????@????8#??t/Lϫ??zّ@??????O
@?e?,?qN?m??|?~CSq??g4Glo>Ǯ!?L?F      3   ?   x?m?A? ????a?Ȓ?6E?!qa?q?;????+\yy?A?~??3AL`gyMZ9-?ʓ?oY?,?q??/??q~f????8?4?~???*Qe?bL?,d?S\??tN???ײ\?S??"?hl>?      7   ?  x?u??n?0?k?y?
<>qׄ?????V?VZyY?X,????w=]????̰,???G?9??,??T?l???!OF?.?n?뫙1L??1ֺ???զ??lK0??j??m?E?(??"?"%[?#:ؾ??yc?'S?f?a?8'????????cT?+%?
`??m?/?N??n??????$GK?%å?ޅ?????g?h.??ꕉ?)?\>???d??a?c??+?p??Bq??;<|3gq??Aa??????O?t?~GY??m0?U}|??V?j?K|?????????????e?W?? ??8??-޼??a,?>D???cV?y(V ?$F??/ش̾??t}q?R???'/?n??-SxY?΋4!??t??ZM???	??3n3????????????M??`?!?dT=;PO??????<?Е?m?C????}?I~??Yݠ?R?a"qp??;??}??B8??U}o???]??,K?E?,?m?骚\????(????S.?n?4?6O????XR??dS?5Y???g?v???P?!?a?d?`?-?P?~?y???o7Y      /      x?]?]K?0??????聯?(H?	?Q?&?t??=#????M?0?????=?C5!?"?????`?2`??	ZhB*F??3?H? Y?pEf?jA??O?;?P7ؽ7m ,K$$4??????Q??TP???0???>??;???5<xs???t?l,???????G?????ŏ?p?S?ǣ?q??t???qup+???(T???.?8I???	?Ƕ????s?b)ak??&?*?9?ש?%???y+???m???/ ????'??/??\R?~P?۹? A?9apq???XE?Uw{      :   ?  x???MN?0??{
. r<???]	8N?4UhA???9H&r?'e??i???q?5?Vm?`????2/?9???m$?G???s?? ?XcL00??
YooK7?^g?3????P???z?1??1?cc??????qf?^?F|5??[?e?՘??c???1?V?z??~:gko?=?MF???X?[?y,?1&Sl?????i?Euo?"??h???z?1??1?cc????6v?~F?D??7?4僡????΃y:] ??{d?MKwY???yt<??|@T]?_?y0?A'??Sp???Kz?e?M$M????|PT]?_?y0?A'??Sp????L???~?z}?G?х???]???"i??e?M?qe}?cˉ????ˤ8[-M??l???n}>??^>Y??yq?m>+H??q?tӏ??J???W?????jyZ??z??vߺ???      ,   ?   x?}?A
?0??)r??ik??c????+7?J?X=???B?.??< ???i??=y??s?%t?q ??ZW:9w 5
MDB̵c????s?J:?d??R-?Q?RǥbE?~uiz?8E??'???9??<_??q?=?????? ?Q?v?C???t???o^[]TF剂d5????	?a?      9   ?  x???AN?0?u{
. r<???]i?$@?!$??J?C???????'?ClCz?C??!̿?fWk????(?$??f?Xt]9?????,c{ShoM???xI??Lo???n(ʅ???.?vǚf??{G??x?*????]֦?Ʊ?K))?͎??޹?'??Sp޼??{h?q;ME??޼??????4?X?XƘbLo??^??^?????1ӛ??&K?S,?????a?ύԖ??4?x?7???<??4?X?XƘbLo]ݿL}'?E?o???c?7?16M0?0?1?X???vs8_9v???oo???<??4?X?XƘbloø9???~?܈??o?m?s??%?e?)???w???8߿tq???L?cp??.?.?N??????q??;?????&ș?\??<]]??9l?|?K?J??????/????9?	??2??????^?=Z??     
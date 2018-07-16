--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-16 18:43:50 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 33525)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    cd_cliente integer NOT NULL,
    endereco_cd_edereco integer,
    nm_razaosocial character varying(60),
    nm_nomefantasia character varying(30),
    ds_email character varying(100),
    cod_identificacao integer,
    tipo_cliente character varying(60),
    tp_visivel character(1)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33537)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    cd_endereco integer NOT NULL,
    nm_rua character varying(40),
    nr_casa integer,
    ds_complemento text,
    nm_bairro character varying(25),
    nm_cidade character varying(30),
    ds_cep text,
    telefone1 numeric(20,0),
    telefone2 numeric(20,0)
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33534)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao character varying(60),
    tp_visivel character(1)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33528)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying(30),
    ds_senha character varying(30),
    nick text,
    tp_visivel character(1)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33543)
-- Name: ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ordem_servico (
    cd_ordem_servico integer NOT NULL,
    funcionario_cd_funcionario integer,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric(999,2),
    bool_fechado boolean
);


ALTER TABLE ordem_servico OWNER TO postgres;

--
-- TOC entry 2169 (class 0 OID 33525)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cd_cliente, endereco_cd_edereco, nm_razaosocial, nm_nomefantasia, ds_email, cod_identificacao, tipo_cliente, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 33537)
-- Dependencies: 184
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (cd_endereco, nm_rua, nr_casa, ds_complemento, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 33534)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 33528)
-- Dependencies: 182
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 33543)
-- Dependencies: 185
-- Data for Name: ordem_servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ordem_servico (cd_ordem_servico, funcionario_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_fechado) FROM stdin;
\.


--
-- TOC entry 2037 (class 2606 OID 33547)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2045 (class 2606 OID 33549)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2043 (class 2606 OID 33557)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2041 (class 2606 OID 33559)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2049 (class 2606 OID 33561)
-- Name: pk_ordem_servico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT pk_ordem_servico PRIMARY KEY (cd_ordem_servico);


--
-- TOC entry 2046 (class 1259 OID 33594)
-- Name: fki_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cliente ON ordem_servico USING btree (cliente_cd_cliente);


--
-- TOC entry 2038 (class 1259 OID 33582)
-- Name: fki_endereco; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco ON funcionario USING btree (endereco_cd_endereco);


--
-- TOC entry 2035 (class 1259 OID 33555)
-- Name: fki_endereco_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_cliente ON cliente USING btree (endereco_cd_edereco);


--
-- TOC entry 2039 (class 1259 OID 33576)
-- Name: fki_funcao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcao ON funcionario USING btree (funcao_cd_funcao);


--
-- TOC entry 2047 (class 1259 OID 33588)
-- Name: fki_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionario ON ordem_servico USING btree (funcionario_cd_funcionario);


--
-- TOC entry 2054 (class 2606 OID 33589)
-- Name: fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_cd_cliente) REFERENCES cliente(cd_cliente);


--
-- TOC entry 2052 (class 2606 OID 33577)
-- Name: fk_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_endereco FOREIGN KEY (endereco_cd_endereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2050 (class 2606 OID 33550)
-- Name: fk_endereco_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_endereco_cliente FOREIGN KEY (endereco_cd_edereco) REFERENCES endereco(cd_endereco);


--
-- TOC entry 2051 (class 2606 OID 33571)
-- Name: fk_funcao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcao FOREIGN KEY (funcao_cd_funcao) REFERENCES funcao(cd_funcao);


--
-- TOC entry 2053 (class 2606 OID 33583)
-- Name: fk_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (funcionario_cd_funcionario) REFERENCES funcionario(cd_funcionario);


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-16 18:43:50 BRT

--
-- PostgreSQL database dump complete
--


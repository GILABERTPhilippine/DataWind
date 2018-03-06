#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: stations
#------------------------------------------------------------

CREATE TABLE stations(
        id_station  int (11) Auto_increment  NOT NULL ,
        nom_station Varchar (100) NOT NULL ,
        id_commune  Int NOT NULL ,
        PRIMARY KEY (id_station )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: communes
#------------------------------------------------------------

CREATE TABLE communes(
        id_commune  int (11) Auto_increment  NOT NULL ,
        nom_commune Varchar (100) NOT NULL ,
        PRIMARY KEY (id_commune )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: constantes relevees
#------------------------------------------------------------

CREATE TABLE constantes_relevees(
        id_const_rel int (11) Auto_increment  NOT NULL ,
        vit_vent     Numeric NOT NULL ,
        temp         Numeric NOT NULL ,
        humidite     Numeric NOT NULL ,
        pluviometrie Numeric NOT NULL ,
        PRIMARY KEY (id_const_rel )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: date
#------------------------------------------------------------

CREATE TABLE date(
        id_date   int (11) Auto_increment  NOT NULL ,
        date_jour Date NOT NULL ,
        heure     Datetime NOT NULL ,
        PRIMARY KEY (id_date )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: sta_con
#------------------------------------------------------------

CREATE TABLE sta_con(
        id_station   Int NOT NULL ,
        id_const_rel Int NOT NULL ,
        PRIMARY KEY (id_station ,id_const_rel )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: con_dat
#------------------------------------------------------------

CREATE TABLE con_dat(
        id_const_rel Int NOT NULL ,
        id_date      Int NOT NULL ,
        PRIMARY KEY (id_const_rel ,id_date )
)ENGINE=InnoDB;

ALTER TABLE stations ADD CONSTRAINT FK_stations_id_commune FOREIGN KEY (id_commune) REFERENCES communes(id_commune);
ALTER TABLE sta_con ADD CONSTRAINT FK_sta_con_id_station FOREIGN KEY (id_station) REFERENCES stations(id_station);
ALTER TABLE sta_con ADD CONSTRAINT FK_sta_con_id_const_rel FOREIGN KEY (id_const_rel) REFERENCES constantes_relevees(id_const_rel);
ALTER TABLE con_dat ADD CONSTRAINT FK_con_dat_id_const_rel FOREIGN KEY (id_const_rel) REFERENCES constantes_relevees(id_const_rel);
ALTER TABLE con_dat ADD CONSTRAINT FK_con_dat_id_date FOREIGN KEY (id_date) REFERENCES date(id_date);

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Stations
#------------------------------------------------------------

CREATE TABLE Stations(
        id_station  int (11) Auto_increment  NOT NULL ,
        nom_station Varchar (100) NOT NULL ,
        id_commune  Int NOT NULL ,
        PRIMARY KEY (id_station )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Communes
#------------------------------------------------------------

CREATE TABLE Communes(
        id_commune  int (11) Auto_increment  NOT NULL ,
        nom_commune Varchar (100) NOT NULL ,
        PRIMARY KEY (id_commune )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Constantes relevees
#------------------------------------------------------------

CREATE TABLE Constantes_relevees(
        id_const_rel int (11) Auto_increment  NOT NULL ,
        vit_vent     Numeric NOT NULL ,
        temp         Numeric NOT NULL ,
        humidite     Numeric NOT NULL ,
        pluviometrie Numeric NOT NULL ,
        PRIMARY KEY (id_const_rel )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Date
#------------------------------------------------------------

CREATE TABLE Date(
        id_date   int (11) Auto_increment  NOT NULL ,
        date_jour Date NOT NULL ,
        heure     Datetime NOT NULL ,
        PRIMARY KEY (id_date )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: sta_con_dat
#------------------------------------------------------------

CREATE TABLE sta_con_dat(
        id_station   Int NOT NULL ,
        id_const_rel Int NOT NULL ,
        id_date      Int NOT NULL ,
        PRIMARY KEY (id_station ,id_const_rel ,id_date )
)ENGINE=InnoDB;

ALTER TABLE Stations ADD CONSTRAINT FK_Stations_id_commune FOREIGN KEY (id_commune) REFERENCES Communes(id_commune);
ALTER TABLE sta_con_dat ADD CONSTRAINT FK_sta_con_dat_id_station FOREIGN KEY (id_station) REFERENCES Stations(id_station);
ALTER TABLE sta_con_dat ADD CONSTRAINT FK_sta_con_dat_id_const_rel FOREIGN KEY (id_const_rel) REFERENCES Constantes_relevees(id_const_rel);
ALTER TABLE sta_con_dat ADD CONSTRAINT FK_sta_con_dat_id_date FOREIGN KEY (id_date) REFERENCES Date(id_date);

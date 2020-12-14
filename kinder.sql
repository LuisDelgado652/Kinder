/*==============================================================*/
--Universidad Laica Eloy Alfaro de Manabí
--Delgado Bravo Luis Alfredo
--Materia: Gestión de base de datos
--Docente y colaborador: Ing. Robert Wilfrido Moreira Centeno, Mg
/*==============================================================*/



/*==============================================================*/
/* Table: ACTIVIDAD_MATERIAL                                    */
/*==============================================================*/
create table ACTIVIDAD_MATERIAL (
   MATERIAL_ID          INT4                 not null,
   ACTIVIDAD_PROGRAMA_ID INT4                 not null,
   constraint PK_ACTIVIDAD_MATERIAL primary key (MATERIAL_ID, ACTIVIDAD_PROGRAMA_ID)
);

/*==============================================================*/
/* Table: ACTIVIDAD_PROGRAMA                                    */
/*==============================================================*/
create table ACTIVIDAD_PROGRAMA (
   ACTIVIDAD_PROGRAMA_ID SERIAL               not null,
   PROGRADA_ID          INT4                 not null,
   PROFESIONAL_CI       CHAR(10)             null,
   ACTIVIDAD_PROGRAMA_DESCRIPCION CHAR(256)            null,
   ACTIVIDAD_PROGRAMA_TIEMPO CHAR(256)            null,
   constraint PK_ACTIVIDAD_PROGRAMA primary key (ACTIVIDAD_PROGRAMA_ID)
);

/*==============================================================*/
/* Table: ESTADO_SOCIAL                                         */
/*==============================================================*/
create table ESTADO_SOCIAL (
   ESTADO_SOCIAL_ID     SERIAL               not null,
   NINO_CI              CHAR(10)             not null,
   ESTADO_SOCIAL_TALLA_VESTIMENTA CHAR(256)            null,
   ESTADO_SOCIAL_TALLA_ZAPATOS CHAR(256)            null,
   ESTADO_SOCIAL_ALERGIAS CHAR(256)            null,
   ESTADO_SOCIAL_MEDICAMENTOS CHAR(256)            null,
   ESTADO_SOCIAL_FECHA_ENFERMO DATE                 null,
   ESTADO_SOCIAL_DIAGNOSTICO CHAR(256)            null,
   ESTADO_SOCIAL_DOCTOR CHAR(256)            null,
   constraint PK_ESTADO_SOCIAL primary key (ESTADO_SOCIAL_ID)
);

/*==============================================================*/
/* Table: MADRE                                                 */
/*==============================================================*/
create table MADRE (
   MADRE_CI             CHAR(10)             not null,
   NINO_CI              CHAR(10)             not null,
   MADRE_NOMBRE         CHAR(256)            null,
   MADRE_APELLIDO       CHAR(256)            null,
   MADRE_NACIONALIDAD   CHAR(256)            null,
   constraint PK_MADRE primary key (MADRE_CI)
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   MATERIAL_ID          SERIAL               not null,
   MATERIAL_DESCRIPCION CHAR(256)            null,
   constraint PK_MATERIAL primary key (MATERIAL_ID)
);

/*==============================================================*/
/* Table: NINO                                                  */
/*==============================================================*/
create table NINO (
   NINO_CI              CHAR(10)             not null,
   PADRE_CI             CHAR(10)             null,
   ESTADO_SOCIAL_ID     INT4                 null,
   MADRE_CI             CHAR(10)             null,
   NINO_NOMBRE          CHAR(256)            null,
   NINO_APELLIDO        CHAR(256)            null,
   NINO_GENERO          CHAR(256)            null,
   NINO_NACIONALIDAD    CHAR(256)            null,
   NINO_EDAD            NUMERIC              null,
   constraint PK_NINO primary key (NINO_CI)
);

/*==============================================================*/
/* Table: NINO_INSCRITO                                         */
/*==============================================================*/
create table NINO_INSCRITO (
   NINO_INSCRITO_ID     SERIAL               not null,
   ACTIVIDAD_PROGRAMA_ID INT4                 not null,
   NINO_CI              CHAR(10)             not null,
   NINO_INSCRITO_RENDIMIENTO CHAR(256)            null,
   NINO_INCRITO_OBSERVACION CHAR(256)            null,
   constraint PK_NINO_INSCRITO primary key (NINO_INSCRITO_ID)
);

/*==============================================================*/
/* Table: NINO_TUTOR                                            */
/*==============================================================*/
create table NINO_TUTOR (
   TUTOR_CI             CHAR(10)             not null,
   NINO_CI              CHAR(10)             not null,
   constraint PK_NINO_TUTOR primary key (TUTOR_CI, NINO_CI)
);

/*==============================================================*/
/* Table: PADRE                                                 */
/*==============================================================*/
create table PADRE (
   PADRE_CI             CHAR(10)             not null,
   NINO_CI              CHAR(10)             not null,
   PADRE_NOMBRE         CHAR(256)            null,
   PADRE_APELLIDO       CHAR(256)            null,
   PADRE_NACIONALIDAD   CHAR(256)            null,
   constraint PK_PADRE primary key (PADRE_CI)
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   PROFESIONAL_CI       CHAR(10)             not null,
   PROFESIONAL_NOMBRE   CHAR(256)            null,
   PROFESIONAL_APELLIDO CHAR(256)            null,
   PROFESIONAL_GENERO   CHAR(256)            null,
   PROFESIONAL_NACIONALIDAD CHAR(256)            null,
   PROFESIONAL_CERTIFICADO_SENECYT NUMERIC              null,
   constraint PK_PROFESIONAL primary key (PROFESIONAL_CI)
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA (
   PROGRADA_ID          SERIAL               not null,
   PROGRAMA_DESCRIPCION CHAR(256)            null,
   constraint PK_PROGRAMA primary key (PROGRADA_ID)
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR (
   TUTOR_CI             CHAR(10)             not null,
   TUTOR_NOMBRE         CHAR(256)            null,
   TUTOR_APELLIDO       CHAR(256)            null,
   TUTOR_GENERO         CHAR(256)            null,
   TUTOR_NACIONALIDAD   CHAR(256)            null,
   TUTOR_DIRECCION      CHAR(256)            null,
   TUTOR_TELEFONO       NUMERIC              null,
   TUTOR_DOMICILIO      CHAR(256)            null,
   constraint PK_TUTOR primary key (TUTOR_CI)
);

alter table ACTIVIDAD_MATERIAL
   add constraint FK_ACTIVIDA_RELATIONS_ACTIVIDA foreign key (ACTIVIDAD_PROGRAMA_ID)
      references ACTIVIDAD_PROGRAMA (ACTIVIDAD_PROGRAMA_ID)
      on delete restrict on update restrict;

alter table ACTIVIDAD_MATERIAL
   add constraint FK_ACTIVIDA_RELATIONS_MATERIAL foreign key (MATERIAL_ID)
      references MATERIAL (MATERIAL_ID)
      on delete restrict on update restrict;

alter table ACTIVIDAD_PROGRAMA
   add constraint FK_ACTIVIDA_RELATIONS_PROFESIO foreign key (PROFESIONAL_CI)
      references PROFESIONAL (PROFESIONAL_CI)
      on delete restrict on update restrict;

alter table ACTIVIDAD_PROGRAMA
   add constraint FK_ACTIVIDA_RELATIONS_PROGRAMA foreign key (PROGRADA_ID)
      references PROGRAMA (PROGRADA_ID)
      on delete restrict on update restrict;

alter table ESTADO_SOCIAL
   add constraint FK_ESTADO_S_RELATIONS_NINO foreign key (NINO_CI)
      references NINO (NINO_CI)
      on delete restrict on update restrict;

alter table MADRE
   add constraint FK_MADRE_RELATIONS_NINO foreign key (NINO_CI)
      references NINO (NINO_CI)
      on delete restrict on update restrict;

alter table NINO
   add constraint FK_NINO_RELATIONS_PADRE foreign key (PADRE_CI)
      references PADRE (PADRE_CI)
      on delete restrict on update restrict;

alter table NINO
   add constraint FK_NINO_RELATIONS_MADRE foreign key (MADRE_CI)
      references MADRE (MADRE_CI)
      on delete restrict on update restrict;

alter table NINO
   add constraint FK_NINO_RELATIONS_ESTADO_S foreign key (ESTADO_SOCIAL_ID)
      references ESTADO_SOCIAL (ESTADO_SOCIAL_ID)
      on delete restrict on update restrict;

alter table NINO_INSCRITO
   add constraint FK_NINO_INS_RELATIONS_ACTIVIDA foreign key (ACTIVIDAD_PROGRAMA_ID)
      references ACTIVIDAD_PROGRAMA (ACTIVIDAD_PROGRAMA_ID)
      on delete restrict on update restrict;

alter table NINO_INSCRITO
   add constraint FK_NINO_INS_RELATIONS_NINO foreign key (NINO_CI)
      references NINO (NINO_CI)
      on delete restrict on update restrict;

alter table NINO_TUTOR
   add constraint FK_NINO_TUT_RELATIONS_NINO foreign key (NINO_CI)
      references NINO (NINO_CI)
      on delete restrict on update restrict;

alter table NINO_TUTOR
   add constraint FK_NINO_TUT_RELATIONS_TUTOR foreign key (TUTOR_CI)
      references TUTOR (TUTOR_CI)
      on delete restrict on update restrict;

alter table PADRE
   add constraint FK_PADRE_RELATIONS_NINO foreign key (NINO_CI)
      references NINO (NINO_CI)
      on delete restrict on update restrict;


	  
/*profesionales*/
insert into profesional values('1352084949','Luis Alfredo','Delgado Bravo','masculino','ecuatoriana','014512123');
insert into profesional values('0952907780','Cinthia Carolina','Moreira Macías','femenino','ecuatoriana','014456465');
insert into profesional values('1314750603','Victor Eduardo','Lopez Parrales','masculino','ecuatoriana','014517145');
insert into profesional values('1315727139','Adriana Cristina','Gilces Peñafiel','femenino','ecuatoriana','054879123');
insert into profesional values('1316333058','Antonio Andres','Giler Macias','masculino','ecuatoriana','042367891');
/*programas*/
insert into programa values(default,'Intelectual');
insert into programa values(default,'Emocional');
insert into programa values(default,'Motriz');
/*material*/
insert into material values(default,'cuaderno');
insert into material values(default,'lapiz');
insert into material values(default,'marcadores');
insert into material values(default,'pizarron');
insert into material values(default,'cancha');
insert into material values(default,'mesas');
insert into material values(default,'sillas');
insert into material values(default,'tablets');
insert into material values(default,'hojas');
insert into material values(default,'computadoras');
/*actividad_programa*/
insert into actividad_programa values(default,1,'1352084949','curso de computacion y tecnologia','3 meses');
insert into actividad_programa values(default,1,'0952907780','lectura y escritura','2 meses');
insert into actividad_programa values(default,2,'1315727139','diccionario de emociones','1 mes');
insert into actividad_programa values(default,3,'1314750603','juegos ludicos','4 meses');
insert into actividad_programa values(default,3,'1316333058','deportes','5 meses');
/*actividad_material*/
insert into actividad_material values(6,1);
insert into actividad_material values(7,1);
insert into actividad_material values(8,1);
insert into actividad_material values(10,1);
insert into actividad_material values(1,2);
insert into actividad_material values(2,2);
insert into actividad_material values(3,2);
insert into actividad_material values(4,2);
insert into actividad_material values(6,2);
insert into actividad_material values(7,2);
insert into actividad_material values(8,2);
insert into actividad_material values(9,2);
insert into actividad_material values(10,2);
insert into actividad_material values(2,3);
insert into actividad_material values(9,3);
insert into actividad_material values(5,4);
insert into actividad_material values(6,4);
insert into actividad_material values(7,4);
insert into actividad_material values(5,5);
/*niño*/
insert into nino values('1234567890',null,null,null,'Andres','Perez Anchundia','masculino','ecuatoriana',3);
insert into nino values('1324567890',null,null,null,'Leonardo','Toala Ordoñez','masculino','ecuatoriana',3);
insert into nino values('1326547890',null,null,null,'Antonio','Giler Macias','masculino','ecuatoriana',3);
insert into nino values('1315645789',null,null,null,'Andres','Mendoza Parraga','masculino','ecuatoriana',3);
insert into nino values('1316854790',null,null,null,'Carlos','Moya Vera','masculino','ecuatoriana',3);
insert into nino values('1304567890',null,null,null,'Maryangel','Cedeño Pazmiño','femenino','ecuatoriana',4);
insert into nino values('1302457890',null,null,null,'Coraima','Intriago Barreto','femenino','ecuatoriana',4);
insert into nino values('1303124560',null,null,null,'Alisson','Perez Reyes','femenino','ecuatoriana',4);
insert into nino values('1301237890',null,null,null,'Adriana','Gilces Peñafiel','femenino','ecuatoriana',4);
insert into nino values('1324560840',null,null,null,'Luisa','Menendez Lucas','femenino','ecuatoriana',4);
/*padres*/
insert into padre values('1309784650','1326547890','Antonio','Giler Molina','croata');
insert into padre values('1345612650','1315645789','Rolando','Mendoza Chavez','estadounidense');
insert into padre values('1304789125','1316854790','Carlos','Moya Joniaux','peruano');
insert into padre values('1387952165','1304567890','Alberto','Cedeño Tuarez','ecuatoriano');
insert into padre values('1307894562','1302457890','Ramon','Intriago Loor','ecuatoriano');
insert into padre values('1302050746','1303124560','Pablo','Perez Molina','colombiano');
/*madre*/
insert into madre values('0954849841','1234567890','Soledad','Anchundia Delgado','chilena');
insert into madre values('0947851234','1324567890','Rosa','Ordoñez Barcia','colombiana');
insert into madre values('1389794654','1302457890','Patricia','Barreto Solorzano','española');
insert into madre values('1374562014','1301237890','Julia','Peñafiel Alvarado','costarisense');
insert into madre values('1364785204','1324560840','Julieta','Lucas Menendez','estadounidense');
/*tutor*/
insert into tutor values('1764554864','Luis Alfredo','Delgado Bravo','masculino','ecuatoriana','Barrio san jose',0999556240,'casa 1001');
insert into tutor values('1354565587','Pablo Fabian','Saltos Carrillo','masculino','ecuatoriana','La Proaño',0954871345,'casa 5041');
/*niño tutor*/
insert into nino_tutor values('1764554864','1234567890');
insert into nino_tutor values('1354565587','1324560840');
/*niño inscrito*/
insert into nino_inscrito values(default,1,'1234567890','regular','debe mejorar');
insert into nino_inscrito values(default,1,'1324567890','regular','debe mejorar');
insert into nino_inscrito values(default,2,'1326547890','regular','debe mejorar');
insert into nino_inscrito values(default,2,'1315645789','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,3,'1316854790','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,3,'1304567890','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,4,'1302457890','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,4,'1303124560','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,5,'1301237890','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,5,'1324560840','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,2,'1234567890','regular','debe mejorar');
insert into nino_inscrito values(default,2,'1324567890','regular','debe mejorar');
insert into nino_inscrito values(default,3,'1326547890','regular','debe mejorar');
insert into nino_inscrito values(default,3,'1315645789','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,4,'1316854790','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,4,'1304567890','bueno','muy bien siga mejorando');
insert into nino_inscrito values(default,5,'1302457890','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,5,'1303124560','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,1,'1301237890','excelente','perfecto, muy buen alumno');
insert into nino_inscrito values(default,1,'1324560840','excelente','perfecto, muy buen alumno');
/*estado social*/
insert into estado_social values(default,'1234567890','3t','23','rinitis','Allegra','2020/05/08','sangrado nasal','Coraima Intriago');
insert into estado_social values(default,'1324567890','3t','24','polen','Difenhidramina','2020/06/01','fiebre','Vielka Soledispa');
insert into estado_social values(default,'1326547890','3t','23','polvo','Allegra','2020/04/03','fiebre','Luis Santana');
insert into estado_social values(default,'1315645789','3t','24','mascotas','Difenhidramina','2020/08/22','tos','Jhon Giler');
insert into estado_social values(default,'1316854790','3t','25','moho','Difenhidramina','2020/07/28','desmayo','Maria Delgado');
insert into estado_social values(default,'1304567890','4t','26',null,null,'2020/08/12','tos','José Perez');
insert into estado_social values(default,'1302457890','4t','24','rinitis','Allegra','2020/09/15','gripe','Liz Moreira');
insert into estado_social values(default,'1303124560','4t','23',null,null,'2020/10/07','gripe','Jose Pereira');
insert into estado_social values(default,'1301237890','4t','23','polvo','Difenhidramina','2020/11/04','fiebre','Andres Angulo');
insert into estado_social values(default,'1324560840','4t','24','moho','Difenhidramina','2020/12/08','gripe','Pablo Proaño');

/*acualizar datos de niño*/
update nino set padre_ci='1309784650' where nino_ci='1326547890';
update nino set padre_ci='1345612650' where nino_ci='1315645789';
update nino set padre_ci='1304789125' where nino_ci='1316854790';
update nino set padre_ci='1387952165' where nino_ci='1304567890';
update nino set padre_ci='1307894562' where nino_ci='1302457890';
update nino set padre_ci='1302050746' where nino_ci='1303124560';

update nino set madre_ci='0954849841' where nino_ci='1234567890';
update nino set madre_ci='0947851234' where nino_ci='1324567890';
update nino set madre_ci='1389794654' where nino_ci='1302457890';
update nino set madre_ci='1374562014' where nino_ci='1301237890';
update nino set madre_ci='1364785204' where nino_ci='1324560840';


update nino set estado_social_id=1 where nino_ci='1234567890';
update nino set estado_social_id=2 where nino_ci='1324567890';
update nino set estado_social_id=3 where nino_ci='1326547890';
update nino set estado_social_id=4 where nino_ci='1315645789';
update nino set estado_social_id=5 where nino_ci='1316854790';
update nino set estado_social_id=6 where nino_ci='1304567890';
update nino set estado_social_id=7 where nino_ci='1302457890';
update nino set estado_social_id=8 where nino_ci='1303124560';
update nino set estado_social_id=9 where nino_ci='1301237890';
update nino set estado_social_id=10 where nino_ci='1324560840';


/*consultas*/
/*¿Qué estudiantes no tienen a su madre de forma activa en su vida? ¿Qué estudiantes no tienen a su padre de forma activa en su vida? */
SELECT 
nino.nino_ci as Cedula_Niño,
nino.nino_nombre as Nombre_Niño,
nino.nino_apellido as Apellidos_Niño
from nino
where nino.madre_ci is null

SELECT 
nino.nino_ci as Cedula_Niño,
nino.nino_nombre as Nombre_Niño,
nino.nino_apellido as Apellidos_Niño
from nino
where nino.padre_ci is null

/*Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.*/
select
actividad_programa.actividad_programa_descripcion as Actividad,
nino_inscrito.nino_inscrito_rendimiento as Rendimiento,
count(nino_inscrito.nino_inscrito_rendimiento)
from nino
inner join public.nino_inscrito on nino.nino_ci=nino_inscrito.nino_ci
inner join public.actividad_programa on actividad_programa.actividad_programa_id=nino_inscrito.actividad_programa_id
group by nino_inscrito.nino_inscrito_rendimiento,
actividad_programa.actividad_programa_descripcion

/*Cantidad de profesores hombres y mujeres que tiene cada programa.*/
select 
programa.programa_descripcion as Programa,
profesional.profesional_genero as genero,
count(profesional.profesional_genero) as Cantidad
from programa
inner join public.actividad_programa on programa.programa_id=actividad_programa.programa_id
inner join public.profesional on actividad_programa.profesional_ci=profesional.profesional_ci
group by profesional.profesional_genero,
programa.programa_descripcion

/*Mostrar cada profesional con su actividad programa y a que programa está vinculado dicha actividad*/
select
profesional.profesional_nombre as Nombre,
profesional.profesional_apellido as Apellido,
actividad_programa.actividad_programa_descripcion as Actividad_Programa,
programa.programa_descripcion as Programa
from profesional
inner join public.actividad_programa on profesional.profesional_ci=actividad_programa.profesional_ci
inner join public.programa on actividad_programa.programa_id=programa.programa_id
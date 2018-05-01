create table  registration
( 
  fname 			varchar(20) not null,
  mname 			varchar (20),
  lname 			varchar (20) not null,
  phone_number  	numeric (11,0) not null,
  country 			varchar(20) not null,
  division			varchar(20) not null,
  city 				varchar(20) not null,
  area 				varchar(30),
  date_of_birth		date not null,
  blood_group		varchar(5),
  gender      		varchar(10) not null,
  weight        	numeric (3,0) check (weight>45),
  status       		varchar (15),
  password      	varchar (20) not null,
  primary key  		(phone_number)
);

create Table profile
( 
  ID 				varchar (20) not null,
  picture 			varchar(50), 
  blood_report 		varchar(30),   
  primary key (ID)
); 

create table profile_notification
(
  id				int(255) AUTO_INCREMENT,
  sender_ID			varchar(20) not null,
  notification 		varchar(50),
  primary key (id, sender_ID, notification),
  foreign key(sender_ID) references profile (ID)
  on delete cascade
);

create table profile_folder
(
  id				int(255) AUTO_INCREMENT,
  profile_ID		varchar(20) not null,
  folder 			varchar(30),
  primary key (id,profile_ID, folder),
  foreign key(profile_ID) references profile (ID)
  on delete cascade
);

create Table profile_settings
(
  id				int(255) AUTO_INCREMENT,
  profile_ID 				varchar (20) not null,
  add_phone_number 	numeric (11,0),
  city 				varchar(20),
  area 				varchar(30),
  primary key(id,profile_ID, add_phone_number,city,area),
  foreign key (profile_ID) references profile(ID) on delete cascade
);

create Table success 
(
  ID 				varchar(20) not null,
  phone_number  	numeric (11,0) not null,
  primary key (ID),
  foreign key (ID) references profile(ID) on delete cascade,
  foreign key (phone_number) references registration(phone_number) on delete cascade  
);

create table chat_box
(
  id				int(255) AUTO_INCREMENT,
  sender_ID			varchar(20),
  receiver_ID		varchar(20),
  chat_ID			int(255),
  message			text,
  dtime				timestamp,
  foreign key (sender_ID) references profile(ID) on delete cascade,
  foreign key (receiver_ID) references profile(ID) on delete cascade,
  primary key (id)
  );
Create table contacts
(
  id     			int(255) AUTO_INCREMENT,
  contact_ID 		varchar(20) not null,
  me         		varchar (20) not null,
  primary key(id),
  foreign key (contact_ID) references profile(ID) on delete cascade
);
create table donation 
( 
  id				int(255) AUTO_INCREMENT,
  r_ID 				varchar (20) not null,
  d_ID 				varchar (20) not null,
  date_of_activity   date,
  status			varchar(20),
  primary key (id),
  foreign key (d_ID) references profile(ID) on delete cascade,
  foreign key (r_ID) references profile(ID) on delete cascade
);
create sequence hibernate_sequence minvalue 1000;
create table users (
        id 						integer primary key,
        user_type				varchar(31) not null,
        enabled     			boolean not null default 't',
        username 				varchar(255) unique not null,
        email 					varchar(255) unique not null,
 		password 				varchar(255) not null,
        first_name 				varchar(255) not null,
        last_name	     	    varchar(255) not null,
        street_address 			varchar(255) not null,
        city 					varchar(255) not null,
        state 					varchar(255) not null,
        zip_code 				int4 not null,
		
        area_expertise 			varchar(255),
        year_started 			int4,
        image 					bytea,
        image2 					bytea

        );   
       	insert into users values ('1','ROLE_USER','t','cysun','cysun@gmail.com','abcd','Chengyu','Sun',
       							  'Bay street East LA','Los Angeles','California','91812'); 
    	insert into users values ('2','ROLE_USER','t','tmax','tmax@gmail.com','abcd','Tmax','Longkumer',
       							  'Greek street West LA','Los Angeles','California','95052'); 
		insert into users values ('3','ROLE_LAWYER','t','max','max@gmail.com','abcd','Max','Smith',
       							  'Roman street East NJ','New Jersey','New York','32314','Business Law'); 
    	insert into users values ('4','ROLE_LAWYER','t','jerry','jerry@gmail.com','abcd','Jerry','Love',
       							  'Broadwy street West NJ','New Kentucky','New Hampshire','323314','Criminal Law','2001'); 
        insert into users values ('5','ROLE_ADMIN','t','admin','admin@gmail.com','abcd','adminFN','adminLN',
       							  'Admin street East LA','Los Angeles','California','91812');
	
create table reviews (
		id 				integer primary key,        
		title				    varchar(255) not null,
		review_description 		varchar(255) not null,
		rating_knowledge		int4 not null,
        rating_overall 			int4 not null,
        rating_service 			int4 not null,
        lawyer_id 				integer references users(id),
        user_id 				integer references users(id),
        enabled     			boolean not null default 't'
    );
    
    
    
    

	insert into reviews values ('1','Great Business Lawyer','Max is a very reliable business lawyer, 
								he was very professional and helped me get my busniess papers in 
								a very short amount of time',
								'4','5','4','3','1','t');
	insert into  reviews values('2','Awesome Criminal Lawyer','Jerry knows his stuff he is prompt,
								he is a great Criminal Lawyer',
								'3','4','5','4','2','t');
	insert into reviews values ('3','Trust worthy Business Lawyer','Max helped me get my trade licence 
								in a very professional fashioned way a great business lawyer',
								'4','3','5','3','2','t');			
	insert into  reviews values('4','Reliable Criminal Lawyer','Jerry is good with Criminal law
								and procedures he helped me with many cases',
								'5','5','3','4','1','t');
								
	
    alter table reviews add column tsv tsvector;
	update reviews set tsv = to_tsvector(review_description) || to_tsvector(title);
	
	create or replace function reviews_ts_trigger_function() returns trigger as $$

	begin
	new.tsv := to_tsvector('english', new.title) || to_tsvector('english', new.review_description);
  	return new;
	end

	$$ language plpgsql;

	create trigger reviews_ts_trigger
    before insert or update
    on reviews 
    for each row
    execute procedure reviews_ts_trigger_function();


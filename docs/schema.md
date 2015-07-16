# Schema Information

## shops
column name    | data type | details
---------------|-----------|-----------------------
id       		   | integer   | not null, primary key
owner_id   		 | integer   | not null, foreign key (references user)
address				 | string		 | not null
city		 		   | string    | not null
description 	 | text	     |
price      		 | integer   | not null
size     		   | integer   | not null

## reviews
column name | data type | details
------------|-----------|-----------------------
id					| integer		| not null, primary key
shop_id			|	integer		| not null, foreign key (references shop)
reviewer_id	| integer		| not null, foreign key (reference user)
title				| string		| not null
body 				| text			| not null


## pictures
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
shop_id     | integer   | not null, foreign key (references shop)
url         | string    | not null, unique
caption     | string    |
type 				| string		|

## reservations
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
owner_id		| integer		| not null, foreign_key (references user)
renter_id   | integer   | not null, foreign key (references user)
shop_id     | integer   | not null, foreign key (references shop)
start_day   | date      | not null
end_day     | date      | not null
approved		| boolean		| not null

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
fname           | string    |
lname           | string    |
password_digest | string    | not null
session_token   | string    | not null, unique

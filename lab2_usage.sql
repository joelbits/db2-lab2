
-- 1: all_users : 
SELECT * FROM all_users;

-- 2: friends_list : 
SELECT * FROM friends_list;
SELECT * FROM friends_list WHERE username = "cbouldon";

-- 3: user_email() : 

-- 4: add_hobby(hobby) :

-- 5: add_user(username, pass, fname, lname, email, age) : 
call add_user('NEWUSERNAME', 'newpass', 'Olle', 'Olsson', 'olle@olsson.se', 47);
-- SELECT * FROM users;
-- SELECT * FROM usershobbies;

-- 6: deleteUser(id) : 
-- call deleteUser(10);
-- SELECT * FROM users;

-- 7: add_friendship(id_a, id_b) : 
call add_friendship(1, 2);
SELECT * FROM friends;

-- 8: agecheck :

-- 9: greeting : 

-- 10: VG: hobby_friends(username) : 

-- 11: VG: suggest_friends(username) : 

-- 12: VG: users_edits : 


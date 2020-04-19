use dgsogp_data_db;
db.createUser({
	user:"dgsogp_data",
	pwd:"123456",
	roles:[{role:"dbOwner",db:"dgsogp_data_db"}]
});

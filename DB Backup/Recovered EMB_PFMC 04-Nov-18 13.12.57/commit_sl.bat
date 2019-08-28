@echo off
if x"%1" == x"" Goto Usage
if x"%2" == x"" Goto Usage
if x"%3" == x"" Goto Trust
if x"%4" == x"" Goto Trust

osql -S %1 -d %2 -U %3 -P %4 -i Tables.sql
echo Tables.sql

osql -S %1 -d %2 -U %3 -P %4 -i CONSTR~1.SQL
echo CONSTR~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i SP.sql
echo SP.sql

osql -S %1 -d %2 -U %3 -P %4 -i FUNCTI~1.SQL
echo FUNCTI~1.SQL


:Trust
osql -S %1 -d %2 -E -i Tables.sql
echo Tables.sql

osql -S %1 -d %2 -E -i CONSTR~1.SQL
echo CONSTR~1.SQL

osql -S %1 -d %2 -E -i SP.sql
echo SP.sql

osql -S %1 -d %2 -E -i FUNCTI~1.SQL
echo FUNCTI~1.SQL


Goto Exit

:Usage
	echo Usage for trust connection
	echo commit_sl.bat serv_name db_name

	echo Usage for mistrust connection
	echo commit_sl.bat serv_name db_name user_name password

:Exit

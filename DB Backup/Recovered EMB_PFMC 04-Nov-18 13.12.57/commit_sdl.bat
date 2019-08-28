@echo off
if x"%1" == x"" Goto Usage
if x"%2" == x"" Goto Usage
if x"%3" == x"" Goto Trust
if x"%4" == x"" Goto Trust

osql -S %1 -d %2 -U %3 -P %4 -i Tables.sql
echo Tables.sql

osql -S %1 -d %2 -U %3 -P %4 -i CONSTR~1.SQL
echo CONSTR~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _BONDV~1.SQL
echo _BONDV~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LOGIN~1.SQL
echo _LOGIN~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _PRINT~1.SQL
echo _PRINT~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LASTP~1.SQL
echo _LASTP~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _AUDIT~1.SQL
echo _AUDIT~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LASTA~1.SQL
echo _LASTA~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _INSWA~1.SQL
echo _INSWA~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LASTI~1.SQL
echo _LASTI~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _INSSB~1.SQL
echo _INSSB~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _INSEC~1.SQL
echo _INSEC~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _INSIH~1.SQL
echo _INSIH~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LASTC~1.SQL
echo _LASTC~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _CUSTO~1.SQL
echo _CUSTO~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _INSGE~1.SQL
echo _INSGE~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _TEST_~1.SQL
echo _TEST_~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _BONDV~2.SQL
echo _BONDV~2.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _MAS_H~1.SQL
echo _MAS_H~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _MAS_H~2.SQL
echo _MAS_H~2.SQL

osql -S %1 -d %2 -U %3 -P %4 -i _LASTH~1.SQL
echo _LASTH~1.SQL

osql -S %1 -d %2 -U %3 -P %4 -i SP.sql
echo SP.sql

osql -S %1 -d %2 -U %3 -P %4 -i FUNCTI~1.SQL
echo FUNCTI~1.SQL


:Trust
osql -S %1 -d %2 -E -i Tables.sql
echo Tables.sql

osql -S %1 -d %2 -E -i CONSTR~1.SQL
echo CONSTR~1.SQL

osql -S %1 -d %2 -E -i _BONDV~1.SQL
echo _BONDV~1.SQL

osql -S %1 -d %2 -E -i _LOGIN~1.SQL
echo _LOGIN~1.SQL

osql -S %1 -d %2 -E -i _PRINT~1.SQL
echo _PRINT~1.SQL

osql -S %1 -d %2 -E -i _LASTP~1.SQL
echo _LASTP~1.SQL

osql -S %1 -d %2 -E -i _AUDIT~1.SQL
echo _AUDIT~1.SQL

osql -S %1 -d %2 -E -i _LASTA~1.SQL
echo _LASTA~1.SQL

osql -S %1 -d %2 -E -i _INSWA~1.SQL
echo _INSWA~1.SQL

osql -S %1 -d %2 -E -i _LASTI~1.SQL
echo _LASTI~1.SQL

osql -S %1 -d %2 -E -i _INSSB~1.SQL
echo _INSSB~1.SQL

osql -S %1 -d %2 -E -i _INSEC~1.SQL
echo _INSEC~1.SQL

osql -S %1 -d %2 -E -i _INSIH~1.SQL
echo _INSIH~1.SQL

osql -S %1 -d %2 -E -i _LASTC~1.SQL
echo _LASTC~1.SQL

osql -S %1 -d %2 -E -i _CUSTO~1.SQL
echo _CUSTO~1.SQL

osql -S %1 -d %2 -E -i _INSGE~1.SQL
echo _INSGE~1.SQL

osql -S %1 -d %2 -E -i _TEST_~1.SQL
echo _TEST_~1.SQL

osql -S %1 -d %2 -E -i _BONDV~2.SQL
echo _BONDV~2.SQL

osql -S %1 -d %2 -E -i _MAS_H~1.SQL
echo _MAS_H~1.SQL

osql -S %1 -d %2 -E -i _MAS_H~2.SQL
echo _MAS_H~2.SQL

osql -S %1 -d %2 -E -i _LASTH~1.SQL
echo _LASTH~1.SQL

osql -S %1 -d %2 -E -i SP.sql
echo SP.sql

osql -S %1 -d %2 -E -i FUNCTI~1.SQL
echo FUNCTI~1.SQL


Goto Exit

:Usage
	echo Usage for trust connection
	echo commit_sdl.bat serv_name db_name

	echo Usage for mistrust connection
	echo commit_sdl.bat serv_name db_name user_name password

:Exit

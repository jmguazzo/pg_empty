pg_empty
========

Empty Visual Studio 2013 project/solution for developping PostgreSQL extensions.

This project has all configurations ready for 32bits and 64bits build.

A sample extension is present in the pg_empty.c file.

Once it's built, you can create a function in PostgreSQL with :
```
CREATE OR REPLACE FUNCTION pg_empty_example()
  RETURNS boolean AS
'pg_empty', 'pg_empty_example'
  LANGUAGE c ;
```

*If you want to include multiple projects in the same solution, you will need to change the value of the "ProjectGuid" in the vcxproj file.

Debug Configuration
-------------------
It is configured to work on a computer with PostgreSQL 9.4 64bits and PostgreSQL 9.5 32bits installed with the default installation path.

Each time you build with this configuration, the PostgreSQL service will be restarted and the dll will be placed in the lib folder of postgresql installation

- 32bits : ```C:\Program Files (x86)\PostgreSQL\9.5\lib```
- 64bits : ```C:\Program Files\PostgreSQL\9.4\lib```

*You may have to modify those output folders based on your PostgreSQL install path.

There's a .cmd file that contains batch instructions to restart the service. (Or only start it if it's not started)
- 32bits : ```restart_service_x86.cmd```
- 64bits : ```restart_service_x64.cmd```

*You will have to run Visual Studio as administrator in order to restart the service.


Release Configuration
---------------------
For this configuration, the dll will be placed in a $(Configuration)_$(Platform)\ on your solution dir

- 32bits : ```$(SolutionDir)\Release_Win32```
- 64bits : ```$(SolutionDir)\Release_x64```

You will have to manually install the DLL in the \lib folder of the PostgreSQL server.

**If you copy the dll build with Debug Configuration in the \lib folder on a machine without visual studio installed, it will fail !
*The DEBUG version looks for MSVCR120D.dll which is not installed with PostgreSQL.

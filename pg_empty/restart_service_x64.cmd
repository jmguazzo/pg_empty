@echo off
REM source http://stackoverflow.com/questions/3325081/how-to-check-if-a-service-is-running-via-batch-file-and-start-it-if-it-is-not-r

for /F "tokens=3 delims=: " %%H in ('sc query "postgresql-x64-9.4" ^| findstr "        STATE"') do (
  if /I "%%H" EQU "RUNNING" (
   net stop postgresql-x64-9.4 
  )
)

net start postgresql-x64-9.4
@echo off
REM source http://stackoverflow.com/questions/3325081/how-to-check-if-a-service-is-running-via-batch-file-and-start-it-if-it-is-not-r

for /F "tokens=3 delims=: " %%H in ('sc query "postgresql-9.5" ^| findstr "        STATE"') do (
  if /I "%%H" EQU "RUNNING" (
   net stop postgresql-9.5 
  )
)

net start postgresql-9.5
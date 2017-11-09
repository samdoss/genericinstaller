@REM Subroutine to sign, if able
@REM Usage (requires %CERTPATH% and %CERTPASS% to be set ahead of time, if needed):
@REM   signingProxy.bat FileToSign

where sign >nul 2>nul
if %errorlevel%==0 (
	sign %1
) else (
	where signtool.exe >nul 2>nul
	if %errorlevel%==0 (
		echo Signing with specified code signing certificate ...
		signtool.exe sign /f %CERTPATH% /p %CERTPASS% %1
	)
	if not %errorlevel%==0 (
		echo Unable to sign %1; skipping.
	)
)
